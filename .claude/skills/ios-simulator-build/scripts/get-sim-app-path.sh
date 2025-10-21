#!/bin/bash
# Gets the app bundle path for a simulator application
# This is useful for finding the built .app bundle location

if [ -z "$1" ]; then
  echo "Error: Simulator ID or name required"
  echo "Usage: bash get-sim-app-path.sh <simulator-id-or-name>"
  echo ""
  echo "Examples:"
  echo "  bash get-sim-app-path.sh 15614731-924F-489D-9CEA-232D041C4225"
  echo "  bash get-sim-app-path.sh \"iPhone 16 Pro\""
  exit 1
fi

SIMULATOR_ARG="$1"
PROJECT_PATH="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"
SCHEME="CreatorLink"
PLATFORM="iOS Simulator"

echo "Getting app bundle path for $SCHEME on $SIMULATOR_ARG..."

# Check if argument looks like a UUID (contains hyphens)
if [[ "$SIMULATOR_ARG" == *"-"* ]]; then
  # It's a UUID
  mcp call get_sim_app_path \
    --params "{\"platform\":\"$PLATFORM\",\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\",\"simulatorId\":\"$SIMULATOR_ARG\"}" \
    npx -y xcodebuildmcp@latest
else
  # It's a name
  mcp call get_sim_app_path \
    --params "{\"platform\":\"$PLATFORM\",\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\",\"simulatorName\":\"$SIMULATOR_ARG\"}" \
    npx -y xcodebuildmcp@latest
fi
