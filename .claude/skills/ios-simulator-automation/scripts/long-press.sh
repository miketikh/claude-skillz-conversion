#!/bin/bash
# Long press at specific coordinates for given duration (ms)
# Use describe-ui.sh for precise coordinates (don't guess from screenshots)
#
# Usage: bash long-press.sh <simulator-uuid> <x> <y> <duration>
# Example: bash long-press.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 100 200 1000
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   x: X coordinate (integer)
#   y: Y coordinate (integer)
#   duration: Duration in milliseconds (must be > 0)

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash long-press.sh <simulator-uuid> <x> <y> <duration>"
  exit 1
fi

SIMULATOR_UUID="$1"
X="$2"
Y="$3"
DURATION="$4"

# Call MCP tool
mcp call long_press \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"x\":$X,\"y\":$Y,\"duration\":$DURATION}" \
  npx -y xcodebuildmcp@latest
