# Project Documentation Setup Guide

This guide explains how to use the templates in this directory for a new repository or an existing repository.

In examples below, `<template-dir>` means the folder that contains these template files. The folder name is not fixed and may be `templates`, `html5-app-template4AI`, or another project-specific name.

If you want AI-first execution instructions for onboarding, read:

- `AI_PROJECT_DOC_ONBOARDING_TEMPLATE.md`

## 1) Goal

The templates are meant to bootstrap a human + AI collaboration workflow without forcing any specific product stack.

They are designed to:

- work for both new and legacy projects
- separate top-level agreement from focused docs
- keep project constraints explicit
- reduce repeated setup effort across repositories

## 2) Template Layers

Use the templates in two layers:

### 2.1 Top-level entry docs

- `README_TEMPLATE.md`
- `AGENTS_TEMPLATE.md`
- `AI_TASK_PLAYBOOK_TEMPLATE.md`
- `CODEBASE_RISKS_TEMPLATE.md`
- `TODO_INDEX_TEMPLATE.md`
- `TODO_LIST_TEMPLATE.md`

These define the high-level collaboration surface.

### 2.2 Focused docs

Under `<template-dir>/docs/`:

- `INVARIANTS_TEMPLATE.md`
- `PRODUCT_BASELINE_TEMPLATE.md`
- `RUNTIME_ARCHITECTURE_TEMPLATE.md`
- `TESTING_STRATEGY_TEMPLATE.md`
- `BUILD_AND_RELEASE_TEMPLATE.md`
- `HOST_BRIDGE_TEMPLATE.md`
- `IMPORT_FORMATS_TEMPLATE.md`
- `todo_archive/README_TEMPLATE.md`

Some of these are universal, and some are optional.

## 3) Which Templates Are Usually Reusable

### 3.1 Strongly reusable

These are good template candidates for most repositories:

- `AGENTS_TEMPLATE.md`
- `AI_TASK_PLAYBOOK_TEMPLATE.md`
- `CODEBASE_RISKS_TEMPLATE.md`
- `TODO_INDEX_TEMPLATE.md`
- `TODO_LIST_TEMPLATE.md`
- `docs/todo_archive/README_TEMPLATE.md`
- `INVARIANTS_TEMPLATE.md`
- `TESTING_STRATEGY_TEMPLATE.md`
- `README_TEMPLATE.md`

### 3.2 Reusable with project-specific filling

These work well when the project has a clear runtime model:

- `PRODUCT_BASELINE_TEMPLATE.md`
- `RUNTIME_ARCHITECTURE_TEMPLATE.md`
- `BUILD_AND_RELEASE_TEMPLATE.md`

### 3.3 Optional / domain-specific

Use these only if the project actually has the concept:

- `HOST_BRIDGE_TEMPLATE.md`
- `IMPORT_FORMATS_TEMPLATE.md`

## 4) New Project Workflow

For a new project:

1. copy `README_TEMPLATE.md` to `README.md`
2. copy `AGENTS_TEMPLATE.md` to `AGENTS.md`
3. copy `AI_TASK_PLAYBOOK_TEMPLATE.md` to `docs/AI_TASK_PLAYBOOK.md`
4. copy TODO docs:
   - `TODO_INDEX_TEMPLATE.md` -> `TODO_INDEX.md`
   - `TODO_LIST_TEMPLATE.md` -> `TODO_LIST.md`
   - `docs/todo_archive/README_TEMPLATE.md` -> `docs/todo_archive/README.md`
5. copy the core focused docs:
   - `docs/INVARIANTS_TEMPLATE.md` -> `docs/INVARIANTS.md`
   - `docs/PRODUCT_BASELINE_TEMPLATE.md` -> `docs/PRODUCT_BASELINE.md`
   - `docs/RUNTIME_ARCHITECTURE_TEMPLATE.md` -> `docs/RUNTIME_ARCHITECTURE.md`
   - `docs/TESTING_STRATEGY_TEMPLATE.md` -> `docs/TESTING_STRATEGY.md`
6. fill placeholders with the actual project stack, runtime model, constraints, and risk areas
7. add optional focused docs only if the project really needs them

Quick start command:

```bash
./<template-dir>/scripts/bootstrap_docs_from_templates.sh --dry-run
./<template-dir>/scripts/bootstrap_docs_from_templates.sh
```

Useful flags:

- `--force`: overwrite existing files
- `--include-optional`: also copy optional docs

The bootstrap script resolves the template directory from its own location, so it still works if the folder is renamed from `templates/` to something else.

It also assumes the template directory sits directly under the target repository root.

## 5) Existing Project Workflow

For an old or already active project:

1. do not overwrite existing docs blindly
2. map current code reality first
3. identify what is stale, missing, or mixed together
4. adapt the templates into project-specific docs
5. keep code-aligned facts and remove inherited assumptions from unrelated repos

For legacy projects, templates should be used as a restructuring guide, not as copy-paste truth.

## 6) Minimum Viable Doc Set

If you want the smallest useful doc set, start with:

- `README.md`
- `AGENTS.md`
- `docs/AI_TASK_PLAYBOOK.md`
- `TODO_INDEX.md`
- `TODO_LIST.md`
- `docs/todo_archive/README.md`
- `docs/INVARIANTS.md`
- `docs/PRODUCT_BASELINE.md`
- `docs/RUNTIME_ARCHITECTURE.md`
- `docs/TESTING_STRATEGY.md`
- `CODEBASE_RISKS.md`

## 7) Fill-In Priority

When filling templates, do this first:

1. project identity
2. source of truth / authority order
3. non-negotiable constraints
4. active runtime path
5. high-risk areas
6. active TODO window strategy (index/list/archive)
7. validation expectations
8. documentation map

Do not leave these abstract.

## 8) Important Warning

These templates are useful only if they are grounded back into real project code.

Do not leave placeholder text in committed project docs.
Do not copy constraints from another project unless they are truly valid in the target repository.
