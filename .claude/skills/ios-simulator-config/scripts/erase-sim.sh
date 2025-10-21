#!/bin/bash
# Erases a specific simulator's content and settings

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UDID required"
  echo "Usage: bash erase-sim.sh <simulator-udid> [shutdown-first]"
  echo "shutdown-first: Optional boolean (true/false), defaults to false"
  exit 1
fi

SIMULATOR_UDID="$1"
SHUTDOWN_FIRST="${2:-false}"

# Call MCP tool
if [ "$SHUTDOWN_FIRST" = "true" ]; then
  mcp call erase_sims \
    --params "{\"simulatorUdid\":\"$SIMULATOR_UDID\",\"shutdownFirst\":true}" \
    npx -y xcodebuildmcp@latest
else
  mcp call erase_sims \
    --params "{\"simulatorUdid\":\"$SIMULATOR_UDID\"}" \
    npx -y xcodebuildmcp@latest
fi
