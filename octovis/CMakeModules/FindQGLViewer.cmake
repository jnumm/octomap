# Find QGLViewer library
# Looks for a system-wide version of libQGLViewer.
#
# QGLViewer_INCLUDE_DIR      where to find the include files
# QGLViewer_LIBRARIES        list of libraries to link
# QGLViewer_FOUND            true if QGLViewer was found
#
# If the debug version of the library is found:
# QGLViewer_LIBRARIES_DEBUG  libraries to link in a debug configuration

find_path(QGLViewer_INCLUDE_DIR
  NAMES qglviewer.h
  PATH_SUFFIXES QGLViewer
  HINTS "${QGLViewer_BASE_DIR}")

find_library(QGLViewer_LIBRARIES
  NAMES QGLViewer QGLViewer2 QGLViewer-qt5
  PATH_SUFFIXES QGLViewer
  HINTS "${QGLViewer_BASE_DIR}")

find_library(QGLViewer_LIBRARIES_DEBUG
  NAMES QGLViewerd QGLViewerd2
  PATH_SUFFIXES QGLViewer
  HINTS "${QGLViewer_BASE_DIR}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  QGLViewer
  DEFAULT_MSG
  QGLViewer_LIBRARIES QGLViewer_INCLUDE_DIR)

if(QGLViewer_FOUND)
  if(NOT TARGET QGLViewer::QGLViewer)
    add_library(QGLViewer::QGLViewer UNKNOWN IMPORTED)
    set_target_properties(QGLViewer::QGLViewer PROPERTIES
      IMPORTED_LOCATION "${QGLViewer_LIBRARIES}"
      INTERFACE_INCLUDE_DIRECTORIES "${QGLViewer_INCLUDE_DIR}")
  endif()

  if(QGLViewer_LIBRARIES_DEBUG)
    set_property(TARGET QGLViewer::QGLViewer APPEND PROPERTY
      IMPORTED_CONFIGURATIONS DEBUG)
    set_target_properties(QGLViewer::QGLViewer PROPERTIES
      IMPORTED_LOCATION_DEBUG "${QGLViewer_LIBRARIES_DEBUG}")
  endif()
endif()

mark_as_advanced(QGLViewer_INCLUDE_DIR QGLViewer_LIBRARIES QGLViewer_LIBRARIES_DEBUG)
