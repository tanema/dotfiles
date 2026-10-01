#!/usr/bin/env bash
# Regenerates the Claude Code dracula theme from colorscheme/dracula.json
# so Claude Code and nvim never drift out of sync. Run via ./install.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PALETTE="$ROOT/colorscheme/dracula.json"
TOKEN_MAP="$ROOT/claude/scripts/dracula-theme-map.json"
THEME="$ROOT/claude/themes/dracula.json"

jq -n --slurpfile palette "$PALETTE" --slurpfile map "$TOKEN_MAP" '
  {
    name: "Dracula (dotfiles)",
    base: "dark",
    overrides: ($map[0] | map_values($palette[0][.]))
  }
' > "$THEME"
