---
name: macos-build
description: Build, run, and test macOS applications. Build for Apple Silicon or Intel, launch apps, and execute test suites.
---

# macOS Build Skill

This skill provides complete macOS app build, run, and testing workflows.

## Capabilities

- Build macOS apps (arm64 or x86_64)
- Build and run macOS apps in one step
- Launch macOS applications
- Stop running macOS apps
- Run tests on macOS
- Get app bundle paths and bundle IDs
- Configure architecture-specific builds

## When to Use

Use this skill when the user asks to:
- Build the macOS app
- Build for Mac
- Run the Mac app
- Build for Apple Silicon or Intel
- Test on macOS
- Launch a macOS application
- Stop a Mac app
- Build universal binary

## Project Configuration

- Project Path: /Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj
- Scheme: CreatorLink
- Default Architecture: arm64 (Apple Silicon)

## Available Commands

### Build for macOS

Builds a macOS app.

**Usage:**
```bash
bash scripts/build-macos.sh [architecture]
```

**Architectures:** arm64 (default), x86_64

**Example:**
```bash
bash scripts/build-macos.sh           # arm64
bash scripts/build-macos.sh x86_64    # Intel
```

### Build and Run

Builds and launches the macOS app.

**Usage:**
```bash
bash scripts/build-run-macos.sh [architecture]
```

### Launch App

Launches a macOS app bundle.

**Usage:**
```bash
bash scripts/launch-mac-app.sh <app-path>
```

### Stop App

Stops a running macOS app.

**Usage:**
```bash
bash scripts/stop-mac-app.sh <app-name>
# or
bash scripts/stop-mac-app.sh <process-id>
```

### Test macOS

Runs the test suite on macOS.

**Usage:**
```bash
bash scripts/test-macos.sh
```

### Get App Path

Gets the app bundle path for a built macOS app.

**Usage:**
```bash
bash scripts/get-mac-app-path.sh [architecture]
```

**Architectures:** arm64 (default), x86_64

**Example:**
```bash
bash scripts/get-mac-app-path.sh           # arm64
bash scripts/get-mac-app-path.sh x86_64    # Intel
```

### Get Bundle ID

Extracts bundle ID from a macOS app.

**Usage:**
```bash
bash scripts/get-bundle-id.sh <app-path>
```

## Typical Workflows

### Quick Build and Run

1. Build and run in one command
2. App launches automatically
3. Monitor console output

### Architecture-Specific Build

1. Build for specific architecture (arm64 or x86_64)
2. Test on corresponding hardware
3. Verify compatibility

### Test Suite Execution

1. Run macOS tests
2. Review results
3. Check coverage if needed

### Stop Running App

1. Find app by name or get process ID
2. Stop app cleanly

## Notes

- Default architecture is arm64 (Apple Silicon)
- x86_64 builds run via Rosetta on Apple Silicon
- App must be code signed to run
- Tests run on the local Mac
- Launch automatically opens the app
- Stop app works by name or PID
