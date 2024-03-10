# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appPlanets_informations_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appPlanets_informations_autogen.dir\\ParseCache.txt"
  "appPlanets_informations_autogen"
  )
endif()
