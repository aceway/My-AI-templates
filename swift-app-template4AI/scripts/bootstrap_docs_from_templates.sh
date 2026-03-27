#!/usr/bin/env bash

set -euo pipefail

SCRIPT_PATH="${BASH_SOURCE[0]}"
LOGICAL_SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd -L)"
PHYSICAL_SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd -P)"
TEMPLATES_DIR="$(cd "$PHYSICAL_SCRIPT_DIR/.." && pwd -P)"
INVOCATION_TEMPLATES_DIR="$(cd "$LOGICAL_SCRIPT_DIR/.." && pwd -L)"
TEMPLATES_DIR_NAME="$(basename "$TEMPLATES_DIR")"

DRY_RUN=0
FORCE=0
INCLUDE_OPTIONAL=0
TARGET_ROOT=""

usage() {
  cat <<'EOF'
Usage:
  <template-dir>/scripts/bootstrap_docs_from_templates.sh [--dry-run] [--force] [--include-optional] [--target-root <path>]

Options:
  --dry-run           Show what would be copied without writing files.
  --force             Overwrite existing target files.
  --include-optional  Also copy optional docs (BUILD_AND_RELEASE / HOST_BRIDGE / IMPORT_FORMATS).
  --target-root PATH  Explicit target repository root. Required when running inside the template repo itself.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --force) FORCE=1 ;;
    --include-optional) INCLUDE_OPTIONAL=1 ;;
    --target-root)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for --target-root" >&2
        usage
        exit 1
      fi
      TARGET_ROOT="$2"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

if [[ ! -f "$TEMPLATES_DIR/README_TEMPLATE.md" ]]; then
  echo "Template root is invalid: $TEMPLATES_DIR" >&2
  echo "Expected template files like README_TEMPLATE.md next to the scripts directory." >&2
  exit 1
fi

if [[ -n "$TARGET_ROOT" ]]; then
  ROOT_DIR="$(cd "$TARGET_ROOT" && pwd -P)"
elif [[ "$INVOCATION_TEMPLATES_DIR" != "$TEMPLATES_DIR" ]]; then
  ROOT_DIR="$(cd "$INVOCATION_TEMPLATES_DIR/.." && pwd -L)"
else
  ROOT_DIR="$(pwd -P)"
fi

if [[ "$ROOT_DIR" == "$TEMPLATES_DIR" ]]; then
  echo "Target root resolves to the template root: $ROOT_DIR" >&2
  echo "Run the script from the target repository, or pass --target-root <path>." >&2
  exit 1
fi

if [[ "$DRY_RUN" -ne 1 ]]; then
  mkdir -p "$ROOT_DIR/docs"
  mkdir -p "$ROOT_DIR/docs/todo_archive"
fi

copy_file() {
  local src="$1"
  local dst="$2"

  if [[ ! -f "$src" ]]; then
    echo "skip (missing template): $src"
    return 0
  fi

  if [[ -f "$dst" && "$FORCE" -ne 1 ]]; then
    echo "skip (exists): $dst"
    return 0
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "copy: $src -> $dst"
    return 0
  fi

  cp "$src" "$dst"
  echo "copied: $dst"
}

echo "template dir: $TEMPLATES_DIR_NAME"
echo "template root: $TEMPLATES_DIR"
echo "invocation template path: $INVOCATION_TEMPLATES_DIR"
echo "target root: $ROOT_DIR"

copy_file "$TEMPLATES_DIR/README_TEMPLATE.md" "$ROOT_DIR/README.md"
copy_file "$TEMPLATES_DIR/AGENTS_TEMPLATE.md" "$ROOT_DIR/AGENTS.md"
copy_file "$TEMPLATES_DIR/CODEBASE_RISKS_TEMPLATE.md" "$ROOT_DIR/CODEBASE_RISKS.md"
copy_file "$TEMPLATES_DIR/TODO_INDEX_TEMPLATE.md" "$ROOT_DIR/TODO_INDEX.md"
copy_file "$TEMPLATES_DIR/TODO_LIST_TEMPLATE.md" "$ROOT_DIR/TODO_LIST.md"
copy_file "$TEMPLATES_DIR/AI_TASK_PLAYBOOK_TEMPLATE.md" "$ROOT_DIR/docs/AI_TASK_PLAYBOOK.md"
copy_file "$TEMPLATES_DIR/docs/todo_archive/README_TEMPLATE.md" "$ROOT_DIR/docs/todo_archive/README.md"

copy_file "$TEMPLATES_DIR/docs/INVARIANTS_TEMPLATE.md" "$ROOT_DIR/docs/INVARIANTS.md"
copy_file "$TEMPLATES_DIR/docs/PRODUCT_BASELINE_TEMPLATE.md" "$ROOT_DIR/docs/PRODUCT_BASELINE.md"
copy_file "$TEMPLATES_DIR/docs/RUNTIME_ARCHITECTURE_TEMPLATE.md" "$ROOT_DIR/docs/RUNTIME_ARCHITECTURE.md"
copy_file "$TEMPLATES_DIR/docs/TESTING_STRATEGY_TEMPLATE.md" "$ROOT_DIR/docs/TESTING_STRATEGY.md"
if [[ "$INCLUDE_OPTIONAL" -eq 1 ]]; then
  copy_file "$TEMPLATES_DIR/docs/BUILD_AND_RELEASE_TEMPLATE.md" "$ROOT_DIR/docs/BUILD_AND_RELEASE.md"
  copy_file "$TEMPLATES_DIR/docs/HOST_BRIDGE_TEMPLATE.md" "$ROOT_DIR/docs/HOST_BRIDGE.md"
  copy_file "$TEMPLATES_DIR/docs/IMPORT_FORMATS_TEMPLATE.md" "$ROOT_DIR/docs/IMPORT_FORMATS.md"
fi

echo "done"
