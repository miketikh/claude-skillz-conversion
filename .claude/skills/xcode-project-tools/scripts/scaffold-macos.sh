#!/bin/bash
# Scaffolds a new macOS project from templates
# Creates a modern Xcode project with workspace structure and SPM package
#
# Usage: bash scaffold-macos.sh <project-name> <output-path> [bundle-id] [display-name]
#
# Parameters:
#   project-name: Name of the new project (required)
#   output-path: Path where the project should be created (required)
#   bundle-id: Bundle identifier (optional, defaults to com.example.projectname)
#   display-name: App display name (optional, defaults to project-name)
#
# Examples:
#   bash scaffold-macos.sh MyApp ~/Projects
#   bash scaffold-macos.sh MyApp ~/Projects com.example.myapp
#   bash scaffold-macos.sh MyApp ~/Projects com.example.myapp "My App"

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Project name required"
  echo "Usage: bash scaffold-macos.sh <project-name> <output-path> [bundle-id] [display-name]"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Output path required"
  echo "Usage: bash scaffold-macos.sh <project-name> <output-path> [bundle-id] [display-name]"
  exit 1
fi

PROJECT_NAME="$1"
OUTPUT_PATH="$2"
BUNDLE_ID="$3"
DISPLAY_NAME="$4"

# Build params object
PARAMS="{\"projectName\":\"$PROJECT_NAME\",\"outputPath\":\"$OUTPUT_PATH\""

# Add optional bundle ID if provided
if [ -n "$BUNDLE_ID" ]; then
  PARAMS="$PARAMS,\"bundleIdentifier\":\"$BUNDLE_ID\""
fi

# Add optional display name if provided
if [ -n "$DISPLAY_NAME" ]; then
  PARAMS="$PARAMS,\"displayName\":\"$DISPLAY_NAME\""
fi

PARAMS="$PARAMS}"

# Call MCP tool
mcp call scaffold_macos_project \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
