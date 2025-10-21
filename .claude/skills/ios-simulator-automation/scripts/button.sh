#!/bin/bash
# Press hardware button on iOS simulator
#
# Usage: bash button.sh <simulator-uuid> <button-type> [duration]
# Example: bash button.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX home
# Example with duration: bash button.sh UUID lock 1.5
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   button-type: Type of button to press (required)
#   duration: (Optional) Duration to press button in seconds
#
# Valid button types:
#   - apple-pay
#   - home
#   - lock
#   - side-button
#   - siri

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash button.sh <simulator-uuid> <button-type> [duration]"
  echo ""
  echo "Valid button types:"
  echo "  apple-pay, home, lock, side-button, siri"
  exit 1
fi

SIMULATOR_UUID="$1"
BUTTON_TYPE="$2"
DURATION="${3:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"buttonType\":\"$BUTTON_TYPE\""

if [ -n "$DURATION" ]; then
  PARAMS="$PARAMS,\"duration\":$DURATION"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call button --params "$PARAMS" npx -y xcodebuildmcp@latest
