# CODEBASE TODO LIST (Active Window)

This file is the active execution backlog.

Scope policy:

- keep this file short for low-context AI collaboration
- keep `P0/P1` open items here
- keep only recently completed items here (default window: last 14 days, adjustable by team policy)
- move older completed items and non-active backlog to `docs/todo_archive/`

Use `TODO_INDEX.md` as the default entry point.

## Usage Rule

When a TODO is fixed:

1. each item must record `Added At` and `Fixed At` timestamps
2. append short fix note and date
3. change `[ ]` -> `[x]`
4. include validation command/result
5. keep a stable `ID` (for example `T-001`) and use it in discussions/commits
6. execute one task at a time; after one task is completed, committed, and confirmed, then move to the next task
7. these rules may be broken only when a human explicitly confirms breaking them in the interaction
8. without explicit interactive confirmation from a human, these rules are non-negotiable
9. every git commit message for TODO-driven work must start with the active task ID in brackets, for example `[T-024] refactor(input): simplify vertical OCR path`

Rule for open items:

- if not fixed yet, `Fixed At` must be `N/A`

## P0 - Critical (fix first)

- [ ] **<TASK_TITLE_1>**
  - ID: `T-001`
  - Added At: `<YYYY-MM-DD HH:MM TZ>`
  - Fixed At: `N/A`
  - Problem: <CURRENT_FAILURE_OR_RISK>
  - Fix target: <EXPECTED_FIX_OUTCOME>
  - Verify: <VALIDATION_CONDITION_OR_COMMAND>

- [ ] **<TASK_TITLE_2>**
  - ID: `T-002`
  - Added At: `<YYYY-MM-DD HH:MM TZ>`
  - Fixed At: `N/A`
  - Problem: <CURRENT_FAILURE_OR_RISK>
  - Fix target: <EXPECTED_FIX_OUTCOME>
  - Verify: <VALIDATION_CONDITION_OR_COMMAND>

## P1 - High

- [ ] **<TASK_TITLE_3>**
  - ID: `T-003`
  - Added At: `<YYYY-MM-DD HH:MM TZ>`
  - Fixed At: `N/A`
  - Problem: <CURRENT_FAILURE_OR_RISK>
  - Fix target: <EXPECTED_FIX_OUTCOME>
  - Verify: <VALIDATION_CONDITION_OR_COMMAND>

## Recently Completed (Last 14 Days)

- None yet.
