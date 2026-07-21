# shanshi-coding

[中文](README.zh-CN.md)

`shanshi-coding` is an AI coding skill for engineering tasks where the current request authorizes local project-file changes.

It focuses on collaboration discipline, validation honesty, and risk control. The skill is intentionally compact: high-capability coding models already know general programming, so `SKILL.md` keeps only the operating boundaries and rules that are easy to forget under pressure.

The prompt design avoids assumptions about provider-specific tools or reasoning mechanisms so the skill remains portable across capable coding agents.

### When To Use

Use this skill when the current request authorizes modifying project files, including:

- Implementing features
- Editing code, config, scripts, or documentation
- Refactoring
- Diagnosing and fixing defects
- Adding or adjusting tests
- Handling test, CI, or build failures

Do not use it for read-only review, diagnosis, explanation, lookup, path finding, design discussion, or a plan that requires later approval before editing.

### What It Enforces

- Distinguish read-only work from requests that authorize local changes.
- Align goal, scope, constraints, and done criteria before implementation.
- Read the relevant code before editing.
- Preserve user changes and avoid unrelated cleanup.
- Continue safe in-scope local work without repeated approval requests.
- Stop before destructive, irreversible, external, costly, or scope-expanding actions that lack authorization.
- Validate according to the task type.
- Never claim tests or verification passed unless they actually ran.
- Treat bug fixes as root-cause work, not symptom patching.
- End every change with evidence about what changed, what was validated, and what remains unverified; use the default headings unless another format is required.

### Install

Option A: clone this repository anywhere and install it to local tool directories:

```bash
git clone https://github.com/hishanshi/shanshi-coding.git
cd shanshi-coding
./publish.sh -n install all
./publish.sh install all
```

By default, `publish.sh` skips an existing `SKILL.md` that it does not manage. Use `--force` only when you intentionally want to replace that file.

Option B: clone it directly into one tool's skills directory.

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

When `publish.sh` runs from a directly cloned tool directory, it skips that tool because the source and destination are the same file. It can still install the skill for the other tools.

### Update

If you installed with `publish.sh`:

```bash
git pull
./publish.sh install all
```

If you cloned directly into a tool directory:

```bash
git -C ~/.agents/skills/shanshi-coding pull
```

Adjust the path if you installed it for Claude Code or opencode.

### Uninstall

If you installed with `publish.sh`:

```bash
./publish.sh -n uninstall all
./publish.sh uninstall all
```

The uninstall command only removes SKILL.md files marked as managed by this script. If you cloned this repository directly into a tool directory, remove that cloned directory manually.

## Files

- `SKILL.md`: the actual skill loaded by coding agents.
- `README.md`: English usage documentation.
- `README.zh-CN.md`: Chinese usage documentation.
- `publish.sh`: local install/uninstall script for Claude Code, Codex, and opencode.
