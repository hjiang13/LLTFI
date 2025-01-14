
#include "Utils.h"
#include <iostream>
#include <fstream>
#include "json.hpp"
#include <cstdlib>
#include <sstream>

using namespace std;
using json = nlohmann::json;
namespace llfi {

std::string demangleFuncName(std::string func) {
  std::string ret =  func;
  // Check for name mangling. C++ functions will always start with _Z
  // Demangled form is processed to remove type information.
  if(func[0] == '_' && func[1] == 'Z') {
    int stat;
    char *test = itaniumDemangle(func.c_str(), NULL, NULL, &stat);
    std::string demangled = test;
    free(test);

    // Select up to the first ( to only insert function name
    size_t endpos = demangled.find("(");

    // Templated functions will have type information first, so skip to the
    // first space.
    size_t startpos = demangled.find(" ");
    if(startpos < endpos) {
      // skip until after the space
      ++startpos;
      // also modify endpos to the first '<' to remove template info
      endpos = demangled.find("<") - startpos;
    } else {
      // regular C++ function, no template info to remove
      startpos = 0;
    }

    ret = demangled.substr(startpos,endpos);
  }

  return ret;
}

std::string intToString(int i) {
  std::stringstream s;
  s << i;
  return s.str();
}

std::string longToString(long i) {
  std::stringstream s;
  s << i;
  return s.str();
}

Instruction *getTermInstofFunction(Function *func) {
  BasicBlock &termbb = func->back();
  Instruction *ret = termbb.getTerminator();

  assert(isa<ReturnInst>(ret) || isa<ResumeInst>(ret) ||
         isa<UnreachableInst>(ret) &&
         "Last instruction is not return or resume or exit() instruction");
  return ret;
}

void getAllTermInstofFunction(Function *func, std::set<Instruction*> &exitinsts) {
  
  for (auto i = inst_begin(func); i != inst_end(func); i++) {	
    Instruction* ret = &*i;	

    if (isa<ReturnInst>(ret) || isa<ResumeInst>(ret) ||
         isa<UnreachableInst>(ret))
	    exitinsts.insert(ret);
  }
}

void getProgramExitInsts(Module &M, std::set<Instruction*> &exitinsts) {
  for (Module::iterator m_it = M.begin(); m_it != M.end(); ++m_it) {
    if (!m_it->isDeclaration()) {
      //m_it is a function
      for (inst_iterator f_it = inst_begin(&*m_it); f_it != inst_end(&*m_it);
           ++f_it) {
        Instruction *inst = &(*f_it);
        if (CallInst *ci = dyn_cast<CallInst>(inst)) {
          Function *calledFunc = ci->getCalledFunction();
          if (calledFunc && calledFunc->hasName() &&
              calledFunc->getName().str() == "exit") {
            exitinsts.insert(inst);
          }
        }
      }
    }
  }

  Function* mainfunc = M.getFunction("main");
  getAllTermInstofFunction(mainfunc, exitinsts);
}

Instruction *getInsertPtrforRegsofInst(Value *reg, Instruction *inst) {
  // TODO: This insert points can be extended later
  // TODO: different checks may be needed for different versions of llvm
  if (reg == inst) {
    // inject into destination reg, insert after inst
    if (inst->isTerminator()) {
      errs() << "ERROR: LLFI not able to inject into destination register of "
          << *inst << ", change isRegofInstInjectable() to fix it\n";
      exit(2);
    } else {
      BasicBlock::iterator bb_it(inst);
      while (isa<PHINode>(++bb_it)) ;
      return &*bb_it;
    }
  } else {
    // Assume the reg is the src of inst, insert before inst
    if (isa<PHINode>(inst)) {
      errs() << "ERROR: LLFI not able to inject into source register of " <<
          *inst << ", change isRegofInstInjectable to fix it\n";
      exit(2);
    }
    return inst;
  }
}

Instruction* changeInsertPtrIfInjectFaultInst(Instruction *inst) {
  MDNode *mdnode = inst->getMetadata("llfi_injectfault");
  if (mdnode) {
    if (((MDString *)mdnode->getOperand(0).get())->getString() == "after") {
      return inst->getNextNonDebugInstruction();
    } else {
      return inst;
    }
  } else {
    return inst;
  }
}

void setInjectFaultInst(Value *reg, Instruction *inst, Instruction *ficall) {
  Function *func = inst->getParent()->getParent();
  LLVMContext &context = func->getContext();

  MDString *s;
  if (reg == inst) {
    s = MDString::get(context, "after");
  } else {
    s = MDString::get(context, "before");
  }

  MDNode *node = MDNode::get(context, s);
  ficall->setMetadata("llfi_injectfault", node);
}

long getLLFIIndexofInst(Instruction *inst) {
  MDNode *mdnode = inst->getMetadata("llfi_index");
  if (mdnode) {
    Constant *cns =
        dyn_cast<ConstantAsMetadata>(mdnode->getOperand(0))->getValue();
    ConstantInt *cns_index = dyn_cast<ConstantInt>(cns);
    return cns_index->getSExtValue();
  } else {
    errs() << "ERROR: LLFI indices for instructions are required for the pass, "
        << "please run genllfiindexpass first\n";
    exit(3);
  }
}

static long fi_index = 1;
void setLLFIIndexofInst(Instruction *inst) {
  assert (fi_index >= 0 && "static instruction number exceeds index max");
  Function *func = inst->getParent()->getParent();
  LLVMContext &context = func->getContext();
  std::vector<Metadata *> llfiindex(1);
  llfiindex[0] = ConstantAsMetadata::get(
      ConstantInt::get(Type::getInt64Ty(context), fi_index++));
  ArrayRef<Metadata *> llfiarr(llfiindex);
  MDNode *mdnode = MDNode::get(context, llfiarr);
  inst->setMetadata("llfi_index", mdnode);
  //errs() << "To set LLFI index of Inst:" << &inst << " , and fi_index is: " << fi_index << "\n";
  ofstream jsonFile ("./fiindexLinenumberMap.json", ios_base::out | ios_base::app);
  json j;

  llvm::DebugLoc dbgloc = inst->getDebugLoc();
  if(dbgloc){
    errs() << " and is in source code line: " << dbgloc.getLine() << "\n";
    j[to_string(fi_index)]["Function:"] = func->getName();
    j[to_string(fi_index)]["fi_index_LineNumber"] = to_string(dbgloc.getLine()) ;
    }
  //errs() << "fi_index: " << fi_index <<" is in Function: " << func->getName() <<"\n";
  
  //to get the source code line number of this instruction 
  jsonFile << std::setw(4) << j << std::endl;
  
}

void genFullNameOpcodeMap(
    std::map<std::string, unsigned> &opcodenamemap) {
#define HANDLE_INST(N, OPC, CLASS) \
  opcodenamemap[std::string(Instruction::getOpcodeName(N))] = N;
#include "llvm/IR/Instruction.def"
}

//Returns true if the function is indexed by llfi
//(and therefore we should perform trace/fault injects on it)
bool isLLFIIndexedInst(Instruction *inst) {
  MDNode *mdnode = inst->getMetadata("llfi_index");
  if (mdnode) {
    return true;
  } else {
   return false;
 }
}

//======== Add opcode_str QINING @SEP 13th========
GlobalVariable* findOrCreateGlobalNameString(Module &M, std::string name)
{
	LLVMContext& context = M.getContext();
	std::string str_suffix = std::string("_namestr");
	GlobalVariable* nameStr = M.getGlobalVariable(name+str_suffix, true);
	if(nameStr != NULL)
	{
		//found
		return nameStr;
	}
	//not found
	//dbgs()<<"\t\t\tNeed new name_str: "<<name+str_suffix<<"\n";
	//construction the container name
	std::string gv_nameStr = name + str_suffix;
	//get the string content
	Constant* name_c = ConstantDataArray::getString(context, name);
	//nameStr = new GlobalVariable(M, AT, true, GlobalVariable::InternalLinkage,
	//create a new container named as gv_nameStr with content as name_c
	nameStr = new GlobalVariable(name_c->getType(), true, GlobalVariable::InternalLinkage, name_c, gv_nameStr.c_str());
	//add to global list
	M.getGlobalList().push_back(nameStr);
	return nameStr;
}
//================================================

}
