#!/bin/bash
# Run tests for a macOS project using xcodebuild test
# Parses xcresult output and returns test results

# Default configuration
PROJECT_PATH="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"
SCHEME="CreatorLink"

echo "Running macOS tests..."
echo "Project: $PROJECT_PATH"
echo "Scheme: $SCHEME"

# Call MCP tool
mcp call test_macos \
  --params "{\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\"}" \
  npx -y xcodebuildmcp@latest
