#!/bin/bash
# Builds and runs the CreatorLink iOS app on a specified simulator
# This deploys the new build and launches it automatically

if [ -z "$1" ]; then
  echo "Error: Simulator ID required"
  echo "Usage: bash build-and-run.sh <simulator-id>"
  exit 1
fi

SIMULATOR_ID="$1"
PROJECT_PATH="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"
SCHEME="CreatorLink"

echo "Building and running $SCHEME on simulator $SIMULATOR_ID..."

mcp call build_run_sim \
  --params "{\"projectPath\":\"$PROJECT_PATH\",\"scheme\":\"$SCHEME\",\"simulatorId\":\"$SIMULATOR_ID\"}" \
  npx -y xcodebuildmcp@latest
