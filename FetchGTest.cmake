include(FetchContent)
include(Assert)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest)

FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
  FetchContent_Populate(googletest)
  add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
endif()

if(NOT TARGET google::gtest)
  add_library(google::gtest ALIAS gtest)
  add_library(google::gtest_main ALIAS gtest_main)
  add_library(google::gmock ALIAS gmock)
  add_library(google::gmock_main ALIAS gmock_main)
endif()
