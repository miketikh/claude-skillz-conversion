#!/bin/bash
# Cleans build products for an Xcode project or workspace
#
# Usage: bash clean.sh [scheme] [project-or-workspace-path] [platform]
#
# Parameters:
#   scheme: (Optional) Name of the scheme to clean
#   project-or-workspace-path: (Optional) Path to .xcodeproj or .xcworkspace
#   platform: (Optional) Platform to clean (defaults to iOS)
#             Valid: macOS, iOS, iOS Simulator, watchOS, tvOS, visionOS, etc.
#
# Examples:
#   bash clean.sh
#   bash clean.sh MyScheme
#   bash clean.sh MyScheme /path/to/MyProject.xcodeproj
#   bash clean.sh MyScheme /path/to/MyProject.xcodeproj "iOS Simulator"

SCHEME="$1"
PROJECT_PATH="$2"
PLATFORM="${3:-iOS}"

# Start building params
PARAMS="{"

# Add platform
PARAMS="$PARAMS\"platform\":\"$PLATFORM\""

# Add scheme if provided
if [ -n "$SCHEME" ]; then
  PARAMS="$PARAMS,\"scheme\":\"$SCHEME\""
fi

# Add project or workspace path if provided
if [ -n "$PROJECT_PATH" ]; then
  if [[ "$PROJECT_PATH" == *.xcworkspace ]]; then
    PARAMS="$PARAMS,\"workspacePath\":\"$PROJECT_PATH\""
  elif [[ "$PROJECT_PATH" == *.xcodeproj ]]; then
    PARAMS="$PARAMS,\"projectPath\":\"$PROJECT_PATH\""
  else
    echo "Error: Path must end with .xcodeproj or .xcworkspace"
    exit 1
  fi
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call clean \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
