# Development Standards

## Testing is mandatory

Every change you make must be tested before you consider it done. This is non-negotiable.

### Before you start any task:
1. Check what MCP servers and tools are currently available.
2. If you don't have what you need to test your work (browser automation, API testing, etc.), search for and suggest MCP servers that would let you test properly. Look for well-maintained, widely-used ones. Don't just guess -- verify they exist and are legit.
3. Don't start coding until you know how you'll verify the result.

### What "tested" means:
- **Build it, then verify it.** After writing code, run it. After running it, check the output. After checking the output, test edge cases.
- **Visual verification for UI work.** If a browser automation MCP server is available, take screenshots and inspect them. Don't assume the UI looks right -- look at it.
- **Test exhaustively.** Don't test the happy path and stop. Test error states, empty states, boundary conditions, and user flows end-to-end.
- **Test rigorously.** If a test fails, fix the code, then re-run ALL related tests, not just the one that failed.
- **After you think you're done, ask yourself: "What haven't I tested?" Then test that too.**

### If you can't test something:
- Say so explicitly. Don't skip testing silently.
- Explain what you would test, how, and what tools you'd need.
- Suggest specific MCP servers that would enable the testing.

## Deployment

### Before deploying anything:
1. If you don't have MCP servers that let you manage deployments directly, search for and suggest ones that would. For example, platform-specific MCP servers for Railway, Vercel, Cloudflare, etc.
2. **Double check everything before any deploy action.** Read the current state first. Verify what will change. Confirm it won't break anything running in production.
3. **Never run destructive operations without asking first.** Deleting services, dropping databases, overwriting environment variables, force-pushing -- always confirm.
4. **After deploying, verify the deployment succeeded.** Check status, hit the endpoint, look at logs.

### After pushing:
- Figure out how this project gets deployed. Check in this order:
  1. **Memory.** Check your memory files for notes about this project's deployment platform.
  2. **GitHub Actions.** Look in `.github/workflows/` for CI/CD workflows triggered on push. If found, use `gh run list` and `gh run watch` to monitor.
  3. **External platforms.** Some projects deploy via platforms like Railway, Vercel, or Render that watch the repo directly. GitHub won't show these. Use the platform's CLI to check deployment status and logs (e.g. `railway logs`, `vercel ls`, `flyctl status`). **Before using any CLI, read its current documentation first.** Don't rely on pretraining knowledge for CLI flags and commands -- it may be outdated.
  4. **If you can't figure it out, ask.** Then save the answer to memory so you know next time.
- If a deployment fails, read the logs, diagnose, fix, and push again.
- Don't walk away from a push until the deployment is confirmed healthy or you've told the user it failed and why.

### Deployment mindset:
- Assume production is fragile. Treat every deploy action as if a mistake will take down a live service.
- If you're unsure about the impact of a change, stop and ask.
- Never batch destructive operations. One at a time, verify each.

## Git and commits

- Don't commit unless asked.
- Don't push unless asked.
- Before committing, review the diff yourself. Flag anything suspicious: debug logs, hardcoded secrets, `.env` files, `console.log` spam, commented-out code, TODO hacks, unrelated changes that snuck in. If you spot something, stop and tell the user before committing.
- When committing, always include the author attribution:
  ```
  Co-Authored-By: MahammadNuriyev62 <maganuriyev@gmail.com>
  ```
- Use `gh` CLI for GitHub operations (PRs, issues, secrets, releases).
- Store deployment secrets as GitHub repo secrets, not in code.

## Memory

- Save important findings to memory as you go, not at the end. Sessions end without warning.
- If you learn something about the project (architecture, gotchas, what works, what doesn't), write it to memory immediately.
- Don't wait for a natural stopping point. There isn't one.

## General mindset

- Never get comfortable. Always double-check before executing anything that modifies state.
- Read before you write. Understand existing code before changing it.
- If something feels off, investigate. Don't push through and hope for the best.
- **Don't trust your pretraining knowledge for CLI tools, APIs, or libraries.** Read the current docs first. Flags change, commands get deprecated, APIs evolve.
- When in doubt, ask.
