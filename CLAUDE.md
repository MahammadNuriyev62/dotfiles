# Development Standards

## Testing is mandatory

Every change you make must be tested before you consider it done. This is non-negotiable.

### What "tested" means:
1. **Gather your tools first.** Before starting any task, check what MCP servers and tools are available (Playwright, etc). If something is missing that you need, install it.
2. **Build it, then verify it.** After writing code, run it. After running it, check the output. After checking the output, test edge cases.
3. **Use Playwright to visually verify.** For any web UI work, take screenshots with Playwright and inspect them. Don't assume the UI looks right -- look at it.
4. **Test exhaustively.** Don't test the happy path and stop. Test error states, empty states, boundary conditions, and user flows end-to-end.
5. **Test rigorously.** If a test fails, fix the code, then re-run ALL related tests -- not just the one that failed.
6. **Test thoroughly.** After you think you're done, ask yourself: "What haven't I tested?" Then test that too.

### Testing workflow:
1. Start dev servers if not running
2. Make changes
3. Wait for hot reload (2-3 seconds)
4. Screenshot the result with Playwright
5. Verify the screenshot looks correct
6. Test user interactions (click, type, navigate)
7. Check console/network for errors
8. Test on different states (logged in/out, empty data, error conditions)
9. Only then report back as done

### If you can't test something:
- Say so explicitly. Don't skip testing silently.
- Explain what you would test and how.

## MCP Servers

These are available globally:
- **Playwright** (`npx @playwright/mcp@latest --caps vision`): Browser automation and screenshots. Use this to verify any web UI changes.
- **Context7** (`npx -y @upstash/context7-mcp@latest`): Up-to-date library documentation. Use this when working with any library to get current API docs instead of relying on training data.

Remote MCP servers (configured in Claude web/app):
- **Railway MCP** (`https://railway-mcp.maganuriyev.workers.dev/mcp`): Manage Railway deployments, services, variables, domains.

## General

- Don't commit unless asked.
- Don't push unless asked.
- Use `gh` CLI for GitHub operations (PRs, issues, secrets).
- Store deployment secrets as GitHub repo secrets, not in code.
