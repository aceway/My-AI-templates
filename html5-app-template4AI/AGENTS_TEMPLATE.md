# <PROJECT_NAME> Engineering Agreement

This document is the top-level working agreement for contributors in this repository, including both human developers and AI coding agents.

Read this file as the project execution contract.

`AGENTS.md` is the entry document, not the place for every detail. Focused execution references should live under `docs/`.

## 1) Agreement Scope

This agreement exists to keep work in the repository:

- code-aligned
- low-regression
- appropriately constrained for the product
- understandable by both humans and AI
- documented in a maintainable way

## 2) Source of Truth and Authority

When information conflicts, use this order:

1. current code behavior
2. <PRIMARY_RUNTIME_OR_CONFIG_SOURCES>
3. `CODEBASE_RISKS.md`
4. `README.md`
5. historical notes, examples, or imported guidance from other projects

If code and docs diverge, update docs to match code unless the task explicitly changes behavior.

## 3) What This Project Is

<PROJECT_NAME> is currently:

- <PROJECT_IDENTITY_1>
- <PROJECT_IDENTITY_2>
- <PROJECT_IDENTITY_3>

This project is not:

- <NON_GOAL_1>
- <NON_GOAL_2>
- <NON_GOAL_3>

For the code-aligned baseline, read:

- `docs/PRODUCT_BASELINE.md`

For architecture boundaries and high-risk modules, read:

- `docs/RUNTIME_ARCHITECTURE.md`

## 4) Non-Negotiable Constraints

The following constraints take priority over implementation convenience:

- <INVARIANT_1>
- <INVARIANT_2>
- <INVARIANT_3>

For the full invariant set, read:

- `docs/INVARIANTS.md`

## 5) Engineering Rules

### 5.1 General

- Keep changes minimal and task-focused.
- Avoid unrelated refactors.
- Prefer fixing the real source of a bug instead of layering workarounds.
- Do not add dependencies unless explicitly requested.
- Prefer repo-native tooling and existing project workflows before introducing one-off workflows.

### 5.2 Language / Platform Rules

- Prefer patterns that fit the existing codebase.
- Preserve the active module, runtime, and ownership model.
- Follow existing naming and formatting conventions unless cleanup is part of the task.
- Be careful with lifecycle, resource ownership, and repeated work paths.

### 5.3 Code Quality

- Prioritize correctness, state flow, regressions, lifecycle safety, and validation gaps over style-only cleanup.
- Preserve stable public or cross-module contracts unless the task explicitly changes them.
- Validate with the lightest meaningful check first, then escalate when risk justifies it.

### 5.4 Runtime Safety

- Be cautious around globals, timers, shared mutable state, cross-boundary communication, and startup sequence assumptions.
- If a change can affect startup, data flow, render loop, background jobs, integration boundaries, or packaging behavior, treat it as high-risk until verified.

### 5.5 Diagnostics

- Do not assume all runtime contexts expose the same diagnostics behavior.
- Improve logging carefully so that diagnostics do not break production or host behavior.

### 5.6 Research and Feedback Tone

- Research and review should stay calm, direct, and evidence-first.
- Important technical risks should be stated clearly.
- Prefer references to real files, code paths, and runtime impact over abstract opinion.

## 6) Documentation Responsibilities

If behavior, structure, workflow, or engineering understanding changes, update docs in the same change set.

Common docs to consider:

- `README.md`
- `TODO_INDEX.md`
- `TODO_LIST.md`
- `CODEBASE_RISKS.md`
- `AGENTS.md`
- `docs/PRODUCT_BASELINE.md`
- `docs/RUNTIME_ARCHITECTURE.md`
- `docs/INVARIANTS.md`
- `docs/AI_TASK_PLAYBOOK.md`
- `docs/TESTING_STRATEGY.md`

Add optional focused docs only if they are relevant to the project.

## 7) Skills Guidance

Use the minimum skill set needed for the task.

Document only the skills that are actually available and useful in the repository.

Example structure:

### 7.x `<SKILL_NAME>`

Use for:

- <WHEN_TO_USE>

Best fit:

- <BEST_FIT_AREA>

Do not use for:

- <WHEN_NOT_TO_USE>

## 8) Required Execution Docs

List the focused docs by purpose:

1. product and runtime baseline
   - `docs/PRODUCT_BASELINE.md`
2. architecture boundaries and high-risk modules
   - `docs/RUNTIME_ARCHITECTURE.md`
3. non-negotiable guardrails
   - `docs/INVARIANTS.md`
4. AI task execution
   - `docs/AI_TASK_PLAYBOOK.md`
5. testing and validation
   - `docs/TESTING_STRATEGY.md`
6. known risks
   - `CODEBASE_RISKS.md`
7. active TODO window and archive entry
   - `TODO_INDEX.md`
   - `TODO_LIST.md`
   - `docs/todo_archive/README.md`

Execution rule:

- follow `docs/AI_TASK_PLAYBOOK.md` for task execution
- validate against `docs/INVARIANTS.md`
- for backlog context, read `TODO_INDEX.md` first, then `TODO_LIST.md`, then archive files only if needed
- if guidance conflicts, fall back to the authority order in Section 2

## 9) Practical Working Model

For most tasks, the expected workflow is:

1. build context from code first
2. confirm the active runtime path involved
3. identify the affected risk area
4. implement the minimal coherent change
5. run appropriate validation
6. update docs and risk notes if needed
7. summarize outcome, validation, and remaining risks clearly

For backlog-heavy tasks:

1. start from `TODO_INDEX.md`
2. load only `TODO_LIST.md` by default
3. open `docs/todo_archive/*` only when a task requires historical context

## 10) Final Notes

- Not every file in a repository necessarily reflects the active architecture.
- When in doubt, follow the code that is actually imported and reached by the active runtime path.
