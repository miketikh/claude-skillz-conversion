#!/bin/bash
# Installs an app on a physical Apple device
# Usage: bash install-device.sh <device-uuid> <app-path>
#
# Examples:
#   bash install-device.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX /path/to/app.app

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Device UUID required"
  echo "Usage: bash install-device.sh <device-uuid> <app-path>"
  echo ""
  echo "Tip: Run 'bash list-devices.sh' to find connected device UUIDs"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: App path required"
  echo "Usage: bash install-device.sh <device-uuid> <app-path>"
  echo ""
  echo "Tip: Run 'bash get-device-app-path.sh' to get the app bundle path"
  exit 1
fi

DEVICE_ID="$1"
APP_PATH="$2"

# Call MCP tool
mcp call install_app_device \
  --params "{\"deviceId\":\"$DEVICE_ID\",\"appPath\":\"$APP_PATH\"}" \
  npx -y xcodebuildmcp@latest
