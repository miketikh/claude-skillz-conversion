#!/bin/bash
# Gets the complete view hierarchy with precise frame coordinates for all visible elements
# Use this before UI interactions - do NOT guess coordinates from screenshots
#
# Usage: bash describe-ui.sh <simulator-uuid>
# Example: bash describe-ui.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
#
# Returns: JSON tree with frame data (x, y, width, height) for accurate automation

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash describe-ui.sh <simulator-uuid>"
  exit 1
fi

SIMULATOR_UUID="$1"

# Call MCP tool
mcp call describe_ui \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\"}" \
  npx -y xcodebuildmcp@latest
