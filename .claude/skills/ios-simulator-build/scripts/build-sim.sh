#!/bin/bash
# Builds the CreatorLink iOS app for a specified simulator

if [ -z "$1" ]; then
  echo "Error: Simulator ID required"
  echo "Usage: bash build-sim.sh <simulator-id>"
  exit 1
fi

SIMULATOR_ID="$1"
PROJECT_PATH="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"
SCHEME="CreatorLink"

echo "Building $SCHEME for simulator $SIMULATOR_ID..."

# Call build_sim tool via mcp CLI
mcp call build_sim \
  --params "{\"projectPath\":\"$PROJECT_PATH\",\"scheme\":\"$SCHEME\",\"simulatorId\":\"$SIMULATOR_ID\"}" \
  npx -y xcodebuildmcp@latest
