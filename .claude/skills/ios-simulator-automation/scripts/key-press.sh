#!/bin/bash
# Press a single key by keycode on the simulator
#
# Usage: bash key-press.sh <simulator-uuid> <keycode> [duration]
# Example: bash key-press.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 40
# Example with duration: bash key-press.sh UUID 42 0.5
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   keycode: HID keycode (0-255)
#   duration: (Optional) Duration to press key in seconds
#
# Common keycodes:
#   40 = Return/Enter
#   42 = Backspace
#   43 = Tab
#   44 = Space
#   58-67 = F1-F10

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash key-press.sh <simulator-uuid> <keycode> [duration]"
  echo ""
  echo "Common keycodes:"
  echo "  40=Return, 42=Backspace, 43=Tab, 44=Space, 58-67=F1-F10"
  exit 1
fi

SIMULATOR_UUID="$1"
KEYCODE="$2"
DURATION="${3:-}"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"keyCode\":$KEYCODE"

if [ -n "$DURATION" ]; then
  PARAMS="$PARAMS,\"duration\":$DURATION"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call key_press --params "$PARAMS" npx -y xcodebuildmcp@latest
