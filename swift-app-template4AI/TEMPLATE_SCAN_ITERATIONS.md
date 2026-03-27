# Template Scan Iterations

Goal: iterative validation of `templates/` for internal consistency, conflict-free logic, and practical executability for both new and legacy projects.

Stop rule: run up to 10 rounds; stop early if 3 consecutive rounds find no optimizable issues.

## Round 1

- Result: optimization applied.
- Issue found:
  - `templates/PROJECT_DOC_SETUP_GUIDE.md` in “New Project Workflow” used ambiguous copy steps that listed only target file names (`TODO_INDEX.md`, `docs/INVARIANTS.md`, etc.), but did not clearly show source template -> target mapping.
- Action taken:
  - Rewrote copy steps with explicit mappings, for example:
    - `TODO_INDEX_TEMPLATE.md` -> `TODO_INDEX.md`
    - `docs/INVARIANTS_TEMPLATE.md` -> `docs/INVARIANTS.md`
- Validation:
  - re-read affected sections and confirmed mappings are now explicit and executable.

## Round 2

- Result: optimization applied.
- Issue found:
  - `templates/AI_TASK_PLAYBOOK_TEMPLATE.md` had rigid wording: “before executing either path, get approval first”, which is not universally correct for repos with pre-approved or non-interactive command policies.
- Action taken:
  - Changed rule to policy-driven wording:
    - follow active repository approval policy for mutating operations
    - execute directly when command paths are pre-approved by policy, and report execution
- Validation:
  - checked updated policy sentence presence in the template.

## Round 3

- Result: optimization applied.
- Issue found:
  - `templates/PROJECT_DOC_SETUP_GUIDE.md` had inconsistent focused-template path style (some items omitted `docs/` prefix), creating reference ambiguity during scan and onboarding.
- Action taken:
  - normalized focused template references to `docs/..._TEMPLATE.md` form, including `docs/todo_archive/README_TEMPLATE.md`.
- Validation:
  - grep-based path scan confirms consistent `docs/` prefixed references across the focused-template lists.

## Round 4

- Result: no optimizable issue found.
- Checks performed:
  - `templates/scripts/bootstrap_docs_from_templates.sh --dry-run`
  - verified expected non-overwrite behavior for existing docs.
- Notes:
  - dry-run output remains stable and ends with `done`.

## Round 5

- Result: no optimizable issue found.
- Checks performed:
  - `templates/scripts/bootstrap_docs_from_templates.sh --dry-run --include-optional`
  - verified optional output list and copy targets.
- Notes:
  - optional docs (`BUILD_AND_RELEASE`, `HOST_BRIDGE`, `IMPORT_FORMATS`) are exposed correctly and consistently.

## Round 6

- Result: no optimizable issue found.
- Checks performed:
  - focused-template reference consistency scan in `templates/PROJECT_DOC_SETUP_GUIDE.md`
  - approval-policy wording presence check in `templates/AI_TASK_PLAYBOOK_TEMPLATE.md`
- Notes:
  - both fixes remain intact; no new conflict introduced.

## Stop Condition

- Achieved 3 consecutive no-optimization rounds (`Round 4`, `Round 5`, `Round 6`).
- Per rule, iteration stopped early (no need to continue to Round 10).

---

## Common-Sense Scan Run (software + daily workflow)

Focus: find and fix issues that violate practical common sense (tool availability assumptions, overly rigid time-window rules, collaboration pragmatics).

## Round 7

- Result: optimization applied.
- Issues found:
  - template commands implied `swiftlint` / `swift-format` as universally available, which is not true for every target repository.
  - TODO archive window was hard-coded as `14 days` in multiple places without explicit policy override guidance.
- Action taken:
  - made lint/format commands explicitly conditional in:
    - `templates/README_TEMPLATE.md`
    - `templates/docs/BUILD_AND_RELEASE_TEMPLATE.md`
    - `templates/docs/TESTING_STRATEGY_TEMPLATE.md`
  - normalized archive-window wording as “default 14 days, adjustable by team policy” in:
    - `templates/TODO_INDEX_TEMPLATE.md`
    - `templates/TODO_LIST_TEMPLATE.md`
    - `templates/docs/todo_archive/README_TEMPLATE.md`
    - `templates/AI_TASK_PLAYBOOK_TEMPLATE.md`
- Validation:
  - grep-based checks confirm updated wording and cross-file consistency.

## Round 8

- Result: no optimizable issue found.
- Checks performed:
  - optional-tooling wording scan across README/build/testing templates.
- Notes:
  - command guidance now clearly distinguishes canonical commands from repository-specific optional tooling.

## Round 9

- Result: no optimizable issue found.
- Checks performed:
  - TODO active-window policy consistency scan across index/list/archive/playbook templates.
- Notes:
  - all touched files now describe the same threshold policy model.

## Round 10

- Result: no optimizable issue found.
- Checks performed:
  - bootstrap stability check via `templates/scripts/bootstrap_docs_from_templates.sh --dry-run`.
- Notes:
  - behavior remains stable (`skip (exists)` + terminal `done`), with no regression introduced by wording updates.

## Stop Condition (Common-Sense Run)

- Achieved 3 consecutive no-optimization rounds (`Round 8`, `Round 9`, `Round 10`).
- Per rule, iteration stopped.
