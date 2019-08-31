include(FetchContent)

option( FORCE_DOWNLOAD_GTEST "Download GTesT even if it is installed" OFF)

if(NOT FORCE_DOWNLOAD_GTEST)
  find_package(GTest)
endif()

if(NOT GTest_FOUND)
  FetchContent_Declare(googletest
    GIT_REPOSITORY https://github.com/google/googletest)

  FetchContent_GetProperties(googletest)
  if(NOT googletest_POPULATED)
    FetchContent_Populate(googletest)
    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR} EXCLUDE_FROM_ALL)
  endif()

  add_library(GTest::gtest ALIAS gtest)
  add_library(GTest::gtest_main ALIAS gtest_main)
  add_library(GTest::gmock ALIAS gmock)
  add_library(GTest::gmock_main ALIAS gmock_main)

endif()

