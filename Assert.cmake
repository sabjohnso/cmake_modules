
macro(assert expr msg)
  if(${expr})
  else()
    message(FATAL_ERROR "Assertion failed: ${expr}")
  endif()
endmacro()
