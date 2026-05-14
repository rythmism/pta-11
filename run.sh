#!/bin/bash
git add .
git commit -m "Automated pre-build state save"
mkdir -p build
cmd.exe /c run.bat
