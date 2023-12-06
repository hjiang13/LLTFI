#include "llvm/IR/Instructions.h"

#include "InstTypeFIInstSelector.h"


namespace llfi {
bool InstTypeFIInstSelector::isInstFITarget(Instruction *inst) {
  unsigned opcode = inst->getOpcode();
  Function *funct = inst->getParent() -> getParent();
  if (opcodelist->find(opcode) != opcodelist->end()) {
    return true;
  }
  return false;
}

}