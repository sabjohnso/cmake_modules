#
# ... Add a test executable
#
function( add_test_executable )
  set( optkeys "" )
  set( valkeys NAME EXENAME )
  set( mulkeys SOURCE_FILES DEPENDENCIES ARGUMENTS )

  cmake_parse_arguments( ARG "${optkeys}" "${valkeys}" "${mulkeys}" ${ARGN} )
  
  if( NOT ARG_NAME )
    message( FATAL_ERROR "NAME was not provide to add_test_executable: ${ARGN}")
  endif()

  if( NOT ARG_EXENAME )
    message( FATAL_ERROR "EXENAME was not provided to add_test_executable: ${ARGN}" )
  endif()

  if( NOT ARG_SOURCE_FILES )
    message( FATAL_ERROR "No source files were provided to add_test_executable: ${ARGN}" )
  endif()

  add_executable( ${ARG_EXENAME} ${ARG_SOURCE_FILES} )
  if( ARG_DEPENDENCIES )
    target_link_libraries(${ARG_EXENAME} PRIVATE ${ARG_DEPENDENCIES})
  endif()
  
  add_test( ${ARG_NAME} ${ARG_EXENAME} )

endfunction()
