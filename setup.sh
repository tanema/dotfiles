#!/usr/bin/env bash
set -euo pipefail
mkdir -p ~/workspace
command -v git >/dev/null 2>&1 || (echo "😵 Git is not installed." && exit 1)
echo "Fetching all dotfiles"
git clone https://github.com/tanema/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
echo "Running full install"
make install
