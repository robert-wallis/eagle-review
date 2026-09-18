# Eagle Review

A code reviewer that examines complete changes in repository context and reports
only verified, actionable problems.

Reviews cover behavior and code cleanliness: clarity, responsibilities, duplicated
business logic, behavior contracts, dependencies, and abstractions. Cleanliness
findings explain a specific problem and suggest a focused improvement supported by
the code. Routine cleanup is P3; significant maintainability problems are P2.

**Author:** [Robert Wallis](https://github.com/robert-wallis)

- **Claude Code agent:** installs a read-only planning-mode reviewer at
  `~/.claude/agents/eagle-review.md`.
- **Codex agent:** installs a high-reasoning, read-only reviewer at
  `~/.codex/agents/eagle-review.toml`.
- **OpenCode agent:** installs a constrained review subagent at
  `~/.config/opencode/agents/eagle-review.md`.
- **Agent Skill:** installs the portable `$eagle-review` workflow at
  `~/.agents/skills/eagle-review` for Codex and OpenCode, plus
  `~/.claude/skills/eagle-review` for Claude Code.

Run `./install.sh` to create the symlinks. Existing non-symlink files are never
replaced.
