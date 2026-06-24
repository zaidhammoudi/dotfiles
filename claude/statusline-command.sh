#!/usr/bin/env bash
# Claude Code status line: model name + context progress bar

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

if [ -n "$used" ]; then
  # Build a 20-char progress bar
  filled=$(echo "$used" | awk '{printf "%d", ($1 / 100) * 20}')
  empty=$((20 - filled))
  bar=""
  for i in $(seq 1 $filled); do bar="${bar}█"; done
  for i in $(seq 1 $empty);  do bar="${bar}░"; done

  used_int=$(echo "$used" | awk '{printf "%d", $1}')
  printf "%s  [%s] %s%%" "$model" "$bar" "$used_int"
else
  printf "%s  [context pending]" "$model"
fi
