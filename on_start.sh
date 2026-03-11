#!/usr/bin/env bash
# Lightning AI studio on_start hook
# Runs every time the studio starts

# Ensure Claude Code is installed
command -v claude &>/dev/null || npm install -g @anthropic-ai/claude-code

# Ensure Playwright browsers are available
npx playwright install --with-deps chromium 2>/dev/null || true
