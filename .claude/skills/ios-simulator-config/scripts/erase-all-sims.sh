#!/bin/bash
# Erases all simulators' content and settings

SHUTDOWN_FIRST="${1:-false}"

echo "Warning: This will erase ALL simulators"
echo "Press Ctrl+C to cancel, or Enter to continue..."
read

# Call MCP tool
if [ "$SHUTDOWN_FIRST" = "true" ]; then
  mcp call erase_sims \
    --params '{"all":true,"shutdownFirst":true}' \
    npx -y xcodebuildmcp@latest
else
  mcp call erase_sims \
    --params '{"all":true}' \
    npx -y xcodebuildmcp@latest
fi
