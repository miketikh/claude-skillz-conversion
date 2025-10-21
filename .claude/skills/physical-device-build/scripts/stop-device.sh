#!/bin/bash
# Stops an app running on a physical Apple device
# Usage: bash stop-device.sh <device-uuid> <process-id>
#
# Examples:
#   bash stop-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX 12345

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Device UUID required"
  echo "Usage: bash stop-device.sh <device-uuid> <process-id>"
  echo ""
  echo "Tip: Run 'bash list-devices.sh' to find connected device UUIDs"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Process ID required"
  echo "Usage: bash stop-device.sh <device-uuid> <process-id>"
  echo ""
  echo "Example: bash stop-device.sh UUID 12345"
  exit 1
fi

DEVICE_ID="$1"
PROCESS_ID="$2"

# Call MCP tool
mcp call stop_app_device \
  --params "{\"deviceId\":\"$DEVICE_ID\",\"processId\":$PROCESS_ID}" \
  npx -y xcodebuildmcp@latest
