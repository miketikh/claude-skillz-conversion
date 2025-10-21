#!/bin/bash
# Press key sequence using HID keycodes on iOS simulator with configurable delay
#
# Usage: bash key-sequence.sh <simulator-uuid> <keycode1,keycode2,...> [delay]
# Example: bash key-sequence.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX "40,42,44"
# Example with delay: bash key-sequence.sh UUID "40,42,44" 0.1
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   keycodes: Comma-separated list of keycodes (no spaces)
#   delay: (Optional) Delay between key presses in seconds
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
  echo "Usage: bash key-sequence.sh <simulator-uuid> <keycode1,keycode2,...> [delay]"
  echo ""
  echo "Example: bash key-sequence.sh UUID \"40,42,44\" 0.1"
  echo ""
  echo "Common keycodes:"
  echo "  40=Return, 42=Backspace, 43=Tab, 44=Space, 58-67=F1-F10"
  exit 1
fi

SIMULATOR_UUID="$1"
KEYCODES="$2"
DELAY="${3:-}"

# Convert comma-separated string to JSON array
KEYCODES_JSON="[${KEYCODES}]"

# Build params JSON
PARAMS="{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"keyCodes\":$KEYCODES_JSON"

if [ -n "$DELAY" ]; then
  PARAMS="$PARAMS,\"delay\":$DELAY"
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call key_sequence --params "$PARAMS" npx -y xcodebuildmcp@latest
