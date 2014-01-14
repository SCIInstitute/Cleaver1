#-----------------------------------------------------------------------------
#
# Cleaver - A MultiMaterial Tetrahedral Mesher
# -- CMakeList
#
# Primary Author:        Jonathan Bronson (bronson@sci.utah.edu)
# Contributing Authors:  Joshua A. Levine (levine@sci.utah.edu)
#
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#
#  Copyright (C) 2011, 2012, 2013, Jonathan Bronson
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

PROJECT(CLEAVER)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

OPTION(BUILD_CLEAVER_APP "Build Cleaver Command Line App (Requires TEEM)" ON)

SET(Cleaver_CMAKE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
INCLUDE_DIRECTORIES(${Cleaver_CMAKE_DIR})
INCLUDE(${Cleaver_CMAKE_DIR}/CleaverExportLibrary.cmake)

SET(Cleaver_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})

# Build Cleaver Library (no dependencies)
ADD_SUBDIRECTORY(lib)

# Build Cleaver Command App (requires teem library)
IF(BUILD_CLEAVER_APP)
    ADD_SUBDIRECTORY(teem)
    ADD_SUBDIRECTORY(cmd)
ENDIF(BUILD_CLEAVER_APP)

# The following variables have been set by each sub directory project.
# They are used to configure CleaverConfig.cmake.in.
GET_PROPERTY(Cleaver_LIBRARIES GLOBAL PROPERTY Cleaver_LIBRARIES)
LIST(REMOVE_DUPLICATES Cleaver_LIBRARIES)

GET_PROPERTY(Cleaver_INCLUDE_DIRS GLOBAL PROPERTY Cleaver_INCLUDE_DIRS)
LIST(REMOVE_DUPLICATES Cleaver_INCLUDE_DIRS)

GET_PROPERTY(Cleaver_LIBRARY_DIRS GLOBAL PROPERTY Cleaver_LIBRARY_DIRS)
LIST(REMOVE_DUPLICATES Cleaver_LIBRARY_DIRS)

# Configure config file for find_package
CONFIGURE_FILE(
  ${Cleaver_CMAKE_DIR}/CleaverConfig.cmake.in
  ${Cleaver_BINARY_DIR}/CleaverConfig.cmake
  )
