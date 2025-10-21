#!/bin/bash
# Captures screenshot for visual verification
# Note: For UI coordinates, use describe-ui instead (don't determine coordinates from screenshots)
#
# Usage: bash screenshot.sh <simulator-uuid>
# Example: bash screenshot.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
#
# Returns: Base64-encoded image data

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash screenshot.sh <simulator-uuid>"
  exit 1
fi

SIMULATOR_UUID="$1"

# Call MCP tool
mcp call screenshot \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\"}" \
  npx -y xcodebuildmcp@latest
