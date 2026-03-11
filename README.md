# dotfiles

Portable dev environment bootstrap. Clone and run once on any new machine. Everything applies globally across all projects.

## Setup

```bash
git clone https://github.com/MahammadNuriyev62/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/setup.sh
~/dotfiles/setup.sh
gh auth login
```

## What it installs

| What | Where | Scope |
|------|-------|-------|
| Claude Code settings + hooks | `~/.claude/settings.json` | All projects |
| Rules (testing, deployment, memory, git) | `~/CLAUDE.md` | All projects under home |
| `ship` skill | `~/.claude/skills/ship/` | All projects |
| `onboard` skill | `~/.claude/skills/onboard/` | Auto-triggers in new projects |
| GitHub CLI config | `~/.config/gh/config.yml` | Global |
| Lightning AI on_start hook | `~/.lightning_studio/on_start.sh` | Studio restarts |

## What the rules enforce

- **Testing is mandatory.** Every change must be tested. No exceptions.
- **Deployment is cautious.** Read state first, verify impact, confirm destructive ops, monitor after pushing.
- **Memory is immediate.** Save findings as you go, not at the end. Sessions end without warning.
- **Git is guarded.** Review diffs before committing. Flag secrets, debug logs, unrelated changes.
- **Docs over pretraining.** Always read current CLI/library docs. Don't trust cached knowledge.

## Hooks

- **`Stop` hook** — Fires after every Claude response where code was modified. A prompt-based check verifies that CLAUDE.md rules were followed (testing done, tools flagged as missing, etc.). If the check fails, Claude automatically continues to fix the violation.

## Skills

- **`/ship`** - Reviews changes, splits into meaningful commits, pushes, then monitors deployment (GitHub Actions, Railway, Vercel, whatever the project uses). Fixes and retries if it fails.
- **`onboard`** - Auto-triggers when entering a project with no memory. Explores the codebase, figures out the stack, how to run it, how it deploys, and saves everything to memory before writing any code.

## Secrets

Never stored in this repo. They live as:
- GitHub repo secrets (for CI/CD)
- OAuth flows (remote MCP servers authenticate via browser)
- `gh auth login` (GitHub CLI)

## Lightning AI

On Lightning AI studios, the `on_start.sh` hook auto-clones this repo and runs setup on new studios. On existing studios with persistent storage, you only run setup once.
