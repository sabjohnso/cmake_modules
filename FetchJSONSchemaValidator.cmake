include(FetchContent)


FetchContent_Declare(
  json_schema_validator
  GIT_REPOSITORY https://github.com/pboettch/json-schema-validator.git)

FetchContent_GetProperties(json_schema_validator)
if(NOT json_schema_validator_POPULATED)
  FetchContent_Populate(json_schema_validator)
  set(JSON_BuildTests OFF CACHE INTERNAL "")

  if(TARGET nlohmann_json)
    add_library(json-hpp ALIAS nlohmann_json)
  endif()

  add_subdirectory(${json_schema_validator_SOURCE_DIR} ${json_schema_validator_BINARY_DIR})

endif()
