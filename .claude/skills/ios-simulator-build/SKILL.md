---
name: ios-simulator-build
description: Build, install, and run iOS apps on simulators. List available simulators and deploy the CreatorLink project to running simulators.
---

# iOS Simulator Build Skill

This skill provides complete iOS simulator build and deployment workflows.

## Capabilities

- List available iOS simulators with boot status
- Build iOS apps for specific simulators
- Build and run apps on simulators (complete deployment)
- Install pre-built apps to simulators
- Launch apps on simulators
- Get app bundle paths and bundle IDs
- Verify build success and report errors

## When to Use

Use this skill when the user asks to:
- Build the iOS app for simulator
- Run the app on simulator
- Deploy to simulator(s)
- Build and run on multiple simulators
- Install the app on a simulator
- Launch an app on simulator
- Check which simulators are available
- Find booted simulators

## Project Configuration

- Project Path: /Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj
- Scheme: CreatorLink

## Available Commands

### List Simulators

Lists all available iOS simulators with their UUIDs and status.

**Usage:**
```bash
bash scripts/list-sims.sh
```

**Output:** Shows simulator names, UUIDs, and boot status (Booted/Shutdown)

### Boot Simulator

Boots an iOS simulator. After booting, use open-sim.sh to make the simulator visible.

**Usage:**
```bash
bash scripts/boot-sim.sh <simulator-uuid>
```

**Parameters:**
- `simulator-uuid`: UUID of the simulator to boot (get from list-sims.sh)

### Open Simulator

Opens the iOS Simulator app to make it visible.

**Usage:**
```bash
bash scripts/open-sim.sh
```

**No parameters required.**

### Build for Simulator (Build Only)

Builds the CreatorLink iOS app for a specified simulator without launching.

**Usage:**
```bash
bash scripts/build-sim.sh <simulator-id>
```

**Parameters:**
- `simulator-id`: UUID of the target simulator (get from list-sims.sh)

### Build and Run (Deploy + Launch)

Builds AND runs the app on a simulator. This is what you want for deploying updates to running simulators.

**Usage:**
```bash
bash scripts/build-and-run.sh <simulator-id>
```

**Parameters:**
- `simulator-id`: UUID of the target simulator

**Example:**
```bash
# First, list simulators to find booted ones
bash scripts/list-sims.sh

# Then build and run on a specific simulator
bash scripts/build-and-run.sh 15614731-924F-489D-9CEA-232D041C4225
```

### Get Simulator App Path

Gets the app bundle path for a simulator application.

**Usage:**
```bash
bash scripts/get-sim-app-path.sh <scheme> <platform> <simulator-id>
```

**Parameters:**
- `scheme`: The scheme to use (e.g., "CreatorLink")
- `platform`: Target platform (e.g., "iOS Simulator")
- `simulator-id`: UUID of the simulator

### Install App on Simulator

Installs an app bundle on an iOS simulator.

**Usage:**
```bash
bash scripts/install-app.sh <simulator-uuid> <app-path>
```

**Parameters:**
- `simulator-uuid`: UUID of the target simulator
- `app-path`: Full path to the .app bundle

### Launch App on Simulator

Launches an installed app on a simulator.

**Usage:**
```bash
bash scripts/launch-app.sh <bundle-id> [simulator-uuid]
```

**Parameters:**
- `bundle-id`: Bundle identifier of the app (e.g., "com.example.CreatorLink")
- `simulator-uuid`: (Optional) UUID of the simulator

### Launch App with Logs

Launches an app on a simulator and captures its logs.

**Usage:**
```bash
bash scripts/launch-app-logs.sh <bundle-id> <simulator-uuid>
```

**Parameters:**
- `bundle-id`: Bundle identifier of the app
- `simulator-uuid`: UUID of the simulator

### Stop App on Simulator

Stops a running app on a simulator.

**Usage:**
```bash
bash scripts/stop-app.sh <bundle-id> [simulator-uuid]
```

**Parameters:**
- `bundle-id`: Bundle identifier of the app to stop
- `simulator-uuid`: (Optional) UUID of the simulator

## Typical Workflows

### For Deploying to Running Simulators

When user says "build and run on all running simulators" or "deploy to both simulators":

1. Run `list-sims.sh` to find booted simulators
2. For EACH booted simulator, run `build-and-run.sh <uuid>` **in parallel using agents**
3. Report success/failure for each

**Important:** Use multiple agents to run `build-and-run.sh` concurrently for multiple simulators.

### For Build Only (No Launch)

1. Run `list-sims.sh` to find available simulators
2. Run `build-sim.sh <uuid>` with selected simulator
3. Report build success or errors

## Notes

- Always list simulators first to get current UUIDs
- Prefer using already-booted simulators
- The scripts use xcodebuildmcp CLI directly
- Build output will show compilation progress
- Errors will be clearly reported
