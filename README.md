# shanshi-coding

[中文](README.zh-CN.md)

`shanshi-coding` is an AI coding skill for current-turn requests that explicitly authorize changes to software behavior or engineering controls. It also covers version-control and release operations explicitly requested after human review.

It focuses on collaboration discipline, validation honesty, and risk control. The skill is intentionally compact: high-capability coding models already know general programming, so `SKILL.md` keeps only the operating boundaries and rules that are easy to forget under pressure.

The prompt design avoids assumptions about provider-specific tools or reasoning mechanisms so the skill remains portable across capable coding agents.

## When To Use

Use this skill when the current request explicitly authorizes an engineering change, including:

- Implementing features
- Fixing defects or refactoring
- Changing APIs or data contracts
- Updating runtime, build, or CI configuration and scripts
- Adding or adjusting tests and resolving related failures
- Performing version-control or release operations explicitly requested after human review

Documentation is included only when required by the engineering change. Read-only analysis and independent content or metadata maintenance do not trigger this skill.

## What It Enforces

- Distinguish read-only work from requests that authorize local changes.
- Treat an unambiguous "continue implementation" or "complete the agreed plan" as current-turn authorization; otherwise, do not inherit authorization from an earlier turn.
- Align goal, scope, constraints, and done criteria before implementation.
- Read the relevant code before editing.
- Preserve user changes and avoid unrelated cleanup.
- Continue safe in-scope local work without repeated approval requests.
- Stop before destructive, irreversible, costly, scope-expanding, or external-system state changes that lack authorization.
- Complete coherent changes before running minimum-sufficient, risk-matched validation by default; validate earlier only when the result must guide implementation or block a high-risk mistake.
- Merge overlapping checks and do not rerun checks that later changes have not invalidated.
- Never claim tests or verification passed unless they actually ran.
- Treat bug fixes as root-cause work, not symptom patching.
- For frontend changes, inspect real rendering only when static checks cannot cover material visual or interaction risk; use alternative evidence and report the remaining risk when rendering cost is unreasonable.
- Report what changed, what was actually validated, what remains unverified, and any remaining risk in a format proportional to the task size.

## Install

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

## Update

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

## Uninstall

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
