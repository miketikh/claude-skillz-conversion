#!/bin/bash
# Launch a macOS application
# Requires the full path to the .app bundle

# Validate required parameter
if [ -z "$1" ]; then
  echo "Error: App path required"
  echo "Usage: bash launch-mac-app.sh <app-path>"
  echo "  app-path: Full path to the .app bundle (e.g., /path/to/MyApp.app)"
  exit 1
fi

APP_PATH="$1"

# Check if app path exists
if [ ! -d "$APP_PATH" ]; then
  echo "Error: App bundle not found at: $APP_PATH"
  exit 1
fi

echo "Launching macOS app..."
echo "App Path: $APP_PATH"

# Call MCP tool
mcp call launch_mac_app \
  --params "{\"appPath\":\"$APP_PATH\"}" \
  npx -y xcodebuildmcp@latest
