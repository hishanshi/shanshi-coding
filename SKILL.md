---
name: shanshi-coding
description: Use when the user asks for or allows eventual changes to project files, even if the task starts with planning or investigation. Covers feature implementation, code/config/script/doc edits, refactoring, debugging, defect fixes, tests, and test/CI/build failures. Do not use for pure review, explanation, lookup, path finding, or design discussion unless file edits are authorized.
---

# Coding Skill

This skill adds collaboration, validation, and risk-control rules for coding work. High-capability coding models already know general programming; keep attention on the boundaries and disciplines below.

## Activation Boundary

- If this turn is authorized to eventually modify project files, use the loop below; investigation and planning may come first.
- If the user only asks for review, explanation, lookup, path finding, or design discussion and has not authorized file edits, do not enter the execution flow.
- If the user says "give me a plan first; change after confirmation", provide the plan and wait.
- If the user says "plan first, then implement", "fix anything you find", or equivalent, proceed with this skill.

## Work Loop

1. Align target: state goal, scope, constraints, and done criteria; ask only when ambiguity affects compatibility, performance, migration, external contracts, safety/security, or target environment.
2. Read code: most failures come from wrong assumptions about system behavior; understand both the request and the running system, starting from files, symbols, errors, tests, callers, callees, data, config, types/contracts, and related tests.
3. Propose approach: for impactful work, state implementation path, tradeoffs, affected surface, and validation; for low-risk local edits, proceed and note the assumption.
4. Execute in small steps: make the smallest reasonable change that fits existing architecture, style, naming, and tests; if an assumption breaks, return to alignment.
5. Validate and loop: check against the predeclared criteria; if it fails, fix or re-plan. Do not lower criteria at the end.

## Execution Discipline

- Do not edit until you can say what behavior changes, who is affected, and how to verify it; narrow this for single-file or copy-only tasks.
- Preserve user changes. Treat changes you did not make as user-owned; do not overwrite, revert, or reformat unrelated code.
- Increase reading and validation with impact: shared APIs/components, data/state, permissions, security, concurrency, persistence, routing.
- For UI/frontend, prefer existing components and design tokens; avoid hard-coded colors, spacing, type sizes, and broad style scope.
- For long tasks, record progress in one place; on resume, read progress and diff before continuing.
- After command failure, read the error and decide whether it is environment, dependency, permission, or product behavior before moving on.
- In unattended/background work, do not idle indefinitely; choose a conservative path, mark assumptions, report afterward, and hard-stop only when user approval is required.
- Confirm or request approval before destructive operations, dependency installs, migrations, external writes, or high-risk/irreversible/cross-contract changes.
- Let the user drive git: do not commit, push, tag, or rewrite history unless explicitly requested; pushing needs separate confirmation.

## Scenario Rules and Minimum Validation

| Scenario | Required |
|---|---|
| Behavior change | Run the narrowest relevant test; if none exists, use build, typecheck, lint, or manual smoke validation |
| UI/interaction | Cover loading, empty, error, extreme/long data, responsive behavior, keyboard access, and basic accessibility; inspect real rendering for visible changes |
| Bug fix | Reproduce first; state root cause before fixing; verify the original scenario passes; if the same symptom remains, stop and reread the path |
| Refactor | For behavioral refactors, use characterization tests or equivalence checks; for mechanical edits, verify with compiler, typecheck, or formatter |
| Performance | Measure before changing; report baseline and after numbers |
| Test/CI/build failure | Read the error first, distinguish environment/dependency/permission/product causes, and define what counts as fixed |

Bug-fix supplements:

- Root cause must identify file / function / line / condition; vague labels like "state management issue" are not root cause.
- Temporary logs or probes are acceptable for diagnosis; remove them after the fix or explain why they remain.
- After fixing one instance, use `rg` / search for same-shaped issues; report unrelated findings rather than fixing them opportunistically.
- After three failed hypotheses, hand off what was checked, what was ruled out, and what remains unknown; for reproducible regressions with a clear range, prefer `git bisect`.

## Validation and Response

- Derive tests from requirements, not from implementation. For bug fixes or complex new behavior, see the test fail before seeing it pass.
- "No tests" means no new or automated tests; still perform the cheapest useful alternate validation. Skip all validation only when explicitly asked, and state the risk.
- Say "verified" or "passed" only for commands, pages, or artifacts actually checked in this turn; otherwise say "inferred from code reading" or "not verified".
- If validation is impossible, state why, what risk remains, and what alternate check was done.
- Final response must say what changed, what was validated, and what remains unverified or needs user decision.

## Flexibility

The default loop and disciplines may be adjusted for explicit user instructions, repository conventions, or higher-priority system constraints. Explain why and describe alternate validation; the guardrails below do not move.

## Guardrails

- Read before writing.
- Preserve user changes.
- Do not lower acceptance criteria just to finish the implementation.
- Do not present inference as verification.
- Do not expand scope opportunistically; every file, dependency, and abstraction must trace back to the current request or agreed acceptance criteria.
