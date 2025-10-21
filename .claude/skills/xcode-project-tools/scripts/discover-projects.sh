#!/bin/bash
# Discovers Xcode projects and workspaces in a directory
#
# Usage: bash discover-projects.sh [workspace-root] [max-depth]
#
# Parameters:
#   workspace-root: Directory to search (default: current directory)
#   max-depth: Maximum depth to search (default: 5)
#
# Examples:
#   bash discover-projects.sh
#   bash discover-projects.sh /Users/Gauntlet/Projects
#   bash discover-projects.sh /Users/Gauntlet/Projects 3

# Get workspace root (default to current directory)
WORKSPACE_ROOT="${1:-$(pwd)}"

# Build params object
if [ -n "$2" ]; then
  # Include max depth if provided
  PARAMS="{\"workspaceRoot\":\"$WORKSPACE_ROOT\",\"maxDepth\":$2}"
else
  # Just workspace root
  PARAMS="{\"workspaceRoot\":\"$WORKSPACE_ROOT\"}"
fi

# Call MCP tool
mcp call discover_projs \
  --params "$PARAMS" \
  npx -y xcodebuildmcp@latest
