#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "Utils.h"



static long long unsigned opcodecount[OPCODE_CYCLE_ARRAY_LEN] = {0};
static int indexcount[100000] = {0};

// declare a dictionary key:value = index:cycles

//read loop-index info before this

//void doProfiling(int opcode, int index) { // add another argument index as input (Hailong Jiang)
void doProfiling(int opcode1, int index) {  //FILE *profileFile;
  //char profilefilename[80] = "llfi.stat.prof.txt";
  //profileFile = fopen(profilefilename, "w");
  //if (profileFile == NULL) 
  //  fprintf(stderr, "Do profling on opcode: %d \n", opcode);
  assert(opcodecount[opcode1] >= 0 && 
         "dynamic instruction number too large to be handled by llfi");
  //printf ("Hailong Jiang: doProfiling funcytion is running \n");
  opcodecount[opcode1]++;
  indexcount[index]++;
}

//void countingIndex(int index){

//}

void endProfiling() {
  FILE *profileFile;
  
  char profilefilename[80] = "llfi.stat.prof.txt";
  
  profileFile = fopen(profilefilename, "w");
  
  if (profileFile == NULL) {
    fprintf(stderr, "ERROR: Unable to open profiling result file %s\n", 
            profilefilename);
    exit(1);	
  }

  int opcode_cycle_arr[OPCODE_CYCLE_ARRAY_LEN];
  getOpcodeExecCycleArray(OPCODE_CYCLE_ARRAY_LEN, opcode_cycle_arr);

  unsigned i = 0;
  long long unsigned total_cycle = 0;
  long long unsigned icmp_cycle = 0;
  for (i = 0; i < 100; ++i) {
    assert(total_cycle >= 0 && 
            "total dynamic instruction cycle too large to be handled by llfi");
    if (opcodecount[i] > 0) {	
      assert(opcode_cycle_arr[i] >= 0 && 
          "opcode does not exist, need to update instructions.def");
      total_cycle += opcodecount[i] * opcode_cycle_arr[i];
      fprintf(profileFile, "Count on opcode: %d\n", i);
      fprintf(profileFile, "opcodecount[%d]: %lld\n", i, opcodecount[i]);
      fprintf(profileFile, "opcode_cycle_arr[%d]: %d\n", i, opcode_cycle_arr[i]);
    }
  }
  icmp_cycle = opcodecount[53] * opcode_cycle_arr[53];
  fprintf(profileFile, "icmp_cycle = %lld\n", icmp_cycle);
  fprintf(profileFile, "# do not edit\n");
  fprintf(profileFile, 
          "# cycle considered the execution cycle of each instruction type\n");
  fprintf(profileFile, "total_cycle=%lld\n", total_cycle);
  for (int i = 0; i < 10000; i++){
  fprintf(profileFile, "%d : %d \n", i, indexcount[i]);
  }
	fclose(profileFile); 
  /*
  FILE *countFile;
  char countfilename[80] = "llfi.dynamic.cylce.txt";
  countFile = fopen(countfilename, "w");
  fprintf(countFile, "index : cycles \n" );
  for (int i = 0; i < 10000; i++){
  fprintf(countFile, "%d : %d \n", i, indexcount[i]);
  }
  fclose(countFile);
  */
}
