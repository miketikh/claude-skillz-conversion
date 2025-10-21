---
name: ios-simulator-testing
description: Run automated tests for iOS apps on simulators. Execute unit tests, UI tests, and view test results with code coverage.
---

# iOS Simulator Testing Skill

This skill provides comprehensive testing capabilities for iOS apps on simulators.

## Capabilities

- Run all tests on a specific simulator
- Run filtered tests (by name/pattern)
- Execute tests with code coverage
- View test results and failure details
- Run tests in parallel or sequentially
- Configure test environment variables

## When to Use

Use this skill when the user asks to:
- Run tests on simulator
- Execute unit tests
- Run UI tests
- Test the app on iPhone/iPad simulator
- Check test results
- Run tests with coverage
- Debug failing tests

## Project Configuration

- Project Path: /Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj
- Scheme: CreatorLink
- Preferred Simulator: iPhone 16 Pro

## Available Commands

### Run Tests on Simulator

Runs the test suite on a specific simulator.

**Usage:**
```bash
bash scripts/test-sim.sh <simulator-id-or-name>
```

**Parameters:**
- `simulator-id-or-name`: UUID or name (e.g., "iPhone 16 Pro")

**Example:**
```bash
# By name
bash scripts/test-sim.sh "iPhone 16 Pro"

# By UUID
bash scripts/test-sim.sh 15614731-924F-489D-9CEA-232D041C4225
```

## Typical Workflows

### Quick Test Run

1. Run tests on preferred simulator using name
2. Review results for passes/failures
3. Report any failures with details

### Test with Coverage

1. Run tests with coverage flag
2. Parse xcresult for coverage data
3. Report coverage percentages

## Notes

- Tests run using xcodebuild test
- Results are parsed from xcresult bundles
- Failures include detailed stack traces
- Can filter tests by pattern for targeted testing
