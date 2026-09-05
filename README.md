# shanshi-coding

[中文](README.zh-CN.md)

`shanshi-coding` supports everyday software development: requirements alignment, technical design, engineering documentation, implementation, technical diagnosis, review, and delivery.

Its purpose is to improve requirement understanding, engineering decisions, and the reliability of results. Apply only the guidance relevant to the task; ordinary work does not need a formal design document or a fixed sequence of steps. The instructions do not depend on a particular model or tool provider.

## When To Use

Use this skill for software project work:

- Align requirements for engineering work, compare technical designs, and maintain engineering documentation.
- Implement features, refactor, and change APIs, data contracts, configuration, scripts, or tests.
- Diagnose failures and fix defects.
- Review code and perform explicitly requested version-control or release operations.

Requests only to discuss business or explain existing business logic do not trigger the skill, even when reading code is necessary. Understanding business behavior remains part of applicable engineering work. General writing, personal records, and tasks unrelated to software engineering are also outside its scope.

Loading the skill does not authorize code changes. Technical analysis and review remain read-only; a documentation request authorizes the relevant documents. Implementation follows the user's request and confirmed context.

## Working Principles

- Resolve important ambiguity with project evidence and concrete expected behavior. Ask about unresolved business decisions; handle low-risk details autonomously.
- Establish ownership and contracts before detailed design. Choose a sound, maintainable approach, reuse existing capabilities, and justify added complexity.
- Define acceptance criteria and representative scenarios before implementation, independently of the code being written.
- Validate coherent changes using evidence proportional to risk and relevant to the target environment. Reuse valid results and respect user-specified test timing.
- Add tests for business behavior and regression risk. Explain the scenario, meaningful setup data, expected outcome, and assertion purpose without imposing a rigid comment template.
- Review findings against requirements and evidence. Report actual results and limitations, preserve user changes, and leave commits and releases to explicit user requests after review.
- Start commit messages with a one-line summary, then use a numbered body for the core changes and any necessary rationale. Use as many items as needed and respect the repository's commit format.

## Evaluating Effectiveness

A skill read shows that its instructions were loaded, not that they were followed successfully. Evaluate whether important ambiguities were resolved, designs reused appropriate capabilities, acceptance criteria preceded implementation, and validation covered the intended business outcome. Distinguish rework caused by misunderstood requirements or defects from new requirements and normal exploration; do not judge quality by load counts or test counts alone.

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
