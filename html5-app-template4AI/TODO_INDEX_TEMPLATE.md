# TODO Index

Use this file as the default entry for task backlog context.

Do not load full archived backlog unless the current task requires it.

## Snapshot

- Last Updated: `<YYYY-MM-DD>`
- Active List: `TODO_LIST.md`
- Archive Folder: `docs/todo_archive/`
- Active Scope Policy: `P0/P1 + recent completions (last 14 days)`
- Current Active Counts:
  - `P0`: `<COUNT>` open
  - `P1`: `<COUNT>` open
  - recently completed: `<COUNT>`

## Reading Strategy (Human + AI)

1. Start with this file (`TODO_INDEX.md`).
2. Load `TODO_LIST.md` only.
3. Load archive files only when:
   - a task ID or topic is not in the active list
   - root-cause tracing requires older context
   - migration/refactor planning needs historical decisions
4. include validation command/result
5. keep a stable `ID` (for example `T-001`) and use it in discussions/commits
6. When a task is fixed and committed, update that task record with the git commit hash.
7. Recommended field format in the task item: `Commit: <hash>`.

Reference rule:

- when possible, refer to TODO items by stable ID (for example `T-001`) instead of pasting full item text repeatedly.

## File Map

- `TODO_LIST.md`
  - active execution backlog, intentionally short
- `docs/todo_archive/README.md`
  - archive policy and maintenance rules
- `docs/todo_archive/<ARCHIVE_FILE>.md`
  - archived non-active and historical backlog
