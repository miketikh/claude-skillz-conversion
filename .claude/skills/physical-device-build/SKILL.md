---
name: physical-device-build
description: Build, install, run, and test iOS apps on physical Apple devices (iPhone, iPad, Apple Watch, Apple TV, Vision Pro).
---

# Physical Device Build Skill

This skill provides complete build and deployment workflows for physical Apple devices.

## Capabilities

- List connected physical devices
- Build apps for physical devices
- Install apps on connected devices
- Launch apps on devices
- Stop running apps on devices
- Run tests on physical devices
- Capture device logs
- Get app bundle paths and bundle IDs

## When to Use

Use this skill when the user asks to:
- Build for my iPhone/iPad/device
- Deploy to my phone
- Run on a real device
- Install on connected device
- Test on physical hardware
- Run on my Apple Watch
- Deploy to Apple TV
- Check connected devices
- Launch the app on my device

## Project Configuration

- Project Path: /Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj
- Scheme: CreatorLink
- Default Platform: iOS

## Available Commands

### List Devices

Lists all connected physical devices with UUIDs.

**Usage:**
```bash
bash scripts/list-devices.sh
```

**Output:** Device names, UUIDs, platform, and connection status

### Build for Device

Builds the app for a physical device.

**Usage:**
```bash
bash scripts/build-device.sh
```

**Note:** Uses project defaults (CreatorLink scheme)

### Install on Device

Installs a pre-built app on a device.

**Usage:**
```bash
bash scripts/install-device.sh <device-uuid> <app-path>
```

### Launch App on Device

Launches an app using its bundle ID.

**Usage:**
```bash
bash scripts/launch-device.sh <device-uuid> <bundle-id>
```

### Stop App on Device

Stops a running app.

**Usage:**
```bash
bash scripts/stop-device.sh <device-uuid> <process-id>
```

### Test on Device

Runs tests on a connected device.

**Usage:**
```bash
bash scripts/test-device.sh <device-uuid>
```

### Capture Device Logs

Starts and stops log capture.

**Usage:**
```bash
bash scripts/start-device-logs.sh <device-uuid> <bundle-id>
# Returns session ID
bash scripts/stop-device-logs.sh <session-id>
```

## Typical Workflows

### Deploy to Connected Device

1. List devices to find connected device UUID
2. Build for device
3. Install app on device
4. Launch app
5. Capture logs if needed for debugging

### Run Tests on Device

1. List devices to find device UUID
2. Run tests on specific device
3. Review test results

### Debug on Device

1. Start log capture
2. Launch app
3. Reproduce issue
4. Stop log capture and review logs

## Notes

- Device must be connected via USB or network
- Code signing must be properly configured
- First install may require device trust authorization
- Physical device builds require valid provisioning profiles
- Log capture shows console output from the app
