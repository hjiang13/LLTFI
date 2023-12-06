//LoopInfoPass20.cpp -- to generate loop nesting tree based on LoopInfoPass.cpp
// Main ides is generate loop hirearchy of esch function first. 
// Then link all the loop hirearchys to forest 
// using function callee and caller denpendency 
// If I can do this, how about pin tools?

#include "llvm/ADT/Statistic.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/InstIterator.h"
#include <llvm/IR/Instructions.h>
#include <llvm/Analysis/LoopInfo.h>
#include "llvm/ADT/StringRef.h"
#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include "/home/hjiang/LLTFI/llvm_passes/hardware_failures/json.hpp"
#include <cstdlib>
#include <sstream>

#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Value.h"
#include "/home/hjiang/LLTFI/llvm_passes/core/Utils.h"

using namespace llvm;
using namespace std;
using namespace llfi;


using json = nlohmann::json;

namespace {
  class FunctionInfo : public FunctionPass {
  public:
    static char ID;
    FunctionInfo() : FunctionPass(ID) { }
    ~FunctionInfo() { }

    int global_loop_id = 0;
    map<int,map<Loop*,int>> loop_levels;
    
    // We don't modify the program, so we preserve all analyses
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesAll();
      AU.addRequired<LoopInfoWrapperPass>();
    }

    // Do some initialization
    bool doInitialization(Module &M) override {
      errs() << "Loop Information Pass\n"; // TODO: remove this.
      // outs() << "Name,\tArgs,\tCalls,\tBlocks,\tInsns\n";

      return false;
    }

    //find if a loop has a sub loop
    string hasSubLoops(Loop* l){
      if(l->getSubLoops().size()){
        return "true";
      }else{
        return "false";
      }
    }

    //A loop is either top-level in a function 
    //(that is, it is not contained in any other loop) 
    //or it is entirely enclosed in some other loop. 
    //If a loop is top-level, it has no parent, 
    //otherwise its parent is the innermost loop in which it is enclosed.
  //  Loop* toGetParentLoop(Loop* l){
  //      return getParentLoop(l);

  //  }

    //find basic blocks(top-level)
    int getTopLevelBasicBlocksCount(Loop* l){
      int bb_count = 0;
      for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        bb_count++;
      }
      for(Loop* sl: l->getSubLoops()){
        
        for(Loop::block_iterator sbi = sl->block_begin(); sbi!=sl->block_end(); sbi++){
          bb_count--;
        }
      }
      return bb_count;
    }

    //find all instructions count
    int getInstructionsCount(Loop* l){
      int instr_count = 0;
      for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        BasicBlock *bb = *bi;
        for(Instruction &i: *bb){
          instr_count++;
        }
      }
      return instr_count;
    }
    
    //find the name of function called 
    //and the function called only shows in the closest loop

    vector<string> getFunctionCalled(Loop* l){
      vector<string> nameArray(0);
      StringRef name = "None";
      LoopInfo& loops = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        BasicBlock *bb = *bi;
        for(Instruction &i: *bb){
          //tranverse all instructions in this funtion
          //if inst. is function call instruction:
          // BB = inst.getParent(inst.)
          // inner most loop = loops.getLoopFor(BB)
          if (isa<CallInst>(i)) {
            BasicBlock *parentBB = i.getParent();
            Loop *innerMostLoop = loops.getLoopFor(parentBB);
            //errs() << innerMostLoop << "\n";
            // if the innder most loop is the one being traversed, 
            //then the function is called in this loop
            if (innerMostLoop == l){
              name = cast<CallInst>(i).getCalledFunction()->getName();
              nameArray.push_back(string(name));
              //errs() <<"\"" << name << "\",";
            }
           }

        }
      }
      return nameArray;
    }

    //find all atomic instructions count
    int getAtomicOperationsCount(Loop *l){
      int atomic_instr_count = 0;
      for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        BasicBlock *bb = *bi;
        for(Instruction &i: *bb){
          if(i.isAtomic())
	    atomic_instr_count++;
        }
      }
      return atomic_instr_count;
    }

    //find all top level branch instructions count
    int getTopLevelBranchInstructionsCount(Loop *l){
      int top_branch_instr_count = 0;
      for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        BasicBlock *bb = *bi;
        for(Instruction &i: *bb){
          if(BranchInst *bri = dyn_cast<BranchInst>(&i))
	    top_branch_instr_count++;
        }
      }
      for(Loop* sl: l->getSubLoops()){
        
        for(Loop::block_iterator sbi = sl->block_begin(); sbi!=sl->block_end(); sbi++){
          BasicBlock *bb = *sbi;
          for(Instruction &i: *bb){
            if(BranchInst *bri = dyn_cast<BranchInst>(&i))
	      top_branch_instr_count--;
          }
        }
      }
      return top_branch_instr_count;
    }

    //find depth
    void findDepth(Loop* l, int d){
      vector<Loop*> children = l->getSubLoops();
           
      for(vector<Loop*>::iterator sl=children.begin(); sl!=children.end(); sl++){
        Loop *lp = *sl;
	      map<Loop*, int> temp = {{lp,d+1}};
	      loop_levels[global_loop_id++] = temp;
        findDepth(lp, d+1);
      }
      
    }

    vector<string> getChidrenLoops(Loop* l){
      vector<string> loopArray(0);
      vector<Loop*> children = l->getSubLoops();
      for(vector<Loop*>::iterator sl=children.begin(); sl!=children.end(); sl++){
        Loop *lp = *sl;
        string loopPointer = pointerToString(lp);
        loopArray.push_back(loopPointer);
      }
      return loopArray;
    }

    //Find the source code line number of a loop l
    //refer to llfi
    //https://github.com/DependableSystemsLab/LLTFI/blob/48db2dadb553fc698eac272a626a4145201e077e/llvm_passes/core/LLFIDotGraphPass.cpp
    string getLineNumb(Loop *l){
      //LoopInfo& loops = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      //for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
        Loop::block_iterator bi = l->block_begin();
        BasicBlock *bb = *bi;
        for(Instruction &i: *bb){
       // errs()<<i<<"\n";
       // Instruction *i = l->getLatchCmpInst();
        DebugLoc dbgloc = i.getDebugLoc();

        errs()<< dbgloc.getLine() << "\n";
        return std::to_string(dbgloc.getLine());
       // if (bool(dbgloc) && dbgloc.getLine())
          //printf("Got in debug location\n");
       //   errs()<< dbgloc.getLine()<<"\n";
      }
    }
    // Print output for each function
    //errs()<<"LoopId, Function name, Line number, depth, if has subloops, top level basic block count, instruction count, function called "<<"\n";
    string pointerToString (llvm::Loop * pointer){
      const void * address = static_cast<void*>(pointer);
      std::stringstream ss;
      ss << address;  
      std::string name = ss.str(); 
      return name;
    }

    string ICmpPointerToString (llvm::ICmpInst * pointer){
      const void * address = static_cast<void*>(pointer);
      std::stringstream ss;
      ss << address;  
      std::string name = ss.str(); 
      return name;
    }  

    ICmpInst* getLatchCMP (Loop *l){
      ICmpInst * icmp = l->getLatchCmpInst();

    //  BasicBlock * latch = l->getLoopLatch();
    //  for(Instruction &i: *latch){
        if (icmp->getOpcode()){
            errs() <<"Latch basicBloks: OpCode of "<< icmp << " is : "<< icmp->getOpcode() << "\n";
    //        //return pointerToString(i);
        }
    //  }        
     // errs() << icmp <<"\n";
    //  errs() << latch <<"\n";
      //debug
    //  for(Loop::block_iterator bi = l->block_begin(); bi!=l->block_end(); bi++){
    //    BasicBlock *bb = *bi;
    //    for(Instruction &i: *bb){
    //      errs() <<"INnside basicBloks" << bb << ": OpCode of "<< i << " is : "<< i.getOpcode() << "\n";
    //    }
    //  }          

      return icmp;
    }  

    bool runOnFunction(Function &F) override {
      int initialIdx = global_loop_id;
      LoopInfo& loops = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      
      ofstream jsonFile ("./loopInfo.json", ios_base::out | ios_base::app);

      for(LoopInfo::iterator it = loops.begin(), e=loops.end(); it != e; ++it){
        Loop *l = *it;
	      map<Loop*, int> temp = {{l,0}};
	      loop_levels[global_loop_id++] = temp;
	      findDepth(l,0);
      }
  
      for(int i = initialIdx; i < global_loop_id; i++){
      	map<Loop*,int> loopDetails = loop_levels[i];
	      for (auto itr = loopDetails.begin(); itr != loopDetails.end(); ++itr) { 
          json j;
          string loopIndex = std::to_string(i);
          j[loopIndex]["Function"] = string(F.getName());
          //j["loopIndex"] = i;
          j[loopIndex]["loopID"] = string(F.getName()) + "." + pointerToString(itr->first);
          j[loopIndex]["CmpInst"] = ICmpPointerToString(getLatchCMP(itr->first));
          //
          j[loopIndex]["depth"] = itr->second;
          j[loopIndex]["functionCalled"] = getFunctionCalled(itr->first);
          j[loopIndex]["childrenLoops"] = getChidrenLoops(itr->first);
          //j[loopIndex]["lineNumber"] = getLineNumb(itr->first);
          //j[loopIndex]["fi_index"] = to_string(llfi::getLLFIIndexofInst(getLatchCMP(itr->first)));
          if (getLatchCMP(itr->first))
          {
            errs() << "Trying to get llfi index of index " << getLatchCMP(itr->first) << "\n";
            errs() << llfi::getLLFIIndexofInst(getLatchCMP(itr->first)) << "\n";
          }
          
          
          //jsonFile <<"{ \"Function\": \"" << string(F.getName()) << "\", \n"
          //<<"\"loopIndex\": \"" << to_string(i) <<"\", \n"//loopIndex
          //<<"\"loopID\": \""<< string(F.getName()) <<"." << std::stringstream(void * (itr->first)) <<"\", \n" //loopId: functionName.loopPointer
          //<<", "<<getLineNumb(itr->first) //getLineNumb
          //<<"\"depth\": \""<< to_string(itr->second) << "\", \n" //depth
          //<<", "<<hasSubLoops(itr->first) //if has Subloops 
          //<<", "<<getTopLevelBasicBlocksCount(itr->first)
          //<<", "<<getInstructionsCount(itr->first);
          //<<", atomics="<<getAtomicOperationsCount(itr->first)
          //<<", branches="<<getTopLevelBranchInstructionsCount(itr->first)
          //<<", " << getFunctionCalled(itr->first)<<"\n";
          //<< "\"functionCalled\":  [";
          //getFunctionCalled(itr->first);
          //errs() << "],"<<"\n"
          //<< "\"childrenLoops\":  [";
          //getChidrenLoops(itr->first);
          //errs() << "]"<<"\n" <<"}, \n";
          //errs()<<"\n";
          jsonFile << std::setw(4) << j << "," << std::endl;
    	  } 
	
      }
      jsonFile.close();
      return false;
    }
  };
}


// LLVM uses the address of this static member to identify the pass, so the
// initialization value is unimportant.
char FunctionInfo::ID = 0;
static RegisterPass<FunctionInfo> X("function-info90", "Function Information", false, false);