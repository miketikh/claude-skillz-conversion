#!/bin/bash
# Perform gesture on iOS simulator using preset gestures
#
# Usage: bash gesture.sh <simulator-uuid> <preset> [duration] [delta] [pre-delay] [post-delay]
# Example: bash gesture.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX scroll-down
# Example with timing: bash gesture.sh UUID scroll-up 0.5 0.01 0.2 0.3
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   preset: Gesture type (required)
#   duration: (Optional) Duration of gesture in seconds
#   delta: (Optional) Distance to move in pixels
#   pre-delay: (Optional) Delay before gesture in seconds
#   post-delay: (Optional) Delay after gesture in seconds
#
# Valid presets:
#   - scroll-up
#   - scroll-down
#   - scroll-left
#   - scroll-right
#   - swipe-from-left-edge
#   - swipe-from-right-edge
#   - swipe-from-top-edge
#   - swipe-from-bottom-edge

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash gesture.sh <simulator-uuid> <preset> [duration] [delta] [pre-delay] [post-delay]"
  echo ""
  echo "Valid presets:"
  echo "  scroll-up, scroll-down, scroll-left, scroll-right"
  echo "  swipe-from-left-edge, swipe-from-right-edge"
  echo "  swipe-from-top-edge, swipe-from-bottom-edge"
  exit 1
fi

SIMULATOR_UUID="$1"
PRESET="$2"
DURATION="${3:-}"
DELTA="${4:-}"
PRE_DELAY="${5:-}"
POST_DELAY="${6:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"preset\":\"$PRESET\""

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
mcp call gesture --params "$PARAMS" npx -y xcodebuildmcp@latest
