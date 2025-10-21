#!/bin/bash
# Provides comprehensive information about the MCP server environment,
# available dependencies, and configuration status
#
# Usage: bash doctor.sh
#
# Example:
#   bash doctor.sh

# Call MCP tool (no parameters required)
mcp call doctor \
  --params '{}' \
  npx -y xcodebuildmcp@latest
