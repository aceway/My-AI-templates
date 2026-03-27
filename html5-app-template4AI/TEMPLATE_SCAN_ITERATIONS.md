# Template Scan Iterations

Goal: iterative validation of the template directory for internal consistency, conflict-free logic, and practical executability for both new and legacy projects.

Note:
- The template folder name is not semantically important. Bootstrap behavior should resolve paths from the script location, even if the directory is renamed.

Stop rule: run up to 10 rounds; stop early if 3 consecutive rounds find no optimizable issues.

## Round 1

- Result: optimization applied.
- Issue found:
  - `PROJECT_DOC_SETUP_GUIDE.md` section `3.1 Strongly reusable` did not include `docs/todo_archive/README_TEMPLATE.md`, while TODO archive policy had been promoted to minimum doc set and bootstrap output.
- Action taken:
  - Added `docs/todo_archive/README_TEMPLATE.md` to the strongly reusable template list.
- Validation:
  - cross-reference scan passed for TODO-related template links and mentions.

## Round 2

- Result: optimization applied.
- Issue found:
  - `TODO_LIST_TEMPLATE.md` had no stable task ID field, which weakens long-term traceability across active list, archive moves, and commit/review discussion.
- Action taken:
  - Added `ID` field examples (`T-001`, `T-002`, `T-003`) to sample TODO items.
  - Added usage rule requiring stable IDs for discussion and commit references.
- Validation:
  - template structure remains compatible with existing timestamp and status rules.

## Round 3

- Result: optimization applied.
- Issue found:
  - `TODO_INDEX_TEMPLATE.md` referenced task-ID-based loading decisions but did not define a preferred referencing behavior for daily collaboration.
- Action taken:
  - Added explicit reference rule encouraging stable ID-based discussion (`T-001`) to reduce repeated long-text context.
- Validation:
  - reading strategy remains backward compatible for teams not yet using IDs.

## Round 4

- Result: no optimizable issue found.
- Checks performed:
  - TODO-rule cross-reference scan across template files.
  - bootstrap dry-run behavior verification.
- Notes:
  - links and policy references remained consistent after Round 1-3 changes.

## Round 5

- Result: no optimizable issue found.
- Checks performed:
  - fresh-project bootstrap simulation in temporary workspace.
  - TODO triad output verification (`TODO_INDEX.md`, `TODO_LIST.md`, `docs/todo_archive/README.md`).
  - ID/timestamp rule presence check in generated TODO list.
- Notes:
  - generated output matched expected policy and structure.

## Round 6

- Result: no optimizable issue found.
- Checks performed:
  - legacy-project repeat execution check (non-overwrite/skip behavior).
  - optional-doc flag dry-run check (`--include-optional`) for controlled extra outputs.
- Notes:
  - behavior remained stable and aligned with setup guide.

## Stop Condition

- Achieved 3 consecutive no-optimization rounds (`Round 4`, `Round 5`, `Round 6`).
- Per rule, iteration stopped early (did not continue to Round 10).
