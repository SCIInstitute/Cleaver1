PROJECT(MMSTUFF)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(CMAKE_BUILD_TYPE debug)

# FIND QT4
FIND_PACKAGE(Qt4 REQUIRED)

# Ensure GUI & OpenGL Work
set( QT_USE_QTGUI TRUE )
set( QT_USE_QTOPENGL TRUE )
set( QT_USE_THREAD TRUE )
set( QT_USE_QTXML TRUE )

# Qt Includes
INCLUDE( ${QT_USE_FILE} )

FIND_PACKAGE(GLUT)
FIND_PACKAGE(OpenGL)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/")

INCLUDE_DIRECTORIES(./qt-gui) 

#Add qt-gui files
FILE(GLOB qt-gui_srcs ./qt-gui/*.cpp)
FILE(GLOB qt-gui_hdrs ./qt-gui/*.h)

# Generate QT Files
FILE(GLOB Forms_UIS ./qt-gui/*.ui)
FILE(GLOB RCC_FILES ./qt-gui/*.qrc)

# Add Source Files
FILE(GLOB ../lib/mmstuff_srcs *.c*)
FILE(GLOB ../lib/mmstuff_hdrs *.h)


QT4_WRAP_UI(UI_SRC ${Forms_UIS})
QT4_WRAP_CPP(MOC_SRC ${qt-gui_hdrs})
QT4_ADD_RESOURCES(RCC_SRC ${RCC_FILES})

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR} ./)

ADD_EXECUTABLE(mmstuff ${mmstuff_hdrs} ${mmstuff_srcs} ${qt-gui_srcs} ${MOC_SRC} ${UI_SRC} ${RCC_SRC})

TARGET_LINK_LIBRARIES(mmstuff ${OPENGL_LIBRARIES} ${QT_LIBRARIES} ) 

