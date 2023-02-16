cmake_minimum_required(VERSION 3.13)
cmake_policy(SET CMP0053 NEW)

# Our Plugin project
project(StarterPlugin VERSION 1.0.0)


# Set the build type
message("CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")

IF(CMAKE_BUILD_TYPE MATCHES Debug)
  message("Debug build.")
ELSEIF(CMAKE_BUILD_TYPE MATCHES Release)
  message("Release build.")
ELSE()
  message("Other (not Debug nor Release type of build)")
ENDIF()

# The source of the library we want to build
add_library(${PROJECT_NAME} src/generated/64/plugins/src/StarterPlugin/StarterPlugin.c)

add_subdirectory(dependencies/pharo-vm)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})

target_include_directories(${PROJECT_NAME}
  PUBLIC src/generated/64/plugins/src/StarterPlugin
  PRIVATE dependencies/pharo-vm
  PRIVATE dependencies/pharo-vm/build/build/include/pharovm
  PRIVATE dependencies/pharo-vm/build/generated/64/vm/include
  PRIVATE dependencies/pharo-vm/extracted/vm/include/osx
  PRIVATE dependencies/pharo-vm/extracted/vm/include/common
  PRIVATE dependencies/pharo-vm/include/pharovm/
  PRIVATE dependencies/pharo-vm/extracted/vm/include/
  PRIVATE dependencies/pharo-vm/include/
  )
  
  # Try next:
  # PRIVATE dependencies/shinythirdparty/target/debug

target_link_directories(${PROJECT_NAME} 
  PRIVATE src/generated/64/plugins/src/StarterPlugin
)

# Try next:
# target_link_directories(${PROJECT_NAME} 
#   PRIVATE shinythirdparty
# )

# Try next:
# target_link_libraries(${PROJECT_NAME} 
#   shinythirdparty)
