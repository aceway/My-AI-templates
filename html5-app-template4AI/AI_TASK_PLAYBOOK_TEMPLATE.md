# <PROJECT_NAME> AI Task Playbook

This document is written for AI coding agents working in this repository.

Read this file as execution guidance, not as background reading.

## 1) Mission

Your job is to help with this repository accurately, safely, and efficiently.

Default goals:

1. understand the real current code path
2. avoid introducing regressions
3. keep changes minimal and focused
4. validate the affected behavior
5. update docs when understanding or behavior changes

## 2) Required Reading Order

Before doing meaningful work, use this order:

1. relevant code files
2. `docs/INVARIANTS.md`
3. `CODEBASE_RISKS.md`
4. `TODO_INDEX.md`
5. `TODO_LIST.md` (active window only)
6. `docs/RUNTIME_ARCHITECTURE.md`
7. `docs/TESTING_STRATEGY.md`
8. other focused docs only if needed

If guidance conflicts, follow the authority order in `AGENTS.md`.

TODO context rule:

- do not load `docs/todo_archive/*` by default
- load archive only when current task needs historical backlog context
- Do not read or analyze the contents of directories such as `dist` or `node_modules`, binary files, or files ending in `*.min.js`, unless explicitly requested to do so via an interactive prompt requiring confirmation.

## 3) Default Execution Loop

For most tasks, follow this sequence:

1. read the relevant code
2. identify the active runtime path
3. identify risk level
4. choose the safest implementation path
5. make the smallest coherent change
6. validate the affected behavior
7. update docs or risk notes if needed
8. report result, validation, and remaining risks

Do not skip the code-reading step for non-trivial tasks.

## 4) Modification Rules

Without explicit interactive confirmation from a human, these rules are non-negotiable.

When a task will modify code or project data:

- prefer open, transparent, stable skills first
- only fall back to temporary scripts or ad hoc shell commands when no suitable skill exists
- before executing either path, get approval first

Do not create hidden or unnecessary automation when a clear, inspectable path already exists.

If the user has already authorized a specific repeated operation pattern, follow the repo-specific policy for that pattern.

For TODO-driven work:

- every git commit message must start with the active task ID in brackets, for example `[T-024] refactor(input): simplify vertical OCR path`

## 5) Risk Classification

Treat a task as high-risk if it touches:

- startup flow
- primary data or import flow
- integration boundaries
- render loop or repeated runtime work
- background jobs, workers, or host bridge behavior
- packaging or runtime asset paths

High-risk work requires extra care in both implementation and validation.

## 6) Implementation Rules

While changing code:

- prefer the real fix over workaround layering
- preserve existing runtime contracts unless the task explicitly changes them
- do not broaden scope without a good reason
- do not refactor unrelated areas
- do not assume project constraints that are not written down
- do not assume networked runtime resources are allowed unless explicitly permitted

If the task touches risky infrastructure, keep the blast radius small and explain it clearly.

## 7) Validation Rules

Always validate after a meaningful code change.

Validation strategy:

- start with the lightest meaningful check
- escalate when the task risk is higher
- use `docs/TESTING_STRATEGY.md` as the source of validation detail

At minimum, report:

- what you validated
- what you did not validate
- whether the validation commands were mutating
- remaining risks or unverified paths

If you create a backup commit:

- follow the repo policy for direct execution vs approval
- confirm the result with git commands after the commit is created
- return the commit hash and commit message in the report

## 8) Documentation Rules

Update docs when:

- runtime behavior changes
- engineering understanding changes
- constraints change
- workflow expectations change
- new important risks are discovered

Common docs to consider:

- `README.md`
- `AGENTS.md`
- `TODO_INDEX.md`
- `TODO_LIST.md`
- `CODEBASE_RISKS.md`
- `docs/PRODUCT_BASELINE.md`
- `docs/RUNTIME_ARCHITECTURE.md`
- `docs/INVARIANTS.md`
- `docs/TESTING_STRATEGY.md`

Add optional focused docs only if they exist in the project.

## 8.1) TODO Load and Archive Strategy

Use a low-token backlog workflow:

1. read `TODO_INDEX.md` first
2. read `TODO_LIST.md` second
3. open archive files only on-demand

Archive maintenance policy:

- keep `TODO_LIST.md` as active window (`P0/P1` open + recent completions)
- move older completed items (older than 14 days) to `docs/todo_archive/`
- move non-active `P2/P3` backlog to archive unless explicitly scheduled
- after archiving, update snapshot numbers in `TODO_INDEX.md`

## 9) Communication Rules

When reporting back:

- be direct
- be evidence-first
- mention real files or runtime paths
- do not hide uncertainty
- do not soften important risk statements

If something is unverified, say so clearly.

## 10) Repository-Specific Reminders

State the project-specific reminders here, for example:

- <RUNTIME_CONSTRAINT_1>
- <RUNTIME_CONSTRAINT_2>
- <HIGH_RISK_AREA_1>
- <HIGH_RISK_AREA_2>

## 11) Practical Checklist

Before finishing a task, check:

- Did I read the relevant code?
- Did I confirm the real runtime path?
- Did I respect `docs/INVARIANTS.md`?
- Did I check `CODEBASE_RISKS.md` for related hazards?
- Did I use `TODO_INDEX.md`/`TODO_LIST.md` instead of loading full archive by default?
- Did I use the safest available modification path?
- Did I validate the affected behavior?
- Did I update docs if needed?
- Did I report outcome, validation, and residual risk clearly?
