#!/bin/bash
# Launches an app on a physical Apple device
# Usage: bash launch-device.sh <device-uuid> <bundle-id>
#
# Examples:
#   bash launch-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX com.example.MyApp

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Device UUID required"
  echo "Usage: bash launch-device.sh <device-uuid> <bundle-id>"
  echo ""
  echo "Tip: Run 'bash list-devices.sh' to find connected device UUIDs"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Bundle ID required"
  echo "Usage: bash launch-device.sh <device-uuid> <bundle-id>"
  echo ""
  echo "Example: bash launch-device.sh UUID com.example.MyApp"
  exit 1
fi

DEVICE_ID="$1"
BUNDLE_ID="$2"

# Call MCP tool
mcp call launch_app_device \
  --params "{\"deviceId\":\"$DEVICE_ID\",\"bundleId\":\"$BUNDLE_ID\"}" \
  npx -y xcodebuildmcp@latest
