#!/bin/bash
# Builds an app for a physical Apple device
# Usage: bash build-device.sh [scheme] [project-path] [configuration]
#
# Examples:
#   bash build-device.sh
#   bash build-device.sh MyScheme
#   bash build-device.sh MyScheme /path/to/project.xcodeproj Debug

# Default values
DEFAULT_SCHEME="CreatorLink"
DEFAULT_PROJECT="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"

# Parse parameters
SCHEME="${1:-$DEFAULT_SCHEME}"
PROJECT_PATH="${2:-$DEFAULT_PROJECT}"
CONFIGURATION="${3:-}"

# Build JSON params
PARAMS="{\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\""

if [ -n "$CONFIGURATION" ]; then
  PARAMS="$PARAMS,\"configuration\":\"$CONFIGURATION\""
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call build_device \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
