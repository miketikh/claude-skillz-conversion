#!/bin/bash
# Sets the appearance mode (dark/light) of an iOS simulator

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash set-appearance.sh <simulator-uuid> <mode>"
  echo "Modes: dark, light"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Mode required"
  echo "Usage: bash set-appearance.sh <simulator-uuid> <mode>"
  echo "Modes: dark, light"
  exit 1
fi

SIMULATOR_UUID="$1"
MODE="$2"

# Validate mode
if [[ "$MODE" != "dark" && "$MODE" != "light" ]]; then
  echo "Error: Mode must be 'dark' or 'light'"
  exit 1
fi

# Call MCP tool
mcp call set_sim_appearance \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"mode\":\"$MODE\"}" \
  npx -y xcodebuildmcp@latest
