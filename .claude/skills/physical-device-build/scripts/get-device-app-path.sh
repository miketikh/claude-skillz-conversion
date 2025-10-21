#!/bin/bash
# Gets the app bundle path for a physical device application
# Usage: bash get-device-app-path.sh [scheme] [project-path] [configuration] [platform]
#
# Examples:
#   bash get-device-app-path.sh
#   bash get-device-app-path.sh MyScheme
#   bash get-device-app-path.sh MyScheme /path/to/project.xcodeproj Debug iOS

# Default values
DEFAULT_SCHEME="CreatorLink"
DEFAULT_PROJECT="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"

# Parse parameters
SCHEME="${1:-$DEFAULT_SCHEME}"
PROJECT_PATH="${2:-$DEFAULT_PROJECT}"
CONFIGURATION="${3:-}"
PLATFORM="${4:-}"

# Build JSON params
PARAMS="{\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\""

if [ -n "$CONFIGURATION" ]; then
  PARAMS="$PARAMS,\"configuration\":\"$CONFIGURATION\""
fi

if [ -n "$PLATFORM" ]; then
  PARAMS="$PARAMS,\"platform\":\"$PLATFORM\""
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call get_device_app_path \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
