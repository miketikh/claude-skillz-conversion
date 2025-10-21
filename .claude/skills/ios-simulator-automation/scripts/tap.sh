#!/bin/bash
# Tap at specific coordinates
# Use describe-ui.sh to get precise element coordinates (don't guess from screenshots)
#
# Usage: bash tap.sh <simulator-uuid> <x> <y> [pre-delay] [post-delay]
# Example: bash tap.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 100 200
# Example with delays: bash tap.sh UUID 100 200 0.5 0.3
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   x: X coordinate (integer)
#   y: Y coordinate (integer)
#   pre-delay: (Optional) Delay before tap in seconds
#   post-delay: (Optional) Delay after tap in seconds

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash tap.sh <simulator-uuid> <x> <y> [pre-delay] [post-delay]"
  exit 1
fi

SIMULATOR_UUID="$1"
X="$2"
Y="$3"
PRE_DELAY="${4:-}"
POST_DELAY="${5:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"x\":$X,\"y\":$Y"

if [ -n "$PRE_DELAY" ]; then
  PARAMS="$PARAMS,\"preDelay\":$PRE_DELAY"
fi

if [ -n "$POST_DELAY" ]; then
  PARAMS="$PARAMS,\"postDelay\":$POST_DELAY"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call tap --params "$PARAMS" npx -y xcodebuildmcp@latest
