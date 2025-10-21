#!/bin/bash
# Launches an app in an iOS simulator and captures its logs
# Returns log output to console

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Both simulator UUID and bundle ID are required"
  echo "Usage: bash launch-app-logs.sh <simulator-uuid> <bundle-id> [args...]"
  echo ""
  echo "Example:"
  echo "  bash launch-app-logs.sh 15614731-924F-489D-9CEA-232D041C4225 com.example.CreatorLink"
  exit 1
fi

SIMULATOR_UUID="$1"
BUNDLE_ID="$2"
shift 2
APP_ARGS="$@"

echo "Launching $BUNDLE_ID on simulator $SIMULATOR_UUID with log capture..."

if [ -z "$APP_ARGS" ]; then
  mcp call launch_app_logs_sim \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"bundleId\":\"$BUNDLE_ID\"}" \
    npx -y xcodebuildmcp@latest
else
  # TODO: Handle app args array - for now just launch without args
  mcp call launch_app_logs_sim \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"bundleId\":\"$BUNDLE_ID\"}" \
    npx -y xcodebuildmcp@latest
fi
