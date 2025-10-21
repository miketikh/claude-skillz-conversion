#!/bin/bash
# Sets a custom GPS location for the simulator

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash set-location.sh <simulator-uuid> <latitude> <longitude>"
  echo "Example: bash set-location.sh UUID 37.7749 -122.4194"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Latitude required"
  echo "Usage: bash set-location.sh <simulator-uuid> <latitude> <longitude>"
  exit 1
fi

if [ -z "$3" ]; then
  echo "Error: Longitude required"
  echo "Usage: bash set-location.sh <simulator-uuid> <latitude> <longitude>"
  exit 1
fi

SIMULATOR_UUID="$1"
LATITUDE="$2"
LONGITUDE="$3"

# Call MCP tool
mcp call set_sim_location \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"latitude\":$LATITUDE,\"longitude\":$LONGITUDE}" \
  npx -y xcodebuildmcp@latest
