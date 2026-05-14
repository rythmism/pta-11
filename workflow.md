### 1. Environment & Automation Layer
*   **Git:** Manages repository branching models, isolating performance telemetry logs onto tracking branches.
*   **Bash (`run.sh` / `pre-commit`):** Sets up Linux cross-compiler hooks and runs validation passes to check code health before commits.
*   **Batch (`run.bat` / `install_env.bat`):** Automates Windows environment mapping and configures compilers (`cl.exe`, `gfortran`, `rustc`, `cobc`).
*   **VBScript (`launch.vbs` / `sound.vbs`):** Launches binaries silently to hide console windows and drives asynchronous text-to-speech audio streams.

### 2. Core Execution Engine
*   **C++11 (`src/main.cpp`):** Spawns background worker threads using atomic keys and manages language linking boundaries.
*   **C99 (`src/renderer.c`):** Renders graphics by flushing custom pixel matrices directly to terminal grids using virtual escape codes.
*   **Rust (`src/physics.rs`):** Handles bounding box coordinate checking, player health tracking, and random hazard drops.

### 3. Pipeline Inter-Process Subsystems
*   **Python 3 (`src/controller.py` / `dashboard.py` / `editor.py`):** Captures key inputs, hosts the map designer tool, and runs a Flask web dashboard.
*   **Node.js / JavaScript (`ui/level_loader.js` / `input_handler.js`):** Extracts, flattens, and formats multidimensional layout strings.
*   **JSON (`config/levels.json`):** Holds configurations and grid parameters for the 6 pre-stored maps.
*   **Fortran 90 (`src/generator.f90`):** Solves terrain paths in real time using a wavefront breadth-first search grid routing algorithm.
*   **GnuCOBOL (`src/shop.cob` / `ledger.cob`):** Computes shop balances and logs high scores to file-appended storage streams.

---

## ⚙️ Data Linkage & Communication Design Patterns

To combine these different systems into a single runtime thread without performance drops, the engine uses two main communication methods:

### 1. Direct Object-Level Foreign Function Interface (FFI)
Compiled languages (C++, C, Rust, Fortran, and COBOL) are linked into a single binary (`game.exe`). They communicate by passing exact data types across shared memory addresses using the standard **C ABI (`extern "C"`)**:
*   **Rust to C++ Linkage:** Coordinates are evaluated as standard raw types (`i32` maps directly to `int`).
*   **COBOL to C++ Linkage:** Balances and health tracking integers use the binary memory standard (`PIC S9(9) COMP-5`) to map directly to C++ signed integers.
*   **Fortran to C++ Linkage:** Grids are converted into 1D pointer arrays (`int*`) so Fortran's matrix solver can parse them natively.

### 2. Transient Subprocess Output Piping
Scripting languages (Python, JavaScript, VBScript) communicate with the core engine using fast input/output file buffers:
*   The Python key collector and Node.js level loader write data directly to ephemeral file buffers (`key.txt`, `active_level.tmp`). 
*   The C++ engine reads these files into memory within milliseconds, minimizing lag.

---

## 🔒 Security, Quality Gates & Distribution Model

*   **Atomic Isolation:** Temporary runtime states and binary caches are filtered out using an optimized multi-ecosystem `.gitignore` template.
*   **Automated Verification:** A local Git hook blocks broken code updates, while a GitHub Actions pipeline matches this process in the cloud.
*   **Licensing:** Distributed under the **MIT License**, allowing developers to freely use, modify, and distribute the engine code.
