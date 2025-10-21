#!/bin/bash
# Run tests on an iOS simulator using xcodebuild test
# Supports both simulator UUID and simulator name

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Simulator ID or name required"
  echo ""
  echo "Usage: bash test-sim.sh <simulator-id-or-name> [configuration] [project-or-workspace-path]"
  echo ""
  echo "Examples:"
  echo "  # Test with simulator name"
  echo "  bash test-sim.sh \"iPhone 16 Pro\""
  echo ""
  echo "  # Test with simulator UUID"
  echo "  bash test-sim.sh 15614731-924F-489D-9CEA-232D041C4225"
  echo ""
  echo "  # Test with custom configuration"
  echo "  bash test-sim.sh \"iPhone 16 Pro\" Debug"
  echo ""
  echo "  # Test with custom project path"
  echo "  bash test-sim.sh \"iPhone 16 Pro\" Debug /path/to/project.xcodeproj"
  exit 1
fi

# Parameters
SIMULATOR="$1"
CONFIGURATION="${2:-Debug}"
PROJECT_PATH="${3:-/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj}"
SCHEME="${SCHEME:-CreatorLink}"

# Detect if simulator is UUID or name
# UUID format: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX (8-4-4-4-12 hex digits)
if [[ "$SIMULATOR" =~ ^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$ ]]; then
  # It's a UUID
  echo "Running tests on simulator with UUID: $SIMULATOR"
  echo "Scheme: $SCHEME"
  echo "Configuration: $CONFIGURATION"
  echo "Project: $PROJECT_PATH"
  echo ""

  mcp call test_sim \
    --params "{\"scheme\":\"$SCHEME\",\"simulatorId\":\"$SIMULATOR\",\"configuration\":\"$CONFIGURATION\",\"projectPath\":\"$PROJECT_PATH\"}" \
    npx -y xcodebuildmcp@latest
else
  # It's a name
  echo "Running tests on simulator: $SIMULATOR"
  echo "Scheme: $SCHEME"
  echo "Configuration: $CONFIGURATION"
  echo "Project: $PROJECT_PATH"
  echo ""

  mcp call test_sim \
    --params "{\"scheme\":\"$SCHEME\",\"simulatorName\":\"$SIMULATOR\",\"configuration\":\"$CONFIGURATION\",\"projectPath\":\"$PROJECT_PATH\"}" \
    npx -y xcodebuildmcp@latest
fi

# Check exit status
if [ $? -eq 0 ]; then
  echo ""
  echo "✅ Tests completed successfully"
else
  echo ""
  echo "❌ Tests failed"
  exit 1
fi
