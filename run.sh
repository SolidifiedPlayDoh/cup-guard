#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [ "$#" -eq 0 ]; then
  exec uv run cup-guard
fi
exec uv run cup-guard "$@"
