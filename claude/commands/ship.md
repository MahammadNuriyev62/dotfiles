Review all uncommitted changes (staged, unstaged, and untracked). Group them into one or more meaningful commits -- don't lump unrelated changes together, but don't over-split either. Each commit message should be concise and describe the "why".

Steps:
1. Run `git status` and `git diff` to understand what changed.
2. Decide how to split the changes into commits. Explain your plan briefly.
3. Stage and commit each group. Include `Co-Authored-By: MahammadNuriyev62 <maganuriyev@gmail.com>` in every commit.
4. Push to the current remote branch.
5. After pushing, check if this repo has GitHub Actions workflows (look in `.github/workflows/`).
6. If there are workflows triggered by push, monitor the run:
   - `gh run list --limit 1` to find the run
   - `gh run watch` to follow it live
   - If it fails, read logs with `gh run view --log-failed`, diagnose the issue, fix it, and repeat from step 1.
7. Report the final status: commits made, push result, and CI outcome.
