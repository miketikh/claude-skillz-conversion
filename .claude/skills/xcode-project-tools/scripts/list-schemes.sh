#!/bin/bash
# Lists available schemes for an Xcode project or workspace
#
# Usage: bash list-schemes.sh <project-or-workspace-path>
#
# Parameters:
#   project-or-workspace-path: Path to .xcodeproj or .xcworkspace file
#
# Examples:
#   bash list-schemes.sh /path/to/MyProject.xcodeproj
#   bash list-schemes.sh /path/to/MyProject.xcworkspace

# Validate required parameter
if [ -z "$1" ]; then
  echo "Error: Project or workspace path required"
  echo "Usage: bash list-schemes.sh <project-or-workspace-path>"
  exit 1
fi

PROJECT_PATH="$1"

# Determine if it's a project or workspace based on extension
if [[ "$PROJECT_PATH" == *.xcworkspace ]]; then
  PARAMS="{\"workspacePath\":\"$PROJECT_PATH\"}"
elif [[ "$PROJECT_PATH" == *.xcodeproj ]]; then
  PARAMS="{\"projectPath\":\"$PROJECT_PATH\"}"
else
  echo "Error: Path must end with .xcodeproj or .xcworkspace"
  exit 1
fi

# Call MCP tool
mcp call list_schemes \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
