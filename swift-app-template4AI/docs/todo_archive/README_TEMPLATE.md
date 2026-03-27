# TODO Archive Policy

This folder stores non-active backlog to keep `TODO_LIST.md` short.

## Purpose

- reduce context/token cost in AI-assisted development
- preserve historical backlog decisions
- avoid losing medium/low-priority work items

## Active vs Archive

- `TODO_LIST.md`: active window only (`P0/P1` open + recent completions)
- `docs/todo_archive/*.md`: older completed items, deferred items, and non-active backlog

## Maintenance Rules

1. Keep `TODO_LIST.md` focused on current execution.
2. Move completed items older than the active-window threshold into archive (default: 14 days, adjustable by team policy).
3. Move non-active `P2/P3` backlog into archive unless actively scheduled.
4. Keep archived entries immutable except for correction notes.
5. Update `TODO_INDEX.md` snapshot after each archive action.

## Naming

Use descriptive, time-based file names:

- `YYYY-MM_<topic>_ARCHIVE.md`
