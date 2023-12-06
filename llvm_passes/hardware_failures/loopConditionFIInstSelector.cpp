#include "llvm/IR/Instructions.h"

#include "FIInstSelector.h"
#include "FICustomSelectorManager.h"



using namespace llvm;

namespace llfi {

/**
 * Hailong Jiang 10/30/2022
 * This sample instruction selector only selects cmp instructions of loop condition  
 */
// TODO: enable custom selctor to have more sources of options, e.g. read from
// config file
class loopConditionFIInstSelector: public HardwareFIInstSelector {
 private:
  
  virtual bool isInstFITarget(Instruction *inst) {
    //Logic to tell is a inst is loop condition inst:
    //if (i == inst ->get parent BB -> get parent loop -> getLatchCmpIst)
    // return true 
    //LoopInfo& loops = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
    BasicBlock *parentBB = inst->getParent();
    //Loop *loops = parentBB->getParent();
    //Loop *innerMostLoop = loops->getLoopFor(parentBB);
    //if (inst == innerMostLoop->getLatchCmpInst())
    //    return true;
    //else 
    //    return false;
	    
  }
 public:
 	virtual void getCompileTimeInfo(std::map<std::string, std::string>& info){
    info["failure_class"] = "HardwareFault";
    info["failure_mode"] = "OnlyLoopCondition";
    info["targets"] = "<instructions in loop condition>";
    info["injector"] = "<fi_type>";
  }
};


static RegisterFIInstSelector X("onlyloopcondition", new loopConditionFIInstSelector());
}
