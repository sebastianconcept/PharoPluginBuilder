#!/bin/bash

# Default build
cmake -S . -B out/build


# Build tunning options
# cmake -DCMAKE_BUILD_TYPE=Debug -DVERBOSE_BUILD=OFF -DFEATURE_FFI=OFF -DFEATURE_THREADED_FFI=OFF -DFEATURE_THREADED_FFI=OFF -DFEATURE_NETWORK=ON -DFEATURE_LIB_SDL2=OFF -DFEATURE_LIB_CAIRO=OFF -DFEATURE_LIB_FREETYPE2=OFF -DFEATURE_LIB_GIT2=OFF -DFEATURE_LIB_PTHREADW32=OFF -DGENERATE_VMMAKER=OFF -DGENERATE_SOURCES=OFF -DALWAYS_INTERACTIVE=OFF -DBUILD_BUNDLE=OFF -DFEATURE_COMPILE_GNUISATION=OFF -DFEATURE_COMPILE_GNUISATION=OFF -DPHARO_DEPENDENCIES_PREFER_DOWNLOAD_BINARIES=ON -DFEATURE_COMPILE_INLINE_MEMORY_ACCESSORS=OFF -DPHARO_VM_IN_WORKER_THREAD=OFF -DBUILD_IS_RELEASE=OFF -DDEPENDENCIES_FORCE_BUILD=OFF -S . -B out/build


# Available options:

# -DVERBOSE_BUILD=OFF
# -DFEATURE_FFI=OFF
# -DFEATURE_THREADED_FFI=OFF
# -DFEATURE_MESSAGE_COUNT=OFF
# -DFEATURE_NETWORK=OFF
# -DFEATURE_LIB_SDL2=OFF
# -DFEATURE_LIB_CAIRO=OFF
# -DFEATURE_LIB_FREETYPE2=OFF
# -DFEATURE_LIB_GIT2=OFF
# -DFEATURE_LIB_PTHREADW32=OFF
# -DGENERATE_VMMAKER=OFF
# -DGENERATE_SOURCES=OFF
# -DALWAYS_INTERACTIVE=OFF
# -DBUILD_BUNDLE=OFF
# -DFEATURE_COMPILE_GNUISATION=OFF
# -DPHARO_DEPENDENCIES_PREFER_DOWNLOAD_BINARIES=OFF
# -DFEATURE_COMPILE_INLINE_MEMORY_ACCESSORS=OFF
# -DPHARO_VM_IN_WORKER_THREAD=OFF
# -DBUILD_IS_RELEASE=OFF
# -DDEPENDENCIES_FORCE_BUILD=OFF