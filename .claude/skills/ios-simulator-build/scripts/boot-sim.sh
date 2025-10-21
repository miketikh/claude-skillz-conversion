#!/bin/bash
# Boots an iOS simulator by UUID
# After booting, use open-sim.sh to make the simulator visible

if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash boot-sim.sh <simulator-uuid>"
  echo ""
  echo "Example:"
  echo "  bash boot-sim.sh 15614731-924F-489D-9CEA-232D041C4225"
  exit 1
fi

SIMULATOR_UUID="$1"

echo "Booting simulator $SIMULATOR_UUID..."

mcp call boot_sim \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\"}" \
  npx -y xcodebuildmcp@latest
