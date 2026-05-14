cmake_minimum_required(VERSION 3.20)
project(PolyglotGame Engine C CXX)

### Enforce explicit C++11 and C99 standards across toolchains
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 99)

### 1. Compile Fortran Wavefront Pathfinder Module
enable_language(Fortran)
add_library(fortran_generator STATIC src/generator.f90)
set_target_properties(fortran_generator PROPERTIES LINKER_LANGUAGE Fortran)

### 2. Compile Low-Level Direct Console Graphics in C
add_library(c_renderer STATIC src/renderer.c)

### 3. Dynamic Build Execution Interface for Rust Engine Core
add_custom_command(
)
add_library(rust_physics STATIC IMPORTED GLOBAL)
set_target_properties(rust_physics PROPERTIES IMPORTED_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/physics.lib")

### 4. Dynamic Build Execution for COBOL Ledger & Shop Systems
add_custom_command(
)
add_library(cobol_shop STATIC IMPORTED GLOBAL)
set_target_properties(cobol_shop PROPERTIES IMPORTED_LOCATION " ${CMAKE_CURRENT_BINARY_DIR}/shop.o")
add_library(cobol_ledger STATIC IMPORTED GLOBAL)
set_target_properties(cobol_ledger PROPERTIES IMPORTED_LOCATION "$ {CMAKE_CURRENT_BINARY_DIR}/ledger.o")

### 5. Link Target Binary
add_executable(game src/main.cpp
)
target_link_libraries(game PRIVATE c_renderer fortran_generator)
target_compile_options(game PRIVATE /EHsc /MD)
