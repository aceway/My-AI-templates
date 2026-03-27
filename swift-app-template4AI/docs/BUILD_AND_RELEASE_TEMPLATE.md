# <PROJECT_NAME> Build and Release Notes

This document describes the current build, development, and bundle/signing-related behavior in the repository.

## 1) Tooling Baseline

- Xcode + Apple SDKs
- Swift Package Manager (if dependencies exist)
- `xcodebuild` command-line workflow

## 2) Main Project Commands

Document the canonical commands:

- development: `open <WORKSPACE_OR_PROJECT_FILE>`
- build: `xcodebuild -scheme <SCHEME_NAME> -configuration Release build`
- lint (if configured): `swiftlint`
- format (if configured): `swift-format --in-place --recursive <SOURCE_DIR>`
- combined check: `xcodebuild -scheme <SCHEME_NAME> -destination '<DESTINATION>' test`

If any of these modify files, say so explicitly.

## 3) Build Structure

- entry: `<XCODE_SCHEME_OR_SPM_TARGET>`
- output: `<APP_BUNDLE_OR_ARCHIVE_PATH>`
- important bundle/signing behavior: <PACKAGING_BEHAVIOR>

## 4) Runtime Asset Packaging

Document local app resources only if the project has them.

- <RUNTIME_ASSET_1>
- <RUNTIME_ASSET_2>

## 5) Helper Scripts

List only the helper scripts that matter in practice:

- `<SCRIPT_1>`: <BEHAVIOR>
- `<SCRIPT_2>`: <BEHAVIOR>

## 6) Recommended Commands

State the commands contributors should normally use.

## 7) Release Reality

If the project does not yet have a formal release runbook, say so directly.
