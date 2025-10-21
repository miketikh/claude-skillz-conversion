#!/bin/bash
# Resets the simulator's location to default

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash reset-location.sh <simulator-uuid>"
  exit 1
fi

SIMULATOR_UUID="$1"

# Call MCP tool
mcp call reset_sim_location \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\"}" \
  npx -y xcodebuildmcp@latest
