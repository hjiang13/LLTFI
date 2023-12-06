#include "llvm/IR/Instructions.h"

#include "InstTypeFIInstSelector.h"

#include <fstream>
#include "json.hpp"
#include <vector>
#include <string>

#include <iostream>

#include <cstdlib>
#include <sstream>

using namespace llvm;
using namespace std;
using json = nlohmann::json;

namespace llfi{   
    string pointerToString (Instruction * pointer){
      const void * address = static_cast<void*>(pointer);
      std::stringstream ss;
      ss << address;  
      std::string name = ss.str(); 
      return name;
    } 

  bool InstTypeFIInstSelector::isInstFITarget(Instruction *inst) {
    
    //Read all latch cmpinst from '/home/hjiang/llvm-project/loop-info-llvm/loopInfo.json'
    //Store all latch cmp into a vector
    //vector<string> latchCMPInstructions;
    //std::ifstream f("/home/hjiang/llvm-project/loop-info-llvm/loopInfo.json");
    //json j_object = json::parse(f);

    //for (auto it = j_object.begin(); it != j_object.end(); ++it)
    //{
    //  errs() << "key: " << it.key() ;
      //latchCMPInstructions.push_back(it.value()["CmpInst"]);
    //}
    unsigned opcode = inst->getOpcode();
    Function *funct = inst->getParent() -> getParent();

    if (opcodelist->find(opcode) != opcodelist->end() ) {
      errs() << "(Hailong )The opcode of InstTypeFIInstSelector is: " <<opcode << "\n";
      //string key = pointerToString(inst) ;
      //if (std::find(latchCMPInstructions.begin(), latchCMPInstructions.end(), key) != latchCMPInstructions.end())
      //  return true;
    }
    return false;
  }
  
}


