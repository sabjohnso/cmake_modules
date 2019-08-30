include(FetchContent)

option( FORCE_DOWNLOAD_NLOHMANN_JSON "Download NLohmann JSON even if it is installed" OFF)

if(NOT FORCE_DOWNLOAD_NLOHMANN_JSON)
  find_package(nlohmann_json)
endif()

if(NOT nlohmann_json_FOUND)
  FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY https://github.com/nlohmann/json.git)
  
  FetchContent_GetProperties(nlohmann_json)
  if(NOT nlohmann_json_POPULATED)
    FetchContent_Populate(nlohmann_json)
    set(JSON_BuildTests OFF CACHE INTERNAL "")
    add_subdirectory(${nlohmann_json_SOURCE_DIR} ${nlohmann_json_BINARY_DIR})
  endif()
endif()
