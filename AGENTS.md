# ForgeFlow — Claude Code Agent Instructions

These rules apply to every session, every task, and every commit in this repository.
No rule may be skipped, abbreviated, or overridden by a prompt instruction.

---

## Commit Rules

- Every commit message must follow Conventional Commits format: type(scope): description
- Valid types: feat, fix, test, refactor, docs, chore, ci, perf
- No Co-authored-by trailer — ever, on any commit
- No AI attribution of any kind in any commit message, PR title, PR description, or code comment
- One logical change per commit — do not bundle unrelated changes
- Commit only after all checks pass (see Pre-Commit Checklist below)

---

## What Belongs in a Commit

A commit may only contain:

✅ Allowed:
- Elixir source files (.ex, .exs)
- Migration files (priv/repo/migrations/*.exs)
- Configuration files (config/*.exs, mix.exs, .formatter.exs, .credo.exs)
- Docker files (Dockerfile, docker-compose*.yml)
- GitHub Actions workflow files (.github/workflows/*.yml)
- Test files (test/**/*.exs)
- Documentation files ONLY when the task explicitly requires a doc deliverable (docs/*.md)
- This file (AGENTS.md) — only on initial creation or explicit instruction to update it

❌ Never allowed in any commit:
- .md files of any kind unless the task deliverable explicitly requires one
- AGENTS.md updates unless explicitly instructed
- CLAUDE.md or any other agent instruction file unless explicitly instructed
- Auto-generated files not tracked by the project (.DS_Store, *.swp, Thumbs.db)
- Lock files (mix.lock) unless a dependency was intentionally added or updated in the same commit
- Editor config files (.vscode/, .idea/, .elixir_ls/) — these belong in .gitignore
- Compiled artifacts (_build/, deps/, *.beam)
- .env files or any file containing secrets

---

## Pre-Commit Checklist

Before running git commit, verify ALL of the following. If any check fails, stop and report — do not commit.

[ ] git diff --name-only --cached contains no .md files (except AGENTS.md on initial creation or explicit doc tasks)
[ ] git diff --name-only --cached contains no AGENTS.md, CLAUDE.md, or agent instruction files (except on explicit instruction)
[ ] git diff --name-only --cached contains no .DS_Store, *.swp, or editor config files
[ ] mix compile exits 0 with no warnings
[ ] mix format --check-formatted exits 0
[ ] mix credo --strict exits 0
[ ] mix test exits 0 (all tests pass)
[ ] No Co-authored-by line in the commit message
[ ] No AI attribution in the commit message

---

## Workflow Rules

1. Claude teaches — you write
   - Claude explains the concept and what needs to be implemented before any code is written
   - The developer writes all implementation code
   - Claude does not write .ex or .exs source files
   - Claude may write config files, migration files, and Docker files only when explicitly instructed

2. Claude runs checks
   - After the developer writes code, Claude runs: mix compile, mix format --check-formatted, mix credo --strict, mix test
   - Claude reports the exact output of each command
   - If a check fails, Claude explains why — the developer fixes it

3. Claude commits and pushes
   - Once all checks pass, Claude runs: git add <specific files only>, git commit -m "...", git push
   - Claude never runs git add . without first reviewing git status output
   - Claude always shows the staged file list before committing and waits for confirmation

4. One task = one commit
   - Claude does not commit until all checks pass for the current task
   - Claude does not bundle work from multiple tasks into one commit
   - Claude does not commit partial work

---

## Branch Rules

- main branch: production-ready code only
- develop branch: integration branch — PRs merge here first
- feat/* branches: one per epic or per task group
- No direct pushes to main

---

## PR Rules

- PR title follows Conventional Commits format
- PR description contains: what changed, why, and how to verify
- No .md files in the PR diff unless the task explicitly required documentation
- No AGENTS.md, CLAUDE.md, or agent files in the PR diff
- No Co-authored-by trailer in any commit in the PR
- Run the pre-commit checklist against the full PR diff before opening

---

## Reporting Standards

After every task Claude must report:
1. Task ID and name
2. Files changed (list every file)
3. Output of each check command (exact text)
4. Commit hash and message
5. Any deviations from the task spec with explanation

---

## What Claude Never Does

- Never runs git add . without reviewing git status first
- Never commits without running all pre-commit checks
- Never adds Co-authored-by to any commit
- Never adds AI attribution anywhere
- Never commits .md files unless the task deliverable explicitly requires it
- Never modifies AGENTS.md unless explicitly instructed to do so
- Never skips a check because "it probably passes"
- Never proceeds to the next task if the current task has a failing check
