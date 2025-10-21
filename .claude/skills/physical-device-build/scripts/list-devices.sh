#!/bin/bash
# Lists all connected physical Apple devices with UUIDs, names, and connection status

# Call MCP tool to list devices
mcp call list_devices \
  --params '{}' \
  npx -y xcodebuildmcp@latest
