#!/bin/bash
# Stops an app running in an iOS simulator
# Works with either simulator UUID or name

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Both simulator UUID/name and bundle ID are required"
  echo "Usage: bash stop-app.sh <simulator-uuid-or-name> <bundle-id>"
  echo ""
  echo "Examples:"
  echo "  bash stop-app.sh 15614731-924F-489D-9CEA-232D041C4225 com.example.CreatorLink"
  echo "  bash stop-app.sh \"iPhone 16 Pro\" com.example.CreatorLink"
  exit 1
fi

SIMULATOR_ARG="$1"
BUNDLE_ID="$2"

echo "Stopping $BUNDLE_ID on $SIMULATOR_ARG..."

# Check if argument looks like a UUID (contains hyphens)
if [[ "$SIMULATOR_ARG" == *"-"* ]]; then
  # It's a UUID
  mcp call stop_app_sim \
    --params "{\"simulatorUuid\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
    npx -y xcodebuildmcp@latest
else
  # It's a name
  mcp call stop_app_sim \
    --params "{\"simulatorName\":\"$SIMULATOR_ARG\",\"bundleId\":\"$BUNDLE_ID\"}" \
    npx -y xcodebuildmcp@latest
fi
