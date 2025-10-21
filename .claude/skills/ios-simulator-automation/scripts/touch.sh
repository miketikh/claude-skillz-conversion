#!/bin/bash
# Perform touch down/up events at specific coordinates
# Use describe-ui.sh for precise coordinates (don't guess from screenshots)
#
# Usage: bash touch.sh <simulator-uuid> <x> <y> [down] [up] [delay]
# Example: bash touch.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 100 200 true false
# Example with delay: bash touch.sh UUID 100 200 true true 0.5
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   x: X coordinate (integer)
#   y: Y coordinate (integer)
#   down: (Optional) true/false for touch down event
#   up: (Optional) true/false for touch up event
#   delay: (Optional) Delay between events in seconds

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash touch.sh <simulator-uuid> <x> <y> [down] [up] [delay]"
  exit 1
fi

SIMULATOR_UUID="$1"
X="$2"
Y="$3"
DOWN="${4:-}"
UP="${5:-}"
DELAY="${6:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"x\":$X,\"y\":$Y"

if [ -n "$DOWN" ]; then
  PARAMS="$PARAMS,\"down\":$DOWN"
fi

if [ -n "$UP" ]; then
  PARAMS="$PARAMS,\"up\":$UP"
fi

if [ -n "$DELAY" ]; then
  PARAMS="$PARAMS,\"delay\":$DELAY"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call touch --params "$PARAMS" npx -y xcodebuildmcp@latest
