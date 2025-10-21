#!/bin/bash
# Runs tests on a physical device using xcodebuild test
# Usage: bash test-device.sh <device-uuid> [scheme] [project-path] [configuration]
#
# Examples:
#   bash test-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
#   bash test-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX MyScheme
#   bash test-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX MyScheme /path/to/project.xcodeproj Debug

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Device UUID required"
  echo "Usage: bash test-device.sh <device-uuid> [scheme] [project-path] [configuration]"
  echo ""
  echo "Tip: Run 'bash list-devices.sh' to find connected device UUIDs"
  exit 1
fi

# Default values
DEFAULT_SCHEME="CreatorLink"
DEFAULT_PROJECT="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"

# Parse parameters
DEVICE_ID="$1"
SCHEME="${2:-$DEFAULT_SCHEME}"
PROJECT_PATH="${3:-$DEFAULT_PROJECT}"
CONFIGURATION="${4:-}"

# Build JSON params
PARAMS="{\"deviceId\":\"$DEVICE_ID\",\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\""

if [ -n "$CONFIGURATION" ]; then
  PARAMS="$PARAMS,\"configuration\":\"$CONFIGURATION\""
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call test_device \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
