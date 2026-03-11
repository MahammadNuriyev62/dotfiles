# dotfiles

Bootstrap script for development environments. Clone and run on any new machine.

## Usage

```bash
git clone https://github.com/MahammadNuriyev62/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/setup.sh
~/dotfiles/setup.sh
```

## What it sets up

- **Claude Code** with settings, MCP servers (Playwright, Context7), and a root CLAUDE.md that enforces rigorous testing
- **GitHub CLI** config (HTTPS protocol, aliases)
- **Playwright** browsers for visual testing
- **Lightning AI** on_start hook to keep tools installed across restarts

## Remote MCP servers (no local setup needed)

| Server | URL |
|--------|-----|
| Railway | `https://railway-mcp.maganuriyev.workers.dev/mcp` |

## Secrets

Secrets are never stored in this repo. They live as:
- GitHub repo secrets (for CI/CD: `CLOUDFLARE_API_TOKEN`, `RAILWAY_API_TOKEN`, etc.)
- OAuth flows (Railway MCP authenticates via browser)
- `gh auth login` (GitHub CLI)
