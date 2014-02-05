#-----------------------------------------------------------------------------
#
#  Copyright (C) 2011, 2012, Jonathan Bronson
#  Scientific Computing  &  Imaging Institute
#  University of Utah
#
#
#  Permission is hereby  granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to  use, copy, modify,  merge, publish, distribute, sublicense,
#  and/or  sell  copies of  the Software, and  to permit persons to whom the
#  Software is  furnished to  do so,  subject  to  the following conditions:
#
#  The above copyright notice  and  this permission notice shall be included
#  in all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING  BUT NOT  LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A  PARTICULAR PURPOSE AND  NONINFRINGEMENT. IN  NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER  IN  AN  ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT  OF  OR IN  CONNECTION  WITH THE  SOFTWARE  OR  THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.
#-----------------------------------------------------------------------------

# Export the library named library_name and all the necessary variables

MACRO(CLEAVER_EXPORT_LIBRARY)
  IF (DEFINED LIBRARY_TO_EXPORT)
    SET(target ${LIBRARY_TO_EXPORT})
  ELSE()
    SET(target ${PROJECT_NAME})
  ENDIF()

  SET_PROPERTY(GLOBAL APPEND PROPERTY Cleaver_INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    )
    
  IF (TARGET ${target})
    SET_PROPERTY(GLOBAL APPEND PROPERTY Cleaver_LIBRARIES
      ${target}
      )

    IF(WIN32)
      GET_TARGET_PROPERTY(output_directory ${target} RUNTIME_OUTPUT_DIRECTORY)
    ELSE()
      GET_TARGET_PROPERTY(output_directory ${target} LIBRARY_OUTPUT_DIRECTORY)
    ENDIF()

    IF (NOT output_directory)
      set(output_directory ${CMAKE_CURRENT_BINARY_DIR})
    ENDIF()

    SET_PROPERTY(GLOBAL APPEND PROPERTY Cleaver_LIBRARY_DIRS
      ${output_directory}
      )
  ENDIF()
ENDMACRO()
