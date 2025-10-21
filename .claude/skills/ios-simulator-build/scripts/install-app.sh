#!/bin/bash
# Installs an app in an iOS simulator
# Use this to install a pre-built .app bundle

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Both simulator UUID and app path are required"
  echo "Usage: bash install-app.sh <simulator-uuid> <app-path>"
  echo ""
  echo "Example:"
  echo "  bash install-app.sh 15614731-924F-489D-9CEA-232D041C4225 /path/to/CreatorLink.app"
  exit 1
fi

SIMULATOR_UUID="$1"
APP_PATH="$2"

# Validate app path exists
if [ ! -d "$APP_PATH" ]; then
  echo "Error: App bundle not found at $APP_PATH"
  exit 1
fi

echo "Installing $APP_PATH to simulator $SIMULATOR_UUID..."

mcp call install_app_sim \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"appPath\":\"$APP_PATH\"}" \
  npx -y xcodebuildmcp@latest
