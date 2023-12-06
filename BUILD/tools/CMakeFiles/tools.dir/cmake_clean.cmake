file(REMOVE_RECURSE
  "CMakeFiles/tools"
  "FIDL/tests"
  "GenerateMakefile"
  "compiletoIR"
  "tracediff"
  "traceontograph"
  "tracetodot"
  "tracetools.py"
  "traceunion"
  "zgrviewer/run.sh"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/tools.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
