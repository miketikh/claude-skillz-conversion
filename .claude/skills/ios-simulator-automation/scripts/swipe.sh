#!/bin/bash
# Swipe from one point to another
# Use describe-ui.sh for precise coordinates (don't guess from screenshots)
# Supports configurable timing via optional parameters
#
# Usage: bash swipe.sh <simulator-uuid> <x1> <y1> <x2> <y2> [duration] [delta] [pre-delay] [post-delay]
# Example: bash swipe.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 100 400 100 100
# Example with timing: bash swipe.sh UUID 100 400 100 100 0.5 0.01 0.2 0.3
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   x1, y1: Starting coordinates
#   x2, y2: Ending coordinates
#   duration: (Optional) Duration of swipe in seconds
#   delta: (Optional) Time between touch events in seconds
#   pre-delay: (Optional) Delay before swipe in seconds
#   post-delay: (Optional) Delay after swipe in seconds

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ] || [ -z "$5" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash swipe.sh <simulator-uuid> <x1> <y1> <x2> <y2> [duration] [delta] [pre-delay] [post-delay]"
  exit 1
fi

SIMULATOR_UUID="$1"
X1="$2"
Y1="$3"
X2="$4"
Y2="$5"
DURATION="${6:-}"
DELTA="${7:-}"
PRE_DELAY="${8:-}"
POST_DELAY="${9:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"x1\":$X1,\"y1\":$Y1,\"x2\":$X2,\"y2\":$Y2"

if [ -n "$DURATION" ]; then
  PARAMS="$PARAMS,\"duration\":$DURATION"
fi

if [ -n "$DELTA" ]; then
  PARAMS="$PARAMS,\"delta\":$DELTA"
fi

if [ -n "$PRE_DELAY" ]; then
  PARAMS="$PARAMS,\"preDelay\":$PRE_DELAY"
fi

if [ -n "$POST_DELAY" ]; then
  PARAMS="$PARAMS,\"postDelay\":$POST_DELAY"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call swipe --params "$PARAMS" npx -y xcodebuildmcp@latest
