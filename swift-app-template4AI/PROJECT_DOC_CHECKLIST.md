# Project Documentation Checklist

Use this checklist when adapting the templates into a real repository.

## Top-Level Docs

- `README.md` states the real current stack
- `README.md` describes the real development/build commands
- `README.md` points to `AGENTS.md` and focused docs
- `README.md` points to `TODO_INDEX.md` and `TODO_LIST.md` for backlog usage
- `AGENTS.md` defines authority order
- `AGENTS.md` defines non-negotiable constraints
- `AGENTS.md` points to the focused docs under `docs/`
- `docs/AI_TASK_PLAYBOOK.md` is written for AI execution, not only for humans

## Core Focused Docs

- `docs/INVARIANTS.md` exists
- `docs/PRODUCT_BASELINE.md` exists
- `docs/RUNTIME_ARCHITECTURE.md` exists
- `docs/TESTING_STRATEGY.md` exists
- `CODEBASE_RISKS.md` exists
- `TODO_INDEX.md` exists
- `TODO_LIST.md` exists
- `docs/todo_archive/README.md` exists

## Project Alignment

- source of truth reflects the real repository
- runtime constraints reflect the real product
- startup flow reflects the real code
- high-risk areas reflect the real code
- validation rules reflect the real workflows
- TODO window policy reflects real team workflow (`index/list/archive`)

## Optional Docs

- add `docs/BUILD_AND_RELEASE.md` if build flow is non-trivial
- add `docs/HOST_BRIDGE.md` if host or native integration exists
- add `docs/IMPORT_FORMATS.md` if import formats or data ingestion paths are important
- add archive files in `docs/todo_archive/` if backlog has moved items

## Common-Sense Checks

- command examples are realistically runnable for the target repo (no assumed tools unless marked optional)
- approval and mutation wording follows repository policy (not one-size-fits-all)
- time-window rules use defaults + policy override language when teams may vary (for example TODO archive thresholds)
- guidance avoids rigid absolutes unless truly required by safety or architecture constraints
- examples are explicit enough to execute directly (template source -> target mapping is clear)

## Final Review

- no placeholder text remains
- no rules were copied from unrelated projects without verification
- docs do not conflict with code
- docs do not duplicate each other excessively
- docs are readable by both humans and AI
- `TODO_LIST.md` remains short and active-window focused
