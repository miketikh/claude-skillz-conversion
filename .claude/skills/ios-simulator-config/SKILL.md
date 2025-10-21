---
name: ios-simulator-config
description: Configure iOS simulator settings like appearance mode, GPS location, status bar, and manage simulator state (boot, erase, logs).
---

# iOS Simulator Configuration Skill

This skill provides simulator configuration and management capabilities.

## Capabilities

- Set appearance mode (dark/light)
- Configure GPS location (custom or reset)
- Customize status bar (network type, etc.)
- Erase simulator data
- Capture and manage simulator logs
- Reset simulator to default state

## When to Use

Use this skill when the user asks to:
- Set dark mode or light mode on simulator
- Change simulator appearance
- Set GPS location or coordinates
- Mock location data
- Change status bar network type
- Erase simulator data
- Reset simulator
- Capture app logs from simulator

## Available Commands

### Set Appearance

Sets dark or light mode.

**Usage:**
```bash
bash scripts/set-appearance.sh <simulator-uuid> <mode>
```

**Modes:** dark, light

### Set Location

Sets custom GPS coordinates.

**Usage:**
```bash
bash scripts/set-location.sh <simulator-uuid> <latitude> <longitude>
```

**Example:**
```bash
bash scripts/set-location.sh UUID 37.7749 -122.4194  # San Francisco
```

### Reset Location

Resets to default location.

**Usage:**
```bash
bash scripts/reset-location.sh <simulator-uuid>
```

### Set Status Bar

Configures status bar network indicator.

**Usage:**
```bash
bash scripts/set-statusbar.sh <simulator-uuid> <network-type>
```

**Network types:** clear, hide, wifi, 3g, 4g, lte, lte-a, lte+, 5g, 5g+, 5g-uwb, 5g-uc

### Erase Simulator

Erases all data and settings.

**Usage:**
```bash
bash scripts/erase-sim.sh <simulator-uuid>
bash scripts/erase-all-sims.sh  # Erase all simulators
```

### Capture Logs

Starts and stops log capture.

**Usage:**
```bash
bash scripts/start-logs.sh <simulator-uuid> <bundle-id>
# Returns session ID
bash scripts/stop-logs.sh <session-id>
```

## Typical Workflows

### Prepare Simulator for Testing

1. Set appearance mode (dark/light)
2. Configure location if needed
3. Set status bar for clean screenshots

### Reset Simulator State

1. Erase simulator data
2. Reconfigure settings as needed

### Debug with Logs

1. Start log capture before running app
2. Perform actions in app
3. Stop log capture and review logs

## Notes

- Appearance changes apply immediately
- Location persists until reset or changed
- Status bar changes are for cosmetic purposes (screenshots)
- Erasing is destructive - all data will be lost
- Log capture requires the app to be running
