#!/bin/sh

mkdir build && cd build
cmake -LAH \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_RPATH:STRING=${PREFIX}/lib \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DVTK_INSTALL_LIBRARY_DIR="lib" \
  -DCMAKE_BUILD_TYPE=Release \
  -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
  -DPARAVIEW_ENABLE_PYTHON=ON \
  -DPARAVIEW_PYTHON_VERSION=${PY_VER:0:1} \
  -DPython2_FIND_STRATEGY=LOCATION \
  -DPython2_ROOT_DIR=${PREFIX} \
  -DPython3_FIND_STRATEGY=LOCATION \
  -DPython3_ROOT_DIR=${PREFIX} \
  -DPARAVIEW_USE_EXTERNAL=ON \
  -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
  -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=OFF \
  -DPARAVIEW_ENABLE_WEB=ON \
  -DCMAKE_RULE_MESSAGES=OFF \
  ..
make install -j${CPU_COUNT}



