# <PROJECT_NAME>

<PROJECT_NAME> is a <PROJECT_TYPE> built with <TECH_STACK>.

The current codebase runs as <RUNTIME_MODE>. If runtime constraints matter, state them here clearly and briefly.

## Current Status

- Active stack: <TECH_STACK>
- Primary entry: <PRIMARY_ENTRY_FILE>
- Main orchestration: <ORCHESTRATION_FILES>
- High-level runtime owner: <RUNTIME_OWNER>
- Primary data or import path: <PRIMARY_DATA_PATH>
- Special subsystem path: <SPECIAL_SUBSYSTEM_PATH>

This README should describe the real current project state, not an old scaffold or starter template.

## Main Capabilities

- <CAPABILITY_1>
- <CAPABILITY_2>
- <CAPABILITY_3>
- <CAPABILITY_4>

## Runtime Model

The current runtime flow is:

1. <STEP_1>
2. <STEP_2>
3. <STEP_3>
4. <STEP_4>

Architecture note:

- <ARCHITECTURE_STYLE>
- <WHAT_IT_IS_NOT>

## Project Structure

Use a high-level structure that reflects the currently relevant parts of the repository:

```text
<PROJECT_NAME>/
├─ <DIR_OR_FILE_1>             # <DESCRIPTION>
├─ <DIR_OR_FILE_2>             # <DESCRIPTION>
├─ docs/                       # Engineering and workflow docs
├─ AGENTS.md                   # Engineering agreement
├─ CODEBASE_RISKS.md           # Known hazards and tracked issues
├─ TODO_INDEX.md               # Backlog entry point (low-token)
├─ TODO_LIST.md                # Active execution backlog
└─ README.md
```

## Development

Requirements:

- <RUNTIME_REQUIREMENT_1>
- <RUNTIME_REQUIREMENT_2>

Install dependencies:

```bash
<INSTALL_COMMAND>
```

Start development:

```bash
<DEV_COMMAND>
```

Build production output:

```bash
<BUILD_COMMAND>
```

Run validation or hygiene commands:

```bash
<LINT_COMMAND>
<FORMAT_COMMAND>
<CHECK_COMMAND>
```

Important:

- <MUTATING_COMMAND_WARNING_1>
- <MUTATING_COMMAND_WARNING_2>

## Shell Scripts

If this repository uses shell helpers, summarize only the scripts that matter in daily work:

- `<SCRIPT_NAME_1>`
  - <WHAT_IT_DOES>
- `<SCRIPT_NAME_2>`
  - <WHAT_IT_DOES>

If shell helpers are rough or legacy, say so directly.

## Build Notes

- Entry: `<BUILD_ENTRY>`
- Output: `<BUILD_OUTPUT>`
- Important packaging or runtime assets: <LOCAL_RUNTIME_ASSETS>
- Important build caveat: <BUILD_CAVEAT>

## AGENTS.md

`AGENTS.md` is the engineering entry agreement for this repository.

Use it when you are:

- contributing code
- reviewing risky areas
- working with an AI coding agent
- deciding which project docs to read first

Recommended reading order:

1. read `AGENTS.md`
2. follow its links into the focused docs under `docs/`
3. check `CODEBASE_RISKS.md` before editing high-risk areas
4. for backlog context, read `TODO_INDEX.md` then `TODO_LIST.md`

## Documentation Map

For engineering context, keep this section aligned to the actual docs that exist:

- `AGENTS.md`
  - top-level engineering agreement
- `docs/PRODUCT_BASELINE.md`
  - code-aligned product and runtime baseline
- `docs/RUNTIME_ARCHITECTURE.md`
  - architecture boundaries and risk areas
- `docs/INVARIANTS.md`
  - non-negotiable constraints
- `docs/AI_TASK_PLAYBOOK.md`
  - AI execution guidance
- `docs/TESTING_STRATEGY.md`
  - validation expectations
- `CODEBASE_RISKS.md`
  - tracked hazards and known issues
- `TODO_INDEX.md`
  - low-token backlog entry point and archive pointers
- `TODO_LIST.md`
  - active execution backlog (`P0/P1` + recent completions)
- `docs/todo_archive/`
  - archived non-active and historical backlog

Add optional focused docs only if they exist and matter.

## Current Cautions

- <CAUTION_1>
- <CAUTION_2>
- <CAUTION_3>

Before major edits, read `AGENTS.md`, `CODEBASE_RISKS.md`, `TODO_INDEX.md`, and the focused docs under `docs/`.
