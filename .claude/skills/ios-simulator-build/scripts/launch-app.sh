#!/bin/bash
# Launches an app in an iOS simulator by bundle ID
# The app must already be installed on the simulator

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Both simulator UUID/name and bundle ID are required"
  echo "Usage: bash launch-app.sh <simulator-uuid-or-name> <bundle-id> [args...]"
  echo ""
  echo "Examples:"
  echo "  bash launch-app.sh 15614731-924F-489D-9CEA-232D041C4225 com.example.CreatorLink"
  echo "  bash launch-app.sh \"iPhone 16 Pro\" com.example.CreatorLink"
  echo ""
  echo "Note: If simulator window isn't visible, run open-sim.sh first"
  exit 1
fi

SIMULATOR_ARG="$1"
BUNDLE_ID="$2"
shift 2
APP_ARGS="$@"

echo "Launching $BUNDLE_ID on $SIMULATOR_ARG..."

# Check if argument looks like a UUID (contains hyphens)
if [[ "$SIMULATOR_ARG" == *"-"* ]]; then
  # It's a UUID
  if [ -z "$APP_ARGS" ]; then
    mcp call launch_app_sim \
      --params "{\"simulatorUuid\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
      npx -y xcodebuildmcp@latest
  else
    # TODO: Handle app args array - for now just launch without args
    mcp call launch_app_sim \
      --params "{\"simulatorUuid\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
      npx -y xcodebuildmcp@latest
  fi
else
  # It's a name
  if [ -z "$APP_ARGS" ]; then
    mcp call launch_app_sim \
      --params "{\"simulatorName\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
      npx -y xcodebuildmcp@latest
  else
    # TODO: Handle app args array - for now just launch without args
    mcp call launch_app_sim \
      --params "{\"simulatorName\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
      npx -y xcodebuildmcp@latest
  fi
fi
