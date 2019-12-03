@set build_type=Release
@if not "%1"=="" set build_type=%1
@echo Configuring for build type %build_type%

@set qt5_path=G:\dev\Qt\5.13.1\msvc2015_64
@set vcpkg_path=D:\vcpkg\installed\x64-windows
@if "%build_type%"=="Debug" set vcpkg_path=D:\vcpkg\installed\x64-windows\debug

@set BOOST_PATH=%vcpkg_path%
@set BOOST_LIBRARY_DIR=%BOOST_PATH%\lib

@set PROTOBUF_PATH=%vcpkg_path%

@set CURL_PATH=%vcpkg_path%
@set CURL_INCLUDE_DIR=%CURL_PATH%\include
@set CURL_LIBRARY_DIR=%CURL_PATH%\lib
set CURL_LIBRARY_NAME=libcurl.lib

@set FREEIMAGE_PATH=%vcpkg_path%
@set FREEIMAGE_LIBRARY_DIR=%FREEIMAGE_PATH%\lib
@set FREEIMAGE_INCLUDE_DIR=%FREEIMAGE_PATH%\include

@set SDFORMAT_PATH=D:\vcpkg\installed\x64-windows\share
@set SDF_SHARE_PATH=D:\vcpkg\installed\x64-windows\share\sdformat\1.6

@set IGNITION-MATH_PATH=%vcpkg_path%
@set IGNITION-MSGS_PATH=%vcpkg_path%
@set IGNITION-TRANSPORT_PATH=%vcpkg_path%
@set IGNITION-TRANSPORT_CMAKE_PREFIX_PATH=D:\vcpkg\installed\x64-windows\share

@set TBB_PATH=%vcpkg_path%
@set TBB_LIBRARY_DIR=%TBB_PATH%\lib
@set TBB_INCLUDEDIR=%TBB_PATH%\include

@set QWT_PATH=%vcpkg_path%
@set QWT_LIBRARY_DIR=%QWT_PATH%\lib
@set QWT_INCLUDEDIR=%QWT_PATH%\include

@set OGRE_VERSION=1.9.0
@set OGRE_PATH=D:\gz-ws
@set OGRE_INCLUDE_DIR=%OGRE_PATH%\include;%OGRE_PATH%\include\OGRE;%OGRE_PATH%\include\OGRE\RTShaderSystem;%OGRE_PATH%\include\OGRE\Terrain;%OGRE_PATH%\include\OGRE\Paging
@set OGRE_LIBRARY_DIR=%OGRE_PATH%\lib\debug
@set OGRE_PLUGIN_DIR=%OGRE_LIBRARY_DIR%\opt
set OGRE_LIB_SUFFIX=.lib
@set OGRE_LIBS=%OGRE_LIBRARY_DIR%\OgreMain%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgreRTShaderSystem%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgreTerrain%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgrePaging%OGRE_LIB_SUFFIX%
@if "%build_type%"=="Debug" set OGRE_LIBS=%OGRE_LIBRARY_DIR%\OgreMain_d%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgreRTShaderSystem_d%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgreTerrain_d%OGRE_LIB_SUFFIX%;%OGRE_LIBRARY_DIR%\OgrePaging_d%OGRE_LIB_SUFFIX%

@set DLFCN_WIN32_PATH=%vcpkg_path%
@set DLFCN_WIN32_LIBRARY_DIR=%DLFCN_WIN32_PATH%\lib
@set DLFCN_WIN32_INCLUDE_DIR=%DLFCN_WIN32_PATH%\include

@set QT5_PATH=%qt5_path%
@set QT5_BIN_DIR=%QT5_PATH%\bin

@set INCLUDE=%FREEIMAGE_INCLUDE_DIR%;%TBB_INCLUDEDIR%;%DLFCN_WIN32_INCLUDE_DIR%;%INCLUDE%;D:\gz-ws\gazebo\build\gazebo\msgs
@set LIB=d:\gz-ws\lib;d:\gz-ws\lib\OGRE;%QT5_PATH%\lib;%FREEIMAGE_LIBRARY_DIR%;%BOOST_LIBRARY_DIR%;%TBB_LIBRARY_DIR%;%DLFCN_WIN32_LIBRARY_DIR%;%LIB%
@set PATH=%QT5_BIN_DIR%;%PATH%

cmake ^
    -DCMAKE_PREFIX_PATH="%SDFORMAT_PATH%;%IGNITION-MATH_PATH%;%IGNITION-MSGS_PATH%;%IGNITION-TRANSPORT_CMAKE_PREFIX_PATH%;%WORKSPACE_INSTALL_DIR%"^
    -DOGRE_FOUND=1^
    -DOGRE-RTShaderSystem_FOUND=1^
    -DOGRE-Terrain_FOUND=1^
    -DOGRE-Overlay_FOUND=1^
    -DOGRE_VERSION=%OGRE_VERSION%^
    -DOGRE_PLUGINDIR="%OGRE_PLUGIN_DIR%"^
    -DOGRE_INCLUDE_DIRS="%OGRE_INCLUDE_DIR%"^
    -DOGRE_LIBRARIES="%OGRE_LIBS%"^
    -DCMAKE_INSTALL_PREFIX="d:\gz-ws"^
    -DCMAKE_BUILD_TYPE="%build_type%"^
    ..
