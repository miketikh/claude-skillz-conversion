#!/bin/bash
# Stops an active device log capture session and returns the captured logs
# Usage: bash stop-device-logs.sh <session-id>
#
# Examples:
#   bash stop-device-logs.sh SESSION_ID_FROM_START_COMMAND

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Log session ID required"
  echo "Usage: bash stop-device-logs.sh <session-id>"
  echo ""
  echo "Tip: The session ID is returned by start-device-logs.sh"
  exit 1
fi

LOG_SESSION_ID="$1"

# Call MCP tool
mcp call stop_device_log_cap \
  --params "{\"logSessionId\":\"$LOG_SESSION_ID\"}" \
  npx -y xcodebuildmcp@latest
