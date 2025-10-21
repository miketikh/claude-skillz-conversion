#!/bin/bash
# Opens the iOS Simulator app
# Use this after booting a simulator to make it visible

echo "Opening iOS Simulator app..."

mcp call open_sim \
  --params '{}' \
  npx -y xcodebuildmcp@latest
