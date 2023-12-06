file(REMOVE_RECURSE
  "BatchMode"
  "CMakeFiles/test_suite"
  "HardwareFaults"
  "MakefileGeneration"
  "PROGRAMS"
  "SoftwareFaults"
  "Traces"
  "test_suite.yaml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/test_suite.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
