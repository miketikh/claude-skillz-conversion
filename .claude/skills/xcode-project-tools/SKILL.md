---
name: xcode-project-tools
description: Manage Xcode projects and workspaces. Discover projects, list schemes, view build settings, clean builds, scaffold new projects, and manage Swift Packages.
---

# Xcode Project Tools Skill

This skill provides project and workspace management utilities for Xcode development.

## Capabilities

- Discover Xcode projects and workspaces in directories
- List available schemes
- View and inspect build settings
- Clean build artifacts
- Extract bundle IDs from app bundles
- Scaffold new iOS and macOS projects
- Build and test Swift Packages
- Run Swift Package executables
- Clean Swift Package artifacts

## When to Use

Use this skill when the user asks to:
- Find Xcode projects in a directory
- List available schemes
- Show build settings
- Clean the build
- Clean derived data
- Create a new iOS or macOS project
- Get the bundle ID from an app
- Scaffold a project
- Work with Swift Packages
- Build or test a Swift Package
- Run a Swift Package executable

## Available Commands

### Discover Projects

Finds all .xcodeproj and .xcworkspace files.

**Usage:**
```bash
bash scripts/discover-projects.sh [path] [max-depth]
```

**Example:**
```bash
bash scripts/discover-projects.sh /Users/Gauntlet/Projects 3
```

### List Schemes

Lists all schemes in a project or workspace.

**Usage:**
```bash
bash scripts/list-schemes.sh <project-or-workspace-path>
```

### Show Build Settings

Displays build settings for a scheme.

**Usage:**
```bash
bash scripts/show-build-settings.sh <scheme> <project-or-workspace-path>
```

### Clean Build

Cleans build products and derived data.

**Usage:**
```bash
bash scripts/clean.sh [scheme] [project-or-workspace-path]
```

### Get Bundle ID

Extracts bundle identifier from an app bundle.

**Usage:**
```bash
bash scripts/get-bundle-id.sh <app-path>
```

**Example:**
```bash
bash scripts/get-bundle-id.sh /path/to/MyApp.app
```

### Scaffold iOS Project

Creates a new iOS project from templates.

**Usage:**
```bash
bash scripts/scaffold-ios.sh <project-name> <output-path> [bundle-id]
```

**Example:**
```bash
bash scripts/scaffold-ios.sh MyNewApp ~/Projects com.example.mynewapp
```

### Scaffold macOS Project

Creates a new macOS project from templates.

**Usage:**
```bash
bash scripts/scaffold-macos.sh <project-name> <output-path> [bundle-id]
```

### Swift Package Build

Builds a Swift Package.

**Usage:**
```bash
bash scripts/swift-package-build.sh <package-path> [configuration]
```

**Configurations:** debug (default), release

### Swift Package Test

Runs tests for a Swift Package.

**Usage:**
```bash
bash scripts/swift-package-test.sh <package-path> [filter]
```

### Swift Package Run

Runs an executable target from a Swift Package.

**Usage:**
```bash
bash scripts/swift-package-run.sh <package-path> [executable-name] [args...]
```

### Swift Package Clean

Cleans Swift Package build artifacts.

**Usage:**
```bash
bash scripts/swift-package-clean.sh <package-path>
```

## Typical Workflows

### Project Setup

1. Discover projects in a directory
2. List schemes to find the right target
3. View build settings to verify configuration

### Clean Build

1. Clean specific scheme or entire project
2. Rebuild from scratch

### New Project Creation

1. Scaffold iOS or macOS project with templates
2. Customize bundle ID and settings
3. Open in Xcode

### Swift Package Development

1. Build package with specific configuration
2. Run tests to verify
3. Run executable for testing
4. Clean when needed

## Notes

- Discover uses configurable max depth to avoid long searches
- Build settings output can be verbose
- Clean removes derived data and build products
- Bundle ID extraction works for all Apple platforms
- Scaffold creates modern project structure with SPM
- Swift Package commands support both libraries and executables
