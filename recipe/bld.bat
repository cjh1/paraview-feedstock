
:: remove -GL from CXXFLAGS
set "CXXFLAGS=-MD"

mkdir build && cd build
cmake -LAH -G"NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DPARAVIEW_BUILD_QT_GUI=OFF ^
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON ^
    -DPARAVIEW_ENABLE_PYTHON=ON ^
    -DPARAVIEW_PYTHON_VERSION=3 ^
    -DPython3_FIND_STRATEGY=LOCATION ^
    -DPython3_ROOT_DIR="%LIBRARY_PREFIX%" ^
    -DPython3_EXECUTABLE="%PYTHON%" ^
    -DPARAVIEW_USE_EXTERNAL=ON ^
    -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF ^
    -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF ^
    -DLZMA_LIBRARY="%LIBRARY_PREFIX%/lib/liblzma.lib" ^
    -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=OFF ^
    -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF ^
    -DVTK_MODULE_USE_EXTERNAL_ParaView_protobuf=OFF ^
    -DPARAVIEW_ENABLE_WEB=ON ^
    -DPARAVIEW_USE_VTKM=OFF ^
    -DPARAVIEW_ENABLE_XDMF2=OFF ^
    -DCMAKE_RULE_MESSAGES=OFF ^
    ..
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

move %LIBRARY_PREFIX%\bin\Lib\site-packages\paraview %SP_DIR%
move %LIBRARY_PREFIX%\bin\Lib\site-packages\vtkmodules %SP_DIR%
move %LIBRARY_PREFIX%\bin\Lib\site-packages\vtk.py %SP_DIR%
