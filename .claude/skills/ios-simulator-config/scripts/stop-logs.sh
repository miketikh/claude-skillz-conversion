#!/bin/bash
# Stops an active simulator log capture session and returns the captured logs

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Log session ID required"
  echo "Usage: bash stop-logs.sh <log-session-id>"
  exit 1
fi

LOG_SESSION_ID="$1"

# Call MCP tool
mcp call stop_sim_log_cap \
  --params "{\"logSessionId\":\"$LOG_SESSION_ID\"}" \
  npx -y xcodebuildmcp@latest
