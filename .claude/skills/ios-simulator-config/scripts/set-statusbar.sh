#!/bin/bash
# Sets the data network indicator in the iOS simulator status bar

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator UUID required"
  echo "Usage: bash set-statusbar.sh <simulator-uuid> <network-type>"
  echo "Valid network types: clear, hide, wifi, 3g, 4g, lte, lte-a, lte+, 5g, 5g+, 5g-uwb, 5g-uc"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Error: Network type required"
  echo "Usage: bash set-statusbar.sh <simulator-uuid> <network-type>"
  echo "Valid network types: clear, hide, wifi, 3g, 4g, lte, lte-a, lte+, 5g, 5g+, 5g-uwb, 5g-uc"
  exit 1
fi

SIMULATOR_UUID="$1"
DATA_NETWORK="$2"

# Validate network type
VALID_TYPES=("clear" "hide" "wifi" "3g" "4g" "lte" "lte-a" "lte+" "5g" "5g+" "5g-uwb" "5g-uc")
if [[ ! " ${VALID_TYPES[@]} " =~ " ${DATA_NETWORK} " ]]; then
  echo "Error: Invalid network type '$DATA_NETWORK'"
  echo "Valid network types: clear, hide, wifi, 3g, 4g, lte, lte-a, lte+, 5g, 5g+, 5g-uwb, 5g-uc"
  exit 1
fi

# Call MCP tool
mcp call sim_statusbar \
  --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"dataNetwork\":\"$DATA_NETWORK\"}" \
  npx -y xcodebuildmcp@latest
