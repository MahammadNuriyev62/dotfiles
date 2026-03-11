#!/usr/bin/env bash
# Lightning AI studio on_start hook
# Runs every time the studio starts

command -v claude &>/dev/null || npm install -g @anthropic-ai/claude-code
