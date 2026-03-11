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

### Deployment mindset:
- Assume production is fragile. Treat every deploy action as if a mistake will take down a live service.
- If you're unsure about the impact of a change, stop and ask.
- Never batch destructive operations. One at a time, verify each.

## Git and commits

- Don't commit unless asked.
- Don't push unless asked.
- When committing, always include the author attribution:
  ```
  Co-Authored-By: MahammadNuriyev62 <maganuriyev@gmail.com>
  ```
- Use `gh` CLI for GitHub operations (PRs, issues, secrets, releases).
- Store deployment secrets as GitHub repo secrets, not in code.

## General mindset

- Never get comfortable. Always double-check before executing anything that modifies state.
- Read before you write. Understand existing code before changing it.
- If something feels off, investigate. Don't push through and hope for the best.
- When in doubt, ask.
