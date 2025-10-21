#!/bin/bash
# Starts or stops video capture for an iOS simulator using AXe
# Provide exactly one of start or stop action
#
# Usage (start): bash record-video.sh <simulator-uuid> start [fps]
# Usage (stop):  bash record-video.sh <simulator-uuid> stop <output-file>
#
# Example (start): bash record-video.sh XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX start 30
# Example (stop):  bash record-video.sh UUID stop /path/to/output.mp4
#
# Parameters:
#   simulator-uuid: UUID from list-sims
#   action: Either "start" or "stop"
#   fps: (Optional for start) Frames per second (default 30, range 1-120)
#   output-file: (Required for stop) Destination MP4 path

# Validate required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing required parameters"
  echo "Usage (start): bash record-video.sh <simulator-uuid> start [fps]"
  echo "Usage (stop):  bash record-video.sh <simulator-uuid> stop <output-file>"
  exit 1
fi

SIMULATOR_UUID="$1"
ACTION="$2"

if [ "$ACTION" == "start" ]; then
  FPS="${3:-30}"

  # Call MCP tool to start recording
  mcp call record_sim_video \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"start\":true,\"fps\":$FPS}" \
    npx -y xcodebuildmcp@latest

elif [ "$ACTION" == "stop" ]; then
  if [ -z "$3" ]; then
    echo "Error: Output file path required when stopping"
    echo "Usage: bash record-video.sh <simulator-uuid> stop <output-file>"
    exit 1
  fi

  OUTPUT_FILE="$3"

  # Call MCP tool to stop recording
  mcp call record_sim_video \
    --params "{\"simulatorUuid\":\"$SIMULATOR_UUID\",\"stop\":true,\"outputFile\":\"$OUTPUT_FILE\"}" \
    npx -y xcodebuildmcp@latest

else
  echo "Error: Action must be either 'start' or 'stop'"
  echo "Usage (start): bash record-video.sh <simulator-uuid> start [fps]"
  echo "Usage (stop):  bash record-video.sh <simulator-uuid> stop <output-file>"
  exit 1
fi
