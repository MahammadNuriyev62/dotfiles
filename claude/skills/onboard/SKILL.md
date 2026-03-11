---
description: Onboard to a new project before making any changes. Invoke when there are no memory files for this project yet or when this is the first interaction with a new codebase.
---

Before writing any code in this project, do the following:

1. **Explore the codebase.** Read the directory structure, key config files (package.json, tsconfig, Dockerfile, docker-compose, wrangler.toml, railway.json, etc.), and entry points. Understand what the project is and how it's organized.

2. **Read existing docs.** Check for README, CLAUDE.md, SETUP.md, CONTRIBUTING.md, or any docs/ directory. Don't duplicate what's already documented.

3. **Understand the stack.** Identify the language, framework, database, hosting platform, and key dependencies. Note versions.

4. **Figure out how to run it.** Find the dev server command, test command, build command. Verify they work.

5. **Figure out how it's deployed.** Check for GitHub Actions workflows, Railway/Vercel/Cloudflare configs, Dockerfiles. Identify the deployment platform and method (auto-deploy on push, manual, CI/CD).

6. **Check for MCP servers and tools.** See what's available for testing and deployment monitoring in this project's context.

7. **Save everything to memory.** Write a structured summary covering: what the project is, the stack, how to run it, how it's deployed, key file paths, and any gotchas you noticed. Do this immediately, not later.

Only after completing these steps should you start working on any task.
