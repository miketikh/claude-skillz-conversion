#!/bin/bash
# Extract bundle identifier from a macOS app bundle
# Reads the Info.plist file to get CFBundleIdentifier

# Validate required parameter
if [ -z "$1" ]; then
  echo "Error: App path required"
  echo "Usage: bash get-bundle-id.sh <app-path>"
  echo "  app-path: Full path to the .app bundle (e.g., /path/to/MyApp.app)"
  exit 1
fi

APP_PATH="$1"

# Check if app path exists
if [ ! -d "$APP_PATH" ]; then
  echo "Error: App bundle not found at: $APP_PATH"
  exit 1
fi

echo "Getting bundle ID from macOS app..."
echo "App Path: $APP_PATH"

# Call MCP tool
mcp call get_mac_bundle_id \
  --params "{\"appPath\":\"$APP_PATH\"}" \
  npx -y xcodebuildmcp@latest
