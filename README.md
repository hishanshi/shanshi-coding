# shanshi-coding

[中文](README.zh-CN.md)

`shanshi-coding` is an AI coding skill for engineering tasks where the user has asked for, or allowed, file changes.

It focuses on collaboration discipline, validation honesty, and risk control. The skill is intentionally compact: high-capability coding models already know general programming, so `SKILL.md` keeps only the operating boundaries and rules that are easy to forget under pressure.

### When To Use

Use this skill when the task may ultimately modify project files, including:

- Implementing features
- Editing code, config, scripts, or documentation
- Refactoring
- Debugging and fixing defects
- Adding or adjusting tests
- Handling test, CI, or build failures

Do not use it for pure review, explanation, lookup, path finding, or design discussion when file changes have not been authorized.

### What It Enforces

- Align goal, scope, constraints, and done criteria before implementation.
- Read the relevant code before editing.
- Preserve user changes and avoid unrelated cleanup.
- Make small, reversible changes.
- Validate according to the task type.
- Never claim tests or verification passed unless they actually ran.
- Treat bug fixes as root-cause work, not symptom patching.

### Install

Clone this repository into the skills directory for your coding tool.

#### Codex

```bash
mkdir -p ~/.agents/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.agents/skills/shanshi-coding
```

#### Claude Code

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.claude/skills/shanshi-coding
```

#### opencode

```bash
mkdir -p ~/.config/opencode/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.config/opencode/skills/shanshi-coding
```

### Update

```bash
git -C ~/.agents/skills/shanshi-coding pull
```

Adjust the path if you installed it for Claude Code or opencode.

## Files

- `SKILL.md`: the actual skill loaded by coding agents.
- `README.md`: English usage documentation.
- `README.zh-CN.md`: Chinese usage documentation.
