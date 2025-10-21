#!/bin/bash
# Type text (supports US keyboard characters)
# Use describe-ui.sh to find text field, tap to focus, then type
#
# Usage: bash type-text.sh <simulator-uuid> "<text>"
# Example: bash type-text.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX "Hello World"
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   text: Text to type (must be quoted if contains spaces)

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing required parameters"
  echo "Usage: bash type-text.sh <simulator-uuid> \"<text>\""
  exit 1
fi

SIMULATOR_UUID="$1"
TEXT="$2"

# Escape quotes in text for JSON
TEXT_ESCAPED=$(echo "$TEXT" | sed 's/"/\\"/g')

# Call MCP tool
mcp call type_text \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"text\":\"$TEXT_ESCAPED\"}" \
  npx -y xcodebuildmcp@latest
