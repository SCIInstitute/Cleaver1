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

#
# This module is provided as Cleaver_USE_FILE by CleaverConfig.cmake. It can
# be INCLUDED in a project to load the needed compiler and linker
# settings to use Cleaver.
#

IF(NOT Cleaver_USE_FILE_INCLUDED)
  SET(Cleaver_USE_FILE_INCLUDED 1)

  SET(CMAKE_MODULE_PATH
      ${CMAKE_MODULE_PATH}
      ${Cleaver_CMAKE_DIR})
  # Add include directories needed to use Cleaver.
  INCLUDE_DIRECTORIES(${Cleaver_INCLUDE_DIRS})

  # Add link directories needed to use Cleaver.
  LINK_DIRECTORIES(${Cleaver_LIBRARY_DIRS})
ENDIF()
