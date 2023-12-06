file(REMOVE_RECURSE
  "CMakeFiles/test_suite-SCRIPTS"
  "build_prog.py"
  "check_injection.py"
  "clean_prog.py"
  "clear_all.py"
  "clear_llfi.py"
  "deploy_prog.py"
  "inject_prog.py"
  "llfi_test"
  "test_generate_makefile.py"
  "test_trace_tools.py"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/test_suite-SCRIPTS.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
