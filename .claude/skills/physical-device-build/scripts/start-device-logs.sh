#!/bin/bash
# Starts capturing logs from a physical device
# Returns a session ID that must be used to stop the capture
# Usage: bash start-device-logs.sh <device-uuid> <bundle-id>
#
# Examples:
#   bash start-device-logs.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX com.example.MyApp

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Device UUID required"
  echo "Usage: bash start-device-logs.sh <device-uuid> <bundle-id>"
  echo ""
  echo "Tip: Run 'bash list-devices.sh' to find connected device UUIDs"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Bundle ID required"
  echo "Usage: bash start-device-logs.sh <device-uuid> <bundle-id>"
  echo ""
  echo "Example: bash start-device-logs.sh UUID com.example.MyApp"
  exit 1
fi

DEVICE_ID="$1"
BUNDLE_ID="$2"

# Call MCP tool
mcp call start_device_log_cap \
  --params "{\"deviceId\":\"$DEVICE_ID\",\"bundleId\":\"$BUNDLE_ID\"}" \
  npx -y xcodebuildmcp@latest
