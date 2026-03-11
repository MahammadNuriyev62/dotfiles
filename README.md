# dotfiles

Bootstrap script for development environments. Clone and run on any new machine.

## Usage

```bash
git clone https://github.com/MahammadNuriyev62/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/setup.sh
~/dotfiles/setup.sh
```

## What it sets up

- **Claude Code** with settings and a root CLAUDE.md that enforces rigorous testing and cautious deployment
- **GitHub CLI** config (HTTPS protocol, aliases)
- **Lightning AI** on_start hook to keep Claude Code installed across restarts

## MCP servers

Not pre-installed. The CLAUDE.md instructs Claude to find and suggest appropriate MCP servers based on what the current task requires (browser testing, deployment, etc.).

## Secrets

Secrets are never stored in this repo. They live as:
- GitHub repo secrets (for CI/CD)
- OAuth flows (remote MCP servers authenticate via browser)
- `gh auth login` (GitHub CLI)
