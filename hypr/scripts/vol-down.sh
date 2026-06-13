#!/usr/bin/env bash
TIMEFILE=/tmp/vol-down.time
NOW=$(date +%s%3N)
LAST=$(cat "$TIMEFILE" 2>/dev/null || echo 0)
[ $((NOW - LAST)) -lt 150 ] && exit 0
echo "$NOW" > "$TIMEFILE"
swayosd-client --output-volume lower
