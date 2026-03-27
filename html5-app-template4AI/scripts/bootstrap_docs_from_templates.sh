#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$TEMPLATES_DIR/.." && pwd)"
TEMPLATE_DIR_NAME="$(basename "$TEMPLATES_DIR")"

if [[ ! -f "$TEMPLATES_DIR/README_TEMPLATE.md" ]]; then
  echo "Template directory is invalid: $TEMPLATES_DIR" >&2
  exit 1
fi

DRY_RUN=0
FORCE=0
INCLUDE_OPTIONAL=0

usage() {
  cat <<EOF
Usage:
  <template-dir>/scripts/bootstrap_docs_from_templates.sh [--dry-run] [--force] [--include-optional]

Example from repo root:
  ./${TEMPLATE_DIR_NAME}/scripts/bootstrap_docs_from_templates.sh --dry-run

Options:
  --dry-run           Show what would be copied without writing files.
  --force             Overwrite existing target files.
  --include-optional  Also copy optional docs (HOST_BRIDGE / IMPORT_FORMATS).
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --force) FORCE=1 ;;
    --include-optional) INCLUDE_OPTIONAL=1 ;;
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

mkdir -p "$ROOT_DIR/docs"
mkdir -p "$ROOT_DIR/docs/todo_archive"

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
copy_file "$TEMPLATES_DIR/docs/BUILD_AND_RELEASE_TEMPLATE.md" "$ROOT_DIR/docs/BUILD_AND_RELEASE.md"

if [[ "$INCLUDE_OPTIONAL" -eq 1 ]]; then
  copy_file "$TEMPLATES_DIR/docs/HOST_BRIDGE_TEMPLATE.md" "$ROOT_DIR/docs/HOST_BRIDGE.md"
  copy_file "$TEMPLATES_DIR/docs/IMPORT_FORMATS_TEMPLATE.md" "$ROOT_DIR/docs/IMPORT_FORMATS.md"
fi

echo "done"
