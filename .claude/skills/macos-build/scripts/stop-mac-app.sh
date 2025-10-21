#!/bin/bash
# Stop a running macOS application
# Can stop by app name or process ID

# Validate required parameter
if [ -z "$1" ]; then
  echo "Error: App name or process ID required"
  echo "Usage: bash stop-mac-app.sh <app-name-or-pid>"
  echo "  app-name: Name of the app (e.g., 'CreatorLink' or 'MyApp')"
  echo "  pid: Process ID as a number (e.g., 12345)"
  exit 1
fi

INPUT="$1"

# Check if input is a number (PID) or string (app name)
if [[ "$INPUT" =~ ^[0-9]+$ ]]; then
  # It's a PID
  echo "Stopping macOS app by process ID..."
  echo "Process ID: $INPUT"

  mcp call stop_mac_app \
    --params "{\"processId\":$INPUT}" \
    npx -y xcodebuildmcp@latest
else
  # It's an app name
  echo "Stopping macOS app by name..."
  echo "App Name: $INPUT"

  mcp call stop_mac_app \
    --params "{\"appName\":\"$INPUT\"}" \
    npx -y xcodebuildmcp@latest
fi
