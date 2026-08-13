#!/usr/bin/env bash

# Globally install Eagle Review into each detected agent's global folder.

set -euo pipefail

eagle_repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Claude Code agent and skill
if [[ -d "$HOME/.claude" ]]; then
  mkdir -p "$HOME/.claude/agents"
  target="$HOME/.claude/agents/eagle-review.md"
  if [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Skipping non-symlink: %s\n' "$target" >&2
  else
    ln -sfn "$eagle_repo_dir/claude/eagle-review.md" "$target"
    printf 'Linked %s -> %s\n' "$target" "$eagle_repo_dir/claude/eagle-review.md"
  fi

  mkdir -p "$HOME/.claude/skills"
  target="$HOME/.claude/skills/eagle-review"
  if [[ "$eagle_repo_dir" == "$target" ]]; then
    printf 'Skill already installed at %s\n' "$target"
  elif [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Skipping non-symlink: %s\n' "$target" >&2
  else
    ln -sfn "$eagle_repo_dir" "$target"
    printf 'Linked %s -> %s\n' "$target" "$eagle_repo_dir"
  fi
else
  printf 'Skipping %s; config directory does not exist.\n' "$HOME/.claude"
fi

# OpenCode agent
if [[ -d "$HOME/.config/opencode" ]]; then
  mkdir -p "$HOME/.config/opencode/agents"
  target="$HOME/.config/opencode/agents/eagle-review.md"
  if [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Skipping non-symlink: %s\n' "$target" >&2
  else
    ln -sfn "$eagle_repo_dir/opencode/eagle-review.md" "$target"
    printf 'Linked %s -> %s\n' "$target" "$eagle_repo_dir/opencode/eagle-review.md"
  fi
else
  printf 'Skipping %s; config directory does not exist.\n' "$HOME/.config/opencode"
fi

# Codex agent
if [[ -d "$HOME/.codex" ]]; then
  mkdir -p "$HOME/.codex/agents"
  target="$HOME/.codex/agents/eagle-review.toml"
  if [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Skipping non-symlink: %s\n' "$target" >&2
  else
    ln -sfn "$eagle_repo_dir/codex/eagle-review.toml" "$target"
    printf 'Linked %s -> %s\n' "$target" "$eagle_repo_dir/codex/eagle-review.toml"
  fi
else
  printf 'Skipping %s; config directory does not exist.\n' "$HOME/.codex"
fi

# Shared Codex and OpenCode skill
if [[ -d "$HOME/.agents" ]]; then
  mkdir -p "$HOME/.agents/skills"
  target="$HOME/.agents/skills/eagle-review"
  if [[ "$eagle_repo_dir" == "$target" ]]; then
    printf 'Skill already installed at %s\n' "$target"
  elif [[ -e "$target" && ! -L "$target" ]]; then
    printf 'Skipping non-symlink: %s\n' "$target" >&2
  else
    ln -sfn "$eagle_repo_dir" "$target"
    printf 'Linked %s -> %s\n' "$target" "$eagle_repo_dir"
  fi
else
  printf 'Skipping %s; config directory does not exist.\n' "$HOME/.agents"
fi
