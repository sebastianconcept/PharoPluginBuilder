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
add_library(${PROJECT_NAME} SHARED src/generated/64/plugins/src/StarterPlugin/StarterPlugin.c)

#Add the VM dependency
add_subdirectory(dependencies/pharo-vm)
target_link_libraries(${PROJECT_NAME} PharoVMCore)
target_include_directories(${PROJECT_NAME}
    PRIVATE
    ${PharoVM_BINARY_DIR}/build/include/pharovm/
    ${PharoVM_BINARY_DIR}/build/include/pharovm/
    ${PharoVM_SOURCE_DIR}/include/pharovm/
    ${PharoVM_SOURCE_DIR}/extracted/vm/include/common
    ${PharoVM_SOURCE_DIR}/extracted/vm/include/osx)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})
  
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
