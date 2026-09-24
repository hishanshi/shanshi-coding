#!/usr/bin/env bash
# 公共协作约定与 coding skill 的统一发布入口。
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec python3 -B "$ROOT/scripts/publish.py" "$@"
