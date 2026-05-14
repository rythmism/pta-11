# pta-11
# 🏆 Polyglot Terminal Arcade

An experimental, 2D rogue-lite arcade game framework built across **11 distinct programming languages** in a single execution thread. This project serves as a comprehensive reference implementation for advanced Foreign Function Interfaces (FFI), multi-threaded systems architecture, cross-compiler linkages, and isolated environment builds.

---

## 🏗️ Technology Architecture Matrix


| Layer / Responsibility | Language | Technical Execution Method |
| :--- | :--- | :--- |
| **Main Engine Loop & Threading** | `C++11` | Orchestrates structural timelines, spawns background threads, and links native binary object files. |
| **ANSI Color Graphics Buffer** | `C99` | Flushes color structures directly to the console host using virtual terminal escape strings. |
| **Collision Logic & Health** | `Rust` | Computes bounding-box calculations and handles player health parameters within safe blocks. |
| **Wavefront Pathfinding AI** | `Fortran 90` | Maps out paths across dense terrain matrices using an absolute breadth-first grid solver. |
| **Upgrades & Score Bookkeeping**| `COBOL` | Validates shop transactions and appends progress logs using a line-sequential filing structure. |
| **Asynchronous Input Ring** | `Python 3` | Captures keyboard interrupts on a secondary thread to eliminate core rendering lag. |
| **Level Profile Asset Loader** | `Node.js` | Flattens rows from JSON maps and moves configurations into low-level runtime storage. |
| **Audio Subsystem Core** | `VBScript` | Triggers Windows SAPI voice synthesizers asynchronously without stalling engine frames. |
| **Automation Tooling Launcher** | `Windows Batch`| Controls local cleanup tasks and sequences compiler flags across the toolchains. |
| **Pre-Commit Quality Gate** | `Bash` | Blocks commits if syntax errors are detected, verifying code integrity on local machines. |
| **State Versioning Engine** | `Git` | Saves automated snapshots and commits performance tables to separate backup branches. |

---

## 🕹️ Gameplay Mechanics

*   **The Objective:** Control the player icon (**`@`**), dodge moving enemies (**`E`**), avoid procedural spikes (**`^`**), and collect targets (**`X`**).
*   **Dynamic Shop Engine:** Collect points by matching coordinate rings. Between maps, you can spend points in a shop managed by the COBOL subsystem to buy extra health points.
*   **Progressive Difficulties:** The system cycles through 6 built-in JSON maps, each scaling up speed and terrain density.

---

## 🚀 Setup & Installation

### Option A: Native Windows Installation (Recommended)
1. Open a terminal window as an **Administrator**.
2. Run the automated dependency script to install the toolchains (via Chocolatey and Winget):
   ```batch
   install_env.bat
   ```
3. Restart your terminal to refresh the environment variables.

### Option B: Docker Container Sandbox
To compile and bundle the Windows target application inside an isolated Linux container, run:
```bash
docker build -t polyglot-arcade .
docker run -p 5000:5000 polyglot-arcade
```

---

## 🛠️ Compilation and Execution Instructions

1. Launch your workspace using **Git Bash** to set up your repository and quality control safeguards:
   ```bash
   git init
   git config user.name "ArcadePlayer"
   git config user.email "player@polyglot.com"
   
   # Activate automated pre-commit hooks
   cp .git/hooks/pre-commit .git/hooks/pre-commit
   chmod +x .git/hooks/pre-commit
   
   git add .
   git commit -m "feat: bootstrap polyglot game compilation baseline"
   ```
2. Run the master compilation pipeline to generate your binary:
   ```bash
   cmd.exe /c run.bat
   ```

---

## 🌐 Extension Services & Developer Tools

### 1. Terminal Map Customization Utility
Modify map files visually without touching raw JSON files by launching the built-in editor:
```bash
python src/editor.py
```

### 2. HTTP Web Level Injector & Leaderboard
Launch the background monitoring dashboard to review performance metrics and inject custom layouts over HTTP:
```bash
python src/dashboard.py
```
*   **Web Console URL:** [http://127.0.0.1:5000](http://127.0.0.1:5000)
*   **Network Injections:** Paste a custom 20x10 matrix text blob directly into the UI form to instantly override map files.
