#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== dotfiles bootstrap ==="

# ── Claude Code ──────────────────────────────────────────────────────

if ! command -v claude &>/dev/null; then
  echo "Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
fi

# Claude settings
mkdir -p ~/.claude
cp "$DOTFILES_DIR/claude/settings.json" ~/.claude/settings.json
echo "Claude settings installed."

# ── MCP servers (project-level) ──────────────────────────────────────
# These get written to .claude/settings.local.json per-project.
# The CLAUDE.md in each project tells Claude how to use them.
# Global MCP config is in claude/settings.json.

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

# ── Playwright ───────────────────────────────────────────────────────

if ! npx playwright --version &>/dev/null 2>&1; then
  echo "Installing Playwright browsers..."
  npx playwright install --with-deps chromium 2>/dev/null || true
fi

# ── Wrangler (Cloudflare) ────────────────────────────────────────────

if ! command -v wrangler &>/dev/null; then
  echo "Wrangler available via npx (no global install needed)."
fi

# ── Git identity ─────────────────────────────────────────────────────

if [ -z "$(git config --global user.name 2>/dev/null)" ]; then
  echo ""
  echo "Git identity not set. Run:"
  echo "  git config --global user.name 'Your Name'"
  echo "  git config --global user.email 'your@email.com'"
fi

# ── CLAUDE.md template ───────────────────────────────────────────────

if [ ! -f ~/CLAUDE.md ]; then
  cp "$DOTFILES_DIR/CLAUDE.md" ~/CLAUDE.md
  echo "Root CLAUDE.md installed."
else
  echo "CLAUDE.md already exists, skipping."
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
echo ""
echo "Your MCP servers (remote, no setup needed):"
echo "  - Railway: https://railway-mcp.maganuriyev.workers.dev/mcp"
echo ""
echo "Your MCP servers (local, auto-configured):"
echo "  - Playwright: npx @playwright/mcp@latest"
echo "  - Context7:   npx -y @upstash/context7-mcp@latest"
