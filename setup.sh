#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== dotfiles bootstrap ==="

# ── Claude Code ──────────────────────────────────────────────────────

if ! command -v claude &>/dev/null; then
  echo "Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
fi

mkdir -p ~/.claude/commands ~/.claude/skills
cp "$DOTFILES_DIR/claude/settings.json" ~/.claude/settings.json
cp "$DOTFILES_DIR/claude/commands/"*.md ~/.claude/commands/ 2>/dev/null || true
cp -r "$DOTFILES_DIR/claude/skills/"* ~/.claude/skills/ 2>/dev/null || true
echo "Claude settings, commands, and skills installed."

# ── CLAUDE.md ────────────────────────────────────────────────────────

if [ ! -f ~/CLAUDE.md ]; then
  cp "$DOTFILES_DIR/CLAUDE.md" ~/CLAUDE.md
  echo "Root CLAUDE.md installed."
else
  echo "CLAUDE.md already exists, skipping."
fi

# ── GitHub CLI ───────────────────────────────────────────────────────

if command -v gh &>/dev/null; then
  mkdir -p ~/.config/gh
  cp "$DOTFILES_DIR/gh/config.yml" ~/.config/gh/config.yml
  echo "gh config installed."

  if ! gh auth status &>/dev/null 2>&1; then
    echo ""
    echo "GitHub CLI not authenticated. Run:"
    echo "  gh auth login"
  fi
fi

# ── Lightning AI on_start hook ───────────────────────────────────────

if [ -d ~/.lightning_studio ]; then
  cp "$DOTFILES_DIR/on_start.sh" ~/.lightning_studio/on_start.sh
  chmod +x ~/.lightning_studio/on_start.sh
  echo "Lightning on_start.sh installed."
fi

echo ""
echo "=== Done ==="
echo ""
echo "Secrets to set up manually:"
echo "  - gh auth login (if not authenticated)"
echo "  - Store API keys as GitHub repo secrets for CI/CD"
