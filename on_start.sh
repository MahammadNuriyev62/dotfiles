#!/usr/bin/env bash
# Lightning AI studio on_start hook
# Runs every time the studio starts

DOTFILES=~/dotfiles

if [ ! -d "$DOTFILES" ]; then
  git clone https://github.com/MahammadNuriyev62/dotfiles.git "$DOTFILES"
fi

cd "$DOTFILES" && git pull --ff-only 2>/dev/null || true
bash "$DOTFILES/setup.sh"
