#!/bin/bash
# Extracts the bundle identifier from an app bundle (.app)
# Works for any Apple platform (iOS, macOS, watchOS, tvOS, visionOS)
#
# Usage: bash get-bundle-id.sh <app-path>
#
# Parameters:
#   app-path: Full path to the .app bundle
#
# Examples:
#   bash get-bundle-id.sh /path/to/MyApp.app
#   bash get-bundle-id.sh ~/Library/Developer/Xcode/DerivedData/.../MyApp.app

# Validate required parameter
if [ -z "$1" ]; then
  echo "Error: App path required"
  echo "Usage: bash get-bundle-id.sh <app-path>"
  exit 1
fi

APP_PATH="$1"

# Verify path ends with .app
if [[ "$APP_PATH" != *.app ]]; then
  echo "Error: Path must end with .app"
  exit 1
fi

# Call MCP tool
mcp call get_app_bundle_id \
  --params "{\"appPath\":\"$APP_PATH\"}" \
  npx -y xcodebuildmcp@latest
