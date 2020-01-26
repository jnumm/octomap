Octomap - A probabilistic, flexible, and compact 3D mapping library for robotic systems
=======================================================================================

Authors: K. M. Wurm, A. Hornung, University of Freiburg, Copyright (C) 2009-2013.
http://octomap.github.com

Octovis is a visualization tool and library for OctoMap.
It is distributed under the GPL license (see "LICENSE.txt").

Octovis is based on [QGLViewer](http://www.libqglviewer.com/), distributed under the 
[GPL license](src/extern/QGLViewer/LICENSE) with an [exception by the author]
(octovis/src/extern/QGLViewer/GPL_EXCEPTION).


BUILD
-----

To compile the library you need:

* OpenGL
* cmake (http://www.cmake.org)
* Qt development environment
* QGLViewer

You can build octovis independently of octomap by following
the these steps:

    cd octovis
    mkdir build
    cd build
    cmake ..
    make
  
  
You can manually set the location of the octomap library with the
`octomap_DIR` variable in CMake.

If you compiled QGLViewer on your own and CMake cannot find it,
you can use the variable `QGLViewer_INCLUDE_DIR` to specify
the header file location and `QGLViewer_LIBRARIES` to set
the library file to link against (e.g. libQGLViewer.so or QGLViewer.lib).


WINDOWS
-------

The octomap viewer **octovis** can be compiled and used under
Windows although this has not been tested in-depth. Feedback 
is welcome ("it works" is nice too :-))


### MinGW ###

1. Download the MinGW distribution (http://www.mingw.org)
2. Install C++ compiler and add MingGW/bin to your system PATH
3. Download the QT library with MinGW support 
   (http://qt.nokia.com/downloads)
4. First build the GQLViewer library. Open a windows shell 
   (e.g., from the START-Menu -> QT) and execute:

        cd octovis/src/extern/QGLViewer
        qmake
        mingw32-make
   This will generate QGLViewer2.dll and libQGLViewer2.a

5. The viewer should be built along with the rest of the octomap package.
   From a shell execute: 

        cd octomap/build
        cmake -G "MinGW Makefiles" ..
        mingw32-make


### Microsoft Visual Studio ###

Adjust the paths as necessary depending on where you unpacked zip files
or cloned any git repositories. Here, we are building for x64 and
the projects are place in subdirectories under C:\Devel.
Compiler version used is MSVC 2019, which is able to use Qt compiled
for MSVC 2017.

1. Download the [Qt Online Installer](https://www.qt.io/download-qt-installer)
   and install a suitable version of the library, e.g. MSVC 2017 64-bit.

2. To build the qglviewer library, [download a libQGLViewer zip file](http://libqglviewer.com/src/)
   and extract it to C:\Devel.

   Then, open a windows shell with the compiler environment setup.

        Start Menu -> Visual Studio 2017 -> Visual Studio Tools -> VC -> x64 Native Tools Command Prompt for VS 2017

   In that command prompt, run qmake and nmake.
        cd C:\Devel\libQGLViewer-2.6.3
        C:\Qt\5.12.3\msvc2017_64\bin\qmake.exe
        nmake /nologo

    This will give you the needed files QGLViewer2.(dll,lib).

3. The viewer octovis should be built along with the rest of the octomap package.
   These steps will create a solution file for the library and the viewer:

       cd C:\Devel\octomap
       mkdir build
       cd build

       cmake .. -G "Visual Studio 16 2019" -A x64 -DQt5_DIR=C:\Qt\5.12.3\msvc2017_64\lib\cmake\Qt5 -DQGLViewer_BASE_DIR=C:\Devel\libQGLViewer-2.6.3

   This generates a solution file octomap-distribution.sln
   Load this file in Visual Studio and build the project.


When executing octovis.exe, Windows needs to find the following 
libraries, so make sure they are on the PATH or in the same 
directory: QGLViewer2.dll, QtOpenGL4.dll, QTGui4.dll, QTCore4.dll
