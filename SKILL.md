---
name: shanshi-coding
description: Use when the user asks for or allows eventual changes to project files, even if the task starts with planning or investigation. Covers feature implementation, code/config/script/doc edits, refactoring, debugging, defect fixes, tests, and test/CI/build failures. Do not use for pure review, explanation, lookup, path finding, or design discussion unless file edits are authorized.
---

# Coding Skill

This skill adds collaboration, validation, and risk-control rules for coding work. High-capability coding models already know general programming; keep attention on the boundaries and disciplines below.

## Activation Boundary

- Enter the work loop when this turn is authorized to eventually modify project files; investigation and planning may come first. Stay out of the execution flow for pure review, explanation, lookup, path finding, or design discussion without edit authorization.
- If the user says "give me a plan first; change after confirmation", provide the plan and wait.
- If the user says "plan first, then implement", "fix anything you find", or equivalent, proceed with this skill.

## Work Loop

1. Align target: state goal, scope, constraints, and done criteria; ask only when ambiguity affects compatibility, performance, migration, external contracts, safety/security, or target environment.
2. Read code: most failures come from wrong assumptions about system behavior; understand both the request and the running system — files, symbols, errors, callers, callees, data, config, types/contracts, and related tests.
3. Propose approach: for impactful work, state implementation path, tradeoffs, affected surface, and planned validation before editing. A low-impact, reversible local edit that does not touch shared contracts, security, persisted data, migrations, or external systems may proceed directly with the assumption noted; file count alone does not determine risk.
4. Execute in small steps: before each edit, be able to say what behavior changes, who is affected, and how you will verify it; make the smallest reasonable change that fits existing architecture, style, naming, and tests; if an assumption breaks, return to alignment.
5. Validate and loop: check against the predeclared criteria; if a check fails, fix or re-plan.

## Execution Discipline

- Prefer expressive names and clear structure over comments that restate the
  code. For complex or non-obvious logic, add concise comments explaining intent,
  constraints, invariants, edge cases, or tradeoffs, and keep them updated.
- In Java projects, import types explicitly and use their simple names in method
  bodies and signatures; use fully qualified names only to resolve conflicts.
- For changes affecting shared APIs/components, data shape, permissions,
  security, concurrency, persistence, or routing, inspect direct consumers before
  editing and run one additional consumer-level or end-to-end validation.
- For UI/frontend, prefer existing components and design tokens; avoid hard-coded
  visual values and broad style scope.
- For long or unattended work, record resumable progress, choose conservative
  assumptions, and stop only when user approval is required.
- Request approval before destructive operations, dependency installs,
  migrations, external writes, or other high-risk or irreversible changes.
- Let the user drive git: do not commit, push, tag, or rewrite history unless
  explicitly requested; pushing requires separate confirmation.

## Scenario Rules and Minimum Validation

| Scenario | Required |
|---|---|
| Behavior change | Run the narrowest relevant test; if none exists, use build, typecheck, lint, or manual smoke validation |
| UI/interaction | Inspect real rendering for visible changes; exercise the affected states and responsive/extreme-data cases; for interaction changes, check relevant loading/empty/error behavior, keyboard access, and basic accessibility. If real rendering cannot be inspected, report it under Unverified / needs decision |
| Bug fix | Follow the bug-fix workflow below |
| Refactor | For behavioral refactors, use characterization tests or equivalence checks; for mechanical edits, verify with compiler, typecheck, or formatter |
| Performance | Measure before changing; report baseline and after numbers |
| Test/CI/build failure | Read the error first, distinguish environment/dependency/permission/product causes, and define what counts as fixed |

Bug-fix workflow:

- Reproduce the issue, identify the specific trigger and mechanism, then verify
  the original scenario after fixing it. When the cause is code-local, name the
  file, symbol, and condition.
- Temporary probes are allowed during diagnosis but must be removed afterward.
  Search for same-shaped issues after the fix; report unrelated findings without
  changing them.
- After three failed hypotheses, re-baseline what is known, ruled out, and still
  unknown. For reproducible regressions with a clear range, prefer `git bisect`.

## Validation

- Derive tests from requirements, not from implementation. For bug fixes or complex new behavior, see the test fail before seeing it pass.
- "No tests" means no new or automated tests; still perform the cheapest useful alternate validation. Skip all validation only when explicitly asked, and state the risk.
- If validation is impossible, state why, what risk remains, and what alternate check was done.

## Closing Report (required)

End every turn that changed files with exactly these headings, in this order; replace the prompts with task-specific content and never omit a heading:

```markdown
**Changed**
- <files touched and behavior delta>

**Validated**
- <checks actually run this turn and their results>

**Unverified / needs decision**
- <unchecked items, remaining risk, and user decisions; or "none">
```

Use "verified" or "passed" only under Validated and only for checks that ran. Put conclusions from code reading under Unverified / needs decision as "inferred from code reading", along with any unavailable real-rendering check.

## Flexibility

The default loop and disciplines may be adjusted for explicit user instructions, repository conventions, or higher-priority system constraints. Explain why and describe alternate validation; the guardrails below do not move.

## Guardrails

- Read before writing.
- Preserve user changes: treat changes you did not make as user-owned; do not overwrite, revert, or reformat unrelated code.
- Do not lower acceptance criteria to get to done.
- Do not present inference as verification.
- Do not expand scope opportunistically; every file, dependency, and abstraction must trace back to the current request or agreed acceptance criteria.
