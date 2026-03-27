# <PROJECT_NAME> Testing Strategy

This document defines how to validate changes in this repository.

## 1) Validation Principles

- Start with the lightest meaningful validation first.
- Escalate when the change touches higher-risk execution paths.
- Prefer validating the real execution path affected by the change.
- Prefer Apple-native test frameworks first: `XCTest` (unit/integration) and `XCUITest` (UI flow).
- New tests should be automation-friendly and runnable via command line (`xcodebuild test`) and CI lanes.

Priority order for testing decisions:

1. safety/correctness
2. automation/repeatability
3. efficiency/reuse

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
xcodebuild -scheme <SCHEME_NAME> -configuration Debug build
swiftlint
```

Note: use `swiftlint` only if linting is configured in the target repository.

Important:

- <MUTATING_COMMAND_WARNING_1>

### 2.3 Build validation

Use for:

- build or packaging changes
- app resource path changes
- configuration changes

Command:

```bash
xcodebuild -scheme <SCHEME_NAME> -configuration Release archive
```

### 2.4 Runtime smoke validation

Use for:

- startup changes
- integration changes
- major flow changes

Minimum smoke checks:

1. Launch the app on a simulator or device and confirm startup is stable.
2. Validate one primary user flow in the active scene/navigation path.
3. Validate lifecycle-sensitive behavior (background/foreground, state restore, or permissions) relevant to the change.

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
