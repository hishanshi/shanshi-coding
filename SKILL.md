---
name: shanshi-coding
description: Use only when the current turn explicitly authorizes local project edits to change software behavior or an engineering control surface, such as features, bug fixes, refactoring, APIs or data contracts, runtime/build/CI configuration, scripts, tests, or failure remediation. Include documentation only when required by that engineering change. Do not use for questions, reviews, recommendations, standalone content or record maintenance, authorization from an earlier turn, or low-risk text/metadata edits with no engineering effect. Enforces scoped edits, reuse of existing contracts, risk-based validation, protection of user changes, and evidence-based reporting.
---

# Coding Skill

Deliver the authorized software outcome with the smallest coherent change and validation proportional to its risk.

## Authorization and Scope

- Treat authorization as current-turn and outcome-specific. A request to implement, change, fix, or refactor authorizes safe in-scope local edits and validation.
- Treat questions, diagnosis, review, comparison, and phrasing such as “是否需要”, “有没有问题”, “为什么”, or “应该怎么调整” as analysis-only. Do not edit files unless the current turn also asks for the change. Authorization from an earlier turn does not carry into a later question.
- Ask when unresolved ambiguity materially affects compatibility, migrations, external contracts, security, persisted data, or the target environment.
- Require confirmation before destructive, irreversible, external, costly, or materially scope-expanding actions, including material dependency changes.
- Do not commit, push, tag, or rewrite history unless explicitly requested. An explicit request authorizes only the named Git action unless a higher-priority policy requires another approval.

## Work Loop

1. **Align:** establish the outcome, scope, constraints, and observable completion criteria. For cross-layer rules or metrics, establish source fields, filters, state semantics, and output contracts first.
2. **Inspect:** read relevant implementation, tests, consumers, conventions, and user changes. Before adding an endpoint, action, state, schema, or abstraction, search for the same domain concept and reuse a compatible contract; do not invent a parallel flow from an assumption.
3. **Change:** make the smallest coherent architectural change. Explain the approach and validation before impactful work; proceed directly for low-risk reversible work.
4. **Validate:** check the requested behavior. If evidence breaks an assumption, correct or re-plan.

## Execution Guardrails

- Judge risk by impact, not file count. Inspect consumers before changing shared contracts, data shapes, permissions, security, persistence, routing, or state transitions.
- Preserve user-owned changes; do not overwrite, revert, or reformat unrelated work.
- Keep every changed file, dependency, and abstraction traceable to the requested outcome; do not lower acceptance criteria or expand scope opportunistically.
- For UI, prefer existing components and tokens; avoid broad style scope and unexplained hard-coded values.

## Risk-Based Validation

Choose the cheapest check that can detect the plausible failure; escalate only when risk or evidence warrants it.

| Change | Minimum validation |
|---|---|
| Mechanical text/format/metadata | Focused diff; syntax or format check only when relevant |
| Local behavior | Narrowest test; otherwise focused typecheck, lint, build, or smoke check |
| Shared or cross-layer contract | Direct consumers plus one focused integration or end-to-end path |
| Material UI layout/interaction/routing | Real rendering and relevant responsive, state, keyboard, and accessibility cases |
| Content-only UI | Render only when content length, structure, or styling creates credible layout risk |
| Refactor | Characterization/equivalence for behavior; compile, typecheck, format, or diff for mechanics |
| Performance | Measure before changing and report comparable before/after results |
| Test/CI/build failure | Classify the error, fix its cause, then rerun the check that demonstrates recovery |

- For bugs, reproduce when practical, identify the mechanism, and verify the original scenario. Prefer a regression test or exact reproduction for complex behavior.
- “No tests” still requires the cheapest useful alternate check. Skip all validation only when explicitly asked, and state the risk.
- Batch unchanged expensive checks after adjacent low-risk tweaks at a milestone or before closing.
- If validation is unavailable, state what remains unverified, why, the risk, and any alternate check performed.
- After three failed hypotheses, re-baseline what is known, ruled out, and unknown. For a reproducible regression with a clear range, prefer `git bisect`.

## Closing Report

Report what changed, checks actually run, and remaining uncertainty. Use `Changed`, `Validated`, and `Unverified / needs decision` headings for substantial work; use one to three sentences for a small low-risk change. Say “verified” or “passed” only for checks run, and label reading-based conclusions as inferred.

Explicit user instructions, repository conventions, and higher-priority constraints may change the method or report format, but not permission boundaries, validation honesty, or protection of user work.
