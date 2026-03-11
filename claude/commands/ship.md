Review all uncommitted changes (staged, unstaged, and untracked). Group them into one or more meaningful commits -- don't lump unrelated changes together, but don't over-split either. Each commit message should be concise and describe the "why".

Steps:
1. Run `git status` and `git diff` to understand what changed.
2. Decide how to split the changes into commits. Explain your plan briefly.
3. Stage and commit each group. Include `Co-Authored-By: MahammadNuriyev62 <maganuriyev@gmail.com>` in every commit.
4. Push to the current remote branch.
5. Monitor the deployment. Figure out how this project deploys:
   a. Check your memory files for notes about this project's deployment platform.
   b. Check `.github/workflows/` for CI/CD triggered on push. If found, use `gh run list --limit 1` then `gh run watch`.
   c. If no GitHub Actions, check if you have MCP servers for platforms like Railway, Vercel, Cloudflare. Use them to check deployment status and logs.
   d. If you can't determine the deployment method, ask the user. Save their answer to memory.
6. If the deployment fails, read logs, diagnose, fix, and repeat from step 1.
7. Report the final status: commits made, push result, and deployment outcome.
