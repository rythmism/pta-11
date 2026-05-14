@echo off
cls
if not exist build mkdir build

echo [1/6] Compiling Fortran Matrix Pathfinder Algorithm...
gfortran -c src/generator.f90 -o build/generator.o

echo [2/6] Structuring COBOL Transaction and Ledger Modules...
cobc -c -fno-clean src/shop.cob -o build/shop.o
cobc -c -fno-clean src/ledger.cob -o build/ledger.o

echo [3/6] Exporting Rust Static Spatial Vector Frameworks...
rustc --crate-type=staticlib src/physics.rs --out-dir build

echo [4/6] Binding ANSI Color Terminal Graphics Engine in C...
cl /c /Fo:build/renderer.o src/renderer.c

echo [5/6] Compiling Multi-Threaded Core Binary Pipeline Manager...
cl src/main.cpp build/renderer.o build/generator.o build/shop.o build/ledger.o build/physics.lib /EHsc /MD /Fe:game.exe

echo [6/6] Build sequence complete. Running executable pipeline wrapper.
wscript launch.vbs
