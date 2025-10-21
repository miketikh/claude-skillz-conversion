#!/bin/bash
# Starts capturing logs from a simulator (returns session ID)

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash start-logs.sh <simulator-uuid> <bundle-id> [capture-console]"
  echo "capture-console: Optional boolean (true/false), defaults to false"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Bundle ID required"
  echo "Usage: bash start-logs.sh <simulator-uuid> <bundle-id> [capture-console]"
  exit 1
fi

SIMULATOR_UUID="$1"
BUNDLE_ID="$2"
CAPTURE_CONSOLE="${3:-false}"

# Call MCP tool
if [ "$CAPTURE_CONSOLE" = "true" ]; then
  mcp call start_sim_log_cap \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"bundleId\":\"$BUNDLE_ID\",\"captureConsole\":true}" \
    npx -y xcodebuildmcp@latest
else
  mcp call start_sim_log_cap \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"bundleId\":\"$BUNDLE_ID\"}" \
    npx -y xcodebuildmcp@latest
fi
