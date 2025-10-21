#!/bin/bash
# Shows build settings for a scheme in an Xcode project or workspace
#
# Usage: bash show-build-settings.sh <scheme> <project-or-workspace-path>
#
# Parameters:
#   scheme: Name of the scheme
#   project-or-workspace-path: Path to .xcodeproj or .xcworkspace file
#
# Examples:
#   bash show-build-settings.sh MyScheme /path/to/MyProject.xcodeproj
#   bash show-build-settings.sh MyScheme /path/to/MyProject.xcworkspace

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Scheme name required"
  echo "Usage: bash show-build-settings.sh <scheme> <project-or-workspace-path>"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Project or workspace path required"
  echo "Usage: bash show-build-settings.sh <scheme> <project-or-workspace-path>"
  exit 1
fi

SCHEME="$1"
PROJECT_PATH="$2"

# Determine if it's a project or workspace based on extension
if [[ "$PROJECT_PATH" == *.xcworkspace ]]; then
  PARAMS="{\"scheme\":\"$SCHEME\",\"workspacePath\":\"$PROJECT_PATH\"}"
elif [[ "$PROJECT_PATH" == *.xcodeproj ]]; then
  PARAMS="{\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\"}"
else
  echo "Error: Path must end with .xcodeproj or .xcworkspace"
  exit 1
fi

# Call MCP tool
mcp call show_build_settings \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
