# <PROJECT_NAME> Testing Strategy

This document defines how to validate changes in this repository.

## 1) Validation Principles

- Start with the lightest meaningful validation first.
- Escalate when the change touches higher-risk runtime paths.
- Prefer validating the real runtime path affected by the change.

## 2) Validation Layers

### 2.1 Documentation-only changes

Use for:

- `README.md`
- `AGENTS.md`
- `docs/*.md`
- `CODEBASE_RISKS.md`

Expected validation:

- read the edited file end to end
- check terminology against current code
- check linked docs and filenames

### 2.2 Static validation

Use for:

- low-risk code edits
- naming or formatting changes
- local control-flow fixes

Commands:

```bash
<STATIC_CHECK_COMMANDS>
```

Important:

- <MUTATING_COMMAND_WARNING_1>

### 2.3 Build validation

Use for:

- build or packaging changes
- asset path changes
- configuration changes

Command:

```bash
<BUILD_VALIDATION_COMMAND>
```

### 2.4 Runtime smoke validation

Use for:

- startup changes
- integration changes
- major flow changes

Minimum smoke checks:

1. <SMOKE_CHECK_1>
2. <SMOKE_CHECK_2>
3. <SMOKE_CHECK_3>

## 3) Area-Specific Validation

Add the project’s major high-risk areas here:

- <AREA_1>: <VALIDATION_EXPECTATION>
- <AREA_2>: <VALIDATION_EXPECTATION>
- <AREA_3>: <VALIDATION_EXPECTATION>

## 4) Reporting Rule

Every implementation summary should state:

- what was validated
- what was not validated
- whether validation commands were mutating
- remaining risks or unverified paths
