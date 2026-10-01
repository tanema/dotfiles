#!/usr/bin/env bash
# Keeps the Mac awake only while Claude Code is actively working on a turn.
# start (UserPromptSubmit): launch caffeinate -i for this session if not already running.
# stop  (Stop):             kill this session's caffeinate so the machine can sleep again.
set -euo pipefail

action="$1"
input=$(cat)
session_id=$(jq -r '.session_id // "default"' <<<"$input")
pid_file="/tmp/claude-caffeinate-${session_id}.pid"

case "$action" in
	start)
		if [[ -f "$pid_file" ]] && kill -0 "$(cat "$pid_file")" 2>/dev/null; then
			exit 0
		fi
		nohup caffeinate -dis >/dev/null 2>&1 &
		disown
		echo $! >"$pid_file"
		;;
	stop)
		if [[ -f "$pid_file" ]]; then
			kill "$(cat "$pid_file")" 2>/dev/null || true
			rm -f "$pid_file"
		fi
		;;
esac
