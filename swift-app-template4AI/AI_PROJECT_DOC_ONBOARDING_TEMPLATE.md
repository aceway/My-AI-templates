# AI Project Doc Onboarding Template

This template is an execution brief for AI coding agents.

Goal: use the documentation templates in this repository to onboard a target project and generate a complete, code-aligned document set.

## 1) Inputs Required

Before execution, collect:

- target repository root path
- whether this is a new project or legacy project
- runtime constraints (for example: offline-only, local-only, no third-party runtime calls)
- language and stack
- existing docs that must be preserved
- allowed validation commands
- commit policy (for example: whether backup commit can run directly)

If input is missing, infer conservatively from code and existing docs.

## 2) Target Outputs

Create or adapt these documents:

- `README.md`
- `AGENTS.md`
- `CODEBASE_RISKS.md`
- `TODO_INDEX.md`
- `TODO_LIST.md`
- `docs/AI_TASK_PLAYBOOK.md`
- `docs/todo_archive/README.md`
- `docs/INVARIANTS.md`
- `docs/PRODUCT_BASELINE.md`
- `docs/RUNTIME_ARCHITECTURE.md`
- `docs/TESTING_STRATEGY.md`

Optional outputs (only if relevant):

- `docs/BUILD_AND_RELEASE.md`
- `docs/HOST_BRIDGE.md`
- `docs/IMPORT_FORMATS.md`

## 3) Execution Procedure

1. Inspect repository structure and active app entry points.
2. Read existing docs and identify stale, conflicting, or missing sections.
3. Bootstrap templates:
   - run `templates/scripts/bootstrap_docs_from_templates.sh --dry-run`
   - then run `templates/scripts/bootstrap_docs_from_templates.sh`
   - use `--include-optional` only when project concepts exist
4. Replace placeholders with repository-specific facts.
5. Remove copied assumptions that do not match target project reality.
6. Ensure authority order and constraints are consistent across docs.
7. Add known bugs/risks into `CODEBASE_RISKS.md` with timestamps.
8. Build backlog workflow:
   - keep active items in `TODO_LIST.md`
   - keep snapshot and pointers in `TODO_INDEX.md`
   - move non-active items into `docs/todo_archive/`
9. Validate consistency between docs and current code paths.

## 4) Quality Gates

Do not finish until all checks pass:

- no `<PLACEHOLDER>` text remains
- no contradiction between `AGENTS.md` and `docs/INVARIANTS.md`
- README commands match actual project scripts or tooling
- high-risk modules in architecture docs map to real paths
- `CODEBASE_RISKS.md` includes actionable items (not vague statements)
- TODO docs follow low-token policy (`TODO_INDEX` -> `TODO_LIST` -> archive on-demand)
- docs are readable by both humans and AI

## 5) Safety and Change Control

- Prefer small, auditable edits.
- Do not overwrite existing docs blindly in legacy repositories.
- For mutating commands, follow the repository approval policy.
- If a command path fails, switch to a safe fallback path and report it.
- Do not use external runtime resources if project constraints disallow them.

## 6) Completion Report Format

When done, report:

- files created/updated
- key decisions and assumptions
- validation commands executed
- unresolved risks and follow-up recommendations
- commit hash and message if a backup commit was created
