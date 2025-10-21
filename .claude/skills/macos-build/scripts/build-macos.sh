#!/bin/bash
# Build macOS app using xcodebuild
# Supports arm64 (Apple Silicon) and x86_64 (Intel) architectures

# Default configuration
PROJECT_PATH="/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj"
SCHEME="CreatorLink"
ARCH="${1:-arm64}"  # Default to arm64 (Apple Silicon)

# Validate architecture
if [[ "$ARCH" != "arm64" && "$ARCH" != "x86_64" ]]; then
  echo "Error: Invalid architecture. Use 'arm64' or 'x86_64'"
  echo "Usage: bash build-macos.sh [architecture]"
  echo "  architecture: arm64 (default) or x86_64"
  exit 1
fi

echo "Building macOS app..."
echo "Architecture: $ARCH"
echo "Project: $PROJECT_PATH"
echo "Scheme: $SCHEME"

# Call MCP tool
mcp call build_macos \
  --params "{\"scheme\":\"$SCHEME\",\"projectPath\":\"$PROJECT_PATH\",\"arch\":\"$ARCH\"}" \
  npx -y xcodebuildmcp@latest
