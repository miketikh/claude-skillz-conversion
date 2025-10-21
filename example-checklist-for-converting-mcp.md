# XcodeBuildMCP Tools Inventory

Complete list of all tools available in XcodeBuildMCP for conversion to Skills format.

## Legend
- ✅ Converted to skill
- 🔄 Partially converted
- ⬜ Not yet converted

---

## 1. Project & Workspace Management (5 tools)

### ✅ `discover_projs`
**Signature:** `discover_projs(workspaceRoot:str, [maxDepth:int], [scanPath:str])`
**Description:** Scans a directory to find Xcode project (.xcodeproj) and workspace (.xcworkspace) files
**Required params:** `workspaceRoot`
**Optional params:** `maxDepth`, `scanPath`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/discover-projects.sh`
**Example:**
```bash
mcp call discover_projs \
  --params '{"workspaceRoot":"/Users/Gauntlet/gauntlet/CreatorLink"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `list_schemes`
**Signature:** `list_schemes([projectPath:str], [workspacePath:str])`
**Description:** Lists available schemes for a project or workspace (provide exactly one)
**Required params:** None (but must provide either `projectPath` OR `workspacePath`)
**Optional params:** `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/list-schemes.sh`
**Example:**
```bash
mcp call list_schemes \
  --params '{"projectPath":"/path/to/MyProject.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `show_build_settings`
**Signature:** `show_build_settings(scheme:str, [projectPath:str], [workspacePath:str])`
**Description:** Shows build settings from a project or workspace using xcodebuild
**Required params:** `scheme`
**Optional params:** `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/show-build-settings.sh`
**Example:**
```bash
mcp call show_build_settings \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/MyProject.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `clean`
**Signature:** `clean([configuration:str], [derivedDataPath:str], [extraArgs:str[]], [platform:str], [preferXcodebuild:bool], [projectPath:str], [scheme:str], [workspacePath:str])`
**Description:** Cleans build products for a project or workspace (platform defaults to iOS)
**Required params:** None
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `platform`, `preferXcodebuild`, `projectPath`, `scheme`, `workspacePath`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/clean.sh`
**Example:**
```bash
mcp call clean \
  --params '{"projectPath":"/path/to/MyProject.xcodeproj","scheme":"MyScheme","platform":"iOS"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `doctor`
**Signature:** `doctor([enabled:bool])`
**Description:** Provides comprehensive information about the MCP server environment and dependencies
**Required params:** None
**Optional params:** `enabled`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/doctor.sh`
**Example:**
```bash
mcp call doctor --params '{}' npx -y xcodebuildmcp@latest
```

---

## 2. iOS Simulator Management (17 tools)

### ✅ `list_sims`
**Signature:** `list_sims([enabled:bool])`
**Description:** Lists available iOS simulators with their UUIDs
**Required params:** None
**Optional params:** `enabled`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/list-sims.sh`

### ✅ `boot_sim`
**Signature:** `boot_sim(simulatorUuid:str)`
**Description:** Boots an iOS simulator (use open_sim() after to make visible)
**Required params:** `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/boot-sim.sh`

### ✅ `open_sim`
**Signature:** `open_sim`
**Description:** Opens the iOS Simulator app
**Required params:** None
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/open-sim.sh`

### ✅ `build_sim`
**Signature:** `build_sim(scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [simulatorId:str], [simulatorName:str], [useLatestOS:bool], [workspacePath:str])`
**Description:** Builds an app for a specific simulator by UUID or name
**Required params:** `scheme`
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `preferXcodebuild`, `projectPath`, `simulatorId`, `simulatorName`, `useLatestOS`, `workspacePath`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/build-sim.sh`

### ✅ `build_run_sim`
**Signature:** `build_run_sim(scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [simulatorId:str], [simulatorName:str], [useLatestOS:bool], [workspacePath:str])`
**Description:** Builds and runs an app on a simulator in one step
**Required params:** `scheme`
**Optional params:** Same as build_sim
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/build-and-run.sh`

### ✅ `get_sim_app_path`
**Signature:** `get_sim_app_path(platform:str, scheme:str, [arch:str], [configuration:str], [projectPath:str], [simulatorId:str], [simulatorName:str], [useLatestOS:bool], [workspacePath:str])`
**Description:** Gets the app bundle path for a simulator application
**Required params:** `platform`, `scheme`
**Optional params:** `arch`, `configuration`, `projectPath`, `simulatorId`, `simulatorName`, `useLatestOS`, `workspacePath`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/get-sim-app-path.sh`

### ✅ `install_app_sim`
**Signature:** `install_app_sim(appPath:str, simulatorUuid:str)`
**Description:** Installs an app in an iOS simulator
**Required params:** `appPath`, `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/install-app.sh`

### ✅ `launch_app_sim`
**Signature:** `launch_app_sim(bundleId:str, [args:str[]], [simulatorName:str], [simulatorUuid:str])`
**Description:** Launches an app in a simulator (provide either simulatorUuid OR simulatorName)
**Required params:** `bundleId`
**Optional params:** `args`, `simulatorName`, `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/launch-app.sh`

### ✅ `launch_app_logs_sim`
**Signature:** `launch_app_logs_sim(bundleId:str, simulatorUuid:str, [args:str[]])`
**Description:** Launches an app in a simulator and captures its logs
**Required params:** `bundleId`, `simulatorUuid`
**Optional params:** `args`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/launch-app-logs.sh`

### ✅ `stop_app_sim`
**Signature:** `stop_app_sim(bundleId:str, [simulatorName:str], [simulatorUuid:str])`
**Description:** Stops an app running in a simulator
**Required params:** `bundleId`
**Optional params:** `simulatorName`, `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-build/scripts/stop-app.sh`

### ✅ `test_sim`
**Signature:** `test_sim(scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [simulatorId:str], [simulatorName:str], [testRunnerEnv:obj], [useLatestOS:bool], [workspacePath:str])`
**Description:** Runs tests on a simulator using xcodebuild test
**Required params:** `scheme`
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `preferXcodebuild`, `projectPath`, `simulatorId`, `simulatorName`, `testRunnerEnv`, `useLatestOS`, `workspacePath`
**Status:** ✅ Converted to `.claude/skills/ios-simulator-testing/scripts/test-sim.sh`

### ✅ `erase_sims`
**Signature:** `erase_sims([all:bool], [shutdownFirst:bool], [simulatorUdid:str])`
**Description:** Erases simulator content and settings (provide simulatorUdid OR all=true)
**Required params:** None (but must provide either `simulatorUdid` OR `all`)
**Optional params:** `all`, `shutdownFirst`, `simulatorUdid`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/erase-sim.sh` (specific simulator) and `.claude/skills/ios-simulator-config/scripts/erase-all-sims.sh` (all simulators)
**Example:**
```bash
mcp call erase_sims \
  --params '{"simulatorUdid":"UUID","shutdownFirst":true}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `screenshot`
**Signature:** `screenshot(simulatorUuid:str)`
**Description:** Captures screenshot for visual verification
**Required params:** `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/screenshot.sh`

### ✅ `record_sim_video`
**Signature:** `record_sim_video(simulatorUuid:str, [fps:int], [outputFile:str], [start:bool], [stop:bool])`
**Description:** Starts or stops video capture (provide exactly one of start=true or stop=true)
**Required params:** `simulatorUuid`
**Optional params:** `fps`, `outputFile`, `start`, `stop`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/record-video.sh`

### ✅ `start_sim_log_cap`
**Signature:** `start_sim_log_cap(bundleId:str, simulatorUuid:str, [captureConsole:bool])`
**Description:** Starts capturing logs from a simulator (returns session ID)
**Required params:** `bundleId`, `simulatorUuid`
**Optional params:** `captureConsole`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/start-logs.sh`
**Example:**
```bash
mcp call start_sim_log_cap \
  --params '{"bundleId":"com.example.MyApp","simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `stop_sim_log_cap`
**Signature:** `stop_sim_log_cap(logSessionId:str)`
**Description:** Stops an active simulator log capture session and returns logs
**Required params:** `logSessionId`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/stop-logs.sh`
**Example:**
```bash
mcp call stop_sim_log_cap \
  --params '{"logSessionId":"SESSION_ID"}' \
  npx -y xcodebuildmcp@latest
```

---

## 3. Simulator Configuration (4 tools)

### ✅ `set_sim_appearance`
**Signature:** `set_sim_appearance(mode:str, simulatorUuid:str)`
**Description:** Sets the appearance mode (dark/light) of a simulator
**Required params:** `mode`, `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/set-appearance.sh`
**Example:**
```bash
mcp call set_sim_appearance \
  --params '{"mode":"dark","simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `set_sim_location`
**Signature:** `set_sim_location(latitude:num, longitude:num, simulatorUuid:str)`
**Description:** Sets a custom GPS location for the simulator
**Required params:** `latitude`, `longitude`, `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/set-location.sh`
**Example:**
```bash
mcp call set_sim_location \
  --params '{"latitude":37.7749,"longitude":-122.4194,"simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `reset_sim_location`
**Signature:** `reset_sim_location(simulatorUuid:str)`
**Description:** Resets the simulator's location to default
**Required params:** `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/reset-location.sh`
**Example:**
```bash
mcp call reset_sim_location \
  --params '{"simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `sim_statusbar`
**Signature:** `sim_statusbar(dataNetwork:str, simulatorUuid:str)`
**Description:** Sets the data network indicator in simulator status bar
**Required params:** `dataNetwork`, `simulatorUuid`
**Valid values:** `clear`, `hide`, `wifi`, `3g`, `4g`, `lte`, `lte-a`, `lte+`, `5g`, `5g+`, `5g-uwb`, `5g-uc`
**Status:** Converted to `.claude/skills/ios-simulator-config/scripts/set-statusbar.sh`
**Example:**
```bash
mcp call sim_statusbar \
  --params '{"dataNetwork":"5g","simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

---

## 4. Simulator UI Automation (10 tools)

### ✅ `describe_ui`
**Signature:** `describe_ui(simulatorUuid:str)`
**Description:** Gets entire view hierarchy with precise frame coordinates (x, y, width, height)
**Required params:** `simulatorUuid`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/describe-ui.sh`
**Example:**
```bash
mcp call describe_ui \
  --params '{"simulatorUuid":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `tap`
**Signature:** `tap(simulatorUuid:str, x:int, y:int, [postDelay:num], [preDelay:num])`
**Description:** Tap at specific coordinates (use describe_ui to get coordinates)
**Required params:** `simulatorUuid`, `x`, `y`
**Optional params:** `postDelay`, `preDelay`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/tap.sh`
**Example:**
```bash
mcp call tap \
  --params '{"simulatorUuid":"UUID","x":100,"y":200}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `long_press`
**Signature:** `long_press(duration:num, simulatorUuid:str, x:int, y:int)`
**Description:** Long press at specific coordinates for given duration (ms)
**Required params:** `duration`, `simulatorUuid`, `x`, `y`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/long-press.sh`
**Example:**
```bash
mcp call long_press \
  --params '{"simulatorUuid":"UUID","x":100,"y":200,"duration":1000}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `swipe`
**Signature:** `swipe(simulatorUuid:str, x1:int, x2:int, y1:int, y2:int, [delta:num], [duration:num], [postDelay:num], [preDelay:num])`
**Description:** Swipe from one point to another with configurable timing
**Required params:** `simulatorUuid`, `x1`, `x2`, `y1`, `y2`
**Optional params:** `delta`, `duration`, `postDelay`, `preDelay`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/swipe.sh`
**Example:**
```bash
mcp call swipe \
  --params '{"simulatorUuid":"UUID","x1":100,"y1":400,"x2":100,"y2":100}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `gesture`
**Signature:** `gesture(preset:str, simulatorUuid:str, [delta:num], [duration:num], [postDelay:num], [preDelay:num], [screenHeight:int], [screenWidth:int])`
**Description:** Perform preset gesture (scroll-up/down/left/right, swipe-from-*-edge)
**Required params:** `preset`, `simulatorUuid`
**Optional params:** `delta`, `duration`, `postDelay`, `preDelay`, `screenHeight`, `screenWidth`
**Valid presets:** `scroll-up`, `scroll-down`, `scroll-left`, `scroll-right`, `swipe-from-left-edge`, `swipe-from-right-edge`, `swipe-from-top-edge`, `swipe-from-bottom-edge`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/gesture.sh`
**Example:**
```bash
mcp call gesture \
  --params '{"simulatorUuid":"UUID","preset":"scroll-down"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `touch`
**Signature:** `touch(simulatorUuid:str, x:int, y:int, [delay:num], [down:bool], [up:bool])`
**Description:** Perform touch down/up events at specific coordinates
**Required params:** `simulatorUuid`, `x`, `y`
**Optional params:** `delay`, `down`, `up`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/touch.sh`
**Example:**
```bash
mcp call touch \
  --params '{"simulatorUuid":"UUID","x":100,"y":200,"down":true}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `type_text`
**Signature:** `type_text(simulatorUuid:str, text:str)`
**Description:** Type text (supports US keyboard characters)
**Required params:** `simulatorUuid`, `text`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/type-text.sh`
**Example:**
```bash
mcp call type_text \
  --params '{"simulatorUuid":"UUID","text":"Hello World"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `button`
**Signature:** `button(buttonType:str, simulatorUuid:str, [duration:num])`
**Description:** Press hardware button on iOS simulator
**Required params:** `buttonType`, `simulatorUuid`
**Optional params:** `duration`
**Valid buttons:** `apple-pay`, `home`, `lock`, `side-button`, `siri`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/button.sh`
**Example:**
```bash
mcp call button \
  --params '{"simulatorUuid":"UUID","buttonType":"home"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `key_press`
**Signature:** `key_press(keyCode:int, simulatorUuid:str, [duration:num])`
**Description:** Press a single key by keycode (40=Return, 42=Backspace, 43=Tab, 44=Space, 58-67=F1-F10)
**Required params:** `keyCode`, `simulatorUuid`
**Optional params:** `duration`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/key-press.sh`
**Example:**
```bash
mcp call key_press \
  --params '{"simulatorUuid":"UUID","keyCode":40}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `key_sequence`
**Signature:** `key_sequence(keyCodes:int[], simulatorUuid:str, [delay:num])`
**Description:** Press key sequence using HID keycodes with configurable delay
**Required params:** `keyCodes`, `simulatorUuid`
**Optional params:** `delay`
**Status:** Converted to `.claude/skills/ios-simulator-automation/scripts/key-sequence.sh`
**Example:**
```bash
mcp call key_sequence \
  --params '{"simulatorUuid":"UUID","keyCodes":[40,42,44]}' \
  npx -y xcodebuildmcp@latest
```

---

## 5. Physical Device Management (8 tools)

### ✅ `list_devices`
**Signature:** `list_devices`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/list-devices.sh`**Description:** Lists connected physical Apple devices with UUIDs, names, and connection status
**Required params:** None
mcp call list_devices --params '{}' npx -y xcodebuildmcp@latest
```

### ✅ `build_device`
**Signature:** `build_device(scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [workspacePath:str])`
**Description:** Builds an app for a physical Apple device
**Required params:** `scheme`
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `preferXcodebuild`, `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/build-device.sh`
**Example:**
```bash
mcp call build_device \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `get_device_app_path`
**Signature:** `get_device_app_path(scheme:str, [configuration:str], [platform:str], [projectPath:str], [workspacePath:str])`
**Description:** Gets the app bundle path for a physical device application
**Required params:** `scheme`
**Optional params:** `configuration`, `platform`, `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/get-device-app-path.sh`
**Example:**
```bash
mcp call get_device_app_path \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `install_app_device`
**Signature:** `install_app_device(appPath:str, deviceId:str)`
**Description:** Installs an app on a physical Apple device
**Required params:** `appPath`, `deviceId`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/install-device.sh`
**Example:**
```bash
mcp call install_app_device \
  --params '{"deviceId":"DEVICE_UUID","appPath":"/path/to/app.app"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `launch_app_device`
**Signature:** `launch_app_device(bundleId:str, deviceId:str)`
**Description:** Launches an app on a physical Apple device
**Required params:** `bundleId`, `deviceId`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/launch-device.sh`
**Example:**
```bash
mcp call launch_app_device \
  --params '{"deviceId":"DEVICE_UUID","bundleId":"com.example.MyApp"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `stop_app_device`
**Signature:** `stop_app_device(deviceId:str, processId:num)`
**Description:** Stops an app running on a physical Apple device
**Required params:** `deviceId`, `processId`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/stop-device.sh`
**Example:**
```bash
mcp call stop_app_device \
  --params '{"deviceId":"DEVICE_UUID","processId":12345}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `test_device`
**Signature:** `test_device(deviceId:str, scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [platform:str], [preferXcodebuild:bool], [projectPath:str], [testRunnerEnv:obj], [workspacePath:str])`
**Description:** Runs tests on a physical device using xcodebuild test
**Required params:** `deviceId`, `scheme`
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `platform`, `preferXcodebuild`, `projectPath`, `testRunnerEnv`, `workspacePath`
**Status:** Converted to `.claude/skills/physical-device-build/scripts/test-device.sh`
**Example:**
```bash
mcp call test_device \
  --params '{"deviceId":"DEVICE_UUID","scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `start_device_log_cap` / ✅ `stop_device_log_cap`
**Signatures:**
- `start_device_log_cap(bundleId:str, deviceId:str)` - Returns session ID
- `stop_device_log_cap(logSessionId:str)` - Returns captured logs

**Status:**
- `start_device_log_cap` converted to `.claude/skills/physical-device-build/scripts/start-device-logs.sh`
- `stop_device_log_cap` converted to `.claude/skills/physical-device-build/scripts/stop-device-logs.sh`

**Example:**
```bash
# Start
mcp call start_device_log_cap \
  --params '{"deviceId":"DEVICE_UUID","bundleId":"com.example.MyApp"}' \
  npx -y xcodebuildmcp@latest

# Stop
mcp call stop_device_log_cap \
  --params '{"logSessionId":"SESSION_ID"}' \
  npx -y xcodebuildmcp@latest
```

---

## 6. macOS Build & Test (7 tools)

### ✅ `build_macos`
**Signature:** `build_macos(scheme:str, [arch:str], [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [workspacePath:str])`
**Description:** Builds a macOS app using xcodebuild
**Required params:** `scheme`
**Optional params:** `arch` (arm64/x86_64), `configuration`, `derivedDataPath`, `extraArgs`, `preferXcodebuild`, `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/macos-build/scripts/build-macos.sh`
**Example:**
```bash
mcp call build_macos \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj","arch":"arm64"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `build_run_macos`
**Signature:** `build_run_macos(scheme:str, [arch:str], [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [workspacePath:str])`
**Description:** Builds and runs a macOS app in one step
**Required params:** `scheme`
**Optional params:** Same as build_macos
**Status:** Converted to `.claude/skills/macos-build/scripts/build-run-macos.sh`
**Example:**
```bash
mcp call build_run_macos \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `get_mac_app_path`
**Signature:** `get_mac_app_path(scheme:str, [arch:str], [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [projectPath:str], [workspacePath:str])`
**Description:** Gets the app bundle path for a macOS application
**Required params:** `scheme`
**Optional params:** `arch`, `configuration`, `derivedDataPath`, `extraArgs`, `projectPath`, `workspacePath`
**Status:** Converted to `.claude/skills/macos-build/scripts/get-mac-app-path.sh`
**Example:**
```bash
mcp call get_mac_app_path \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `launch_mac_app`
**Signature:** `launch_mac_app(appPath:str, [args:str[]])`
**Description:** Launches a macOS application
**Required params:** `appPath`
**Optional params:** `args`
**Status:** Converted to `.claude/skills/macos-build/scripts/launch-mac-app.sh`
**Example:**
```bash
mcp call launch_mac_app \
  --params '{"appPath":"/path/to/app.app"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `stop_mac_app`
**Signature:** `stop_mac_app([appName:str], [processId:num])`
**Description:** Stops a running macOS application by name or process ID
**Required params:** None (but must provide either `appName` OR `processId`)
**Optional params:** `appName`, `processId`
**Status:** Converted to `.claude/skills/macos-build/scripts/stop-mac-app.sh`
**Example:**
```bash
mcp call stop_mac_app \
  --params '{"appName":"MyApp"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `test_macos`
**Signature:** `test_macos(scheme:str, [configuration:str], [derivedDataPath:str], [extraArgs:str[]], [preferXcodebuild:bool], [projectPath:str], [testRunnerEnv:obj], [workspacePath:str])`
**Description:** Runs tests for a macOS project using xcodebuild test
**Required params:** `scheme`
**Optional params:** `configuration`, `derivedDataPath`, `extraArgs`, `preferXcodebuild`, `projectPath`, `testRunnerEnv`, `workspacePath`
**Status:** Converted to `.claude/skills/macos-build/scripts/test-macos.sh`
**Example:**
```bash
mcp call test_macos \
  --params '{"scheme":"MyScheme","projectPath":"/path/to/project.xcodeproj"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `get_mac_bundle_id`
**Signature:** `get_mac_bundle_id(appPath:str)`
**Description:** Extracts bundle identifier from a macOS app bundle
**Required params:** `appPath`
**Status:** Converted to `.claude/skills/macos-build/scripts/get-bundle-id.sh`
**Example:**
```bash
mcp call get_mac_bundle_id \
  --params '{"appPath":"/path/to/app.app"}' \
  npx -y xcodebuildmcp@latest
```

---

## 7. Bundle ID Utilities (2 tools)

### ✅ `get_app_bundle_id`
**Signature:** `get_app_bundle_id(appPath:str)`
**Description:** Extracts bundle identifier from an app bundle for any Apple platform
**Required params:** `appPath`
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/get-bundle-id.sh`
**Example:**
```bash
mcp call get_app_bundle_id \
  --params '{"appPath":"/path/to/app.app"}' \
  npx -y xcodebuildmcp@latest
```

### ✅ `get_mac_bundle_id`
**Signature:** `get_mac_bundle_id(appPath:str)`
**Description:** Extracts bundle identifier from a macOS app bundle
**Required params:** `appPath`
**Status:** Converted to `.claude/skills/macos-build/scripts/get-bundle-id.sh`
**Example:**
```bash
mcp call get_mac_bundle_id \
  --params '{"appPath":"/path/to/app.app"}' \
  npx -y xcodebuildmcp@latest
```

---

## 8. Project Scaffolding (2 tools)

### ✅ `scaffold_ios_project`
**Signature:** `scaffold_ios_project(outputPath:str, projectName:str, [bundleIdentifier:str], [currentProjectVersion:str], [customizeNames:bool], [deploymentTarget:str], [displayName:str], [marketingVersion:str], [supportedOrientations:str[]], [supportedOrientationsIpad:str[]], [targetedDeviceFamily:str[]])`
**Description:** Scaffold a new iOS project with modern structure
**Required params:** `outputPath`, `projectName`
**Optional params:** Many customization options
**Status:** Converted to `.claude/skills/xcode-project-tools/scripts/scaffold-ios.sh`
**Example:**
```bash
mcp call scaffold_ios_project \
  --params '{"outputPath":"/path/to/output","projectName":"MyApp"}' \
  npx -y xcodebuildmcp@latest
```

### ⬜ `scaffold_macos_project`
**Signature:** `scaffold_macos_project(outputPath:str, projectName:str, [bundleIdentifier:str], [currentProjectVersion:str], [customizeNames:bool], [deploymentTarget:str], [displayName:str], [marketingVersion:str])`
**Description:** Scaffold a new macOS project with modern structure
**Required params:** `outputPath`, `projectName`
**Optional params:** Several customization options
**Example:**
```bash
mcp call scaffold_macos_project \
  --params '{"outputPath":"/path/to/output","projectName":"MyApp"}' \
  npx -y xcodebuildmcp@latest
```

---

## 9. Swift Package Manager (6 tools)

### ⬜ `swift_package_build`
**Signature:** `swift_package_build(packagePath:str, [architectures:str[]], [configuration:str], [parseAsLibrary:bool], [targetName:str])`
**Description:** Builds a Swift Package with swift build
**Required params:** `packagePath`
**Optional params:** `architectures`, `configuration` (debug/release), `parseAsLibrary`, `targetName`
**Example:**
```bash
mcp call swift_package_build \
  --params '{"packagePath":"/path/to/package","configuration":"release"}' \
  npx -y xcodebuildmcp@latest
```

### ⬜ `swift_package_run`
**Signature:** `swift_package_run(packagePath:str, [arguments:str[]], [background:bool], [configuration:str], [executableName:str], [parseAsLibrary:bool], [timeout:num])`
**Description:** Runs an executable target from a Swift Package
**Required params:** `packagePath`
**Optional params:** `arguments`, `background`, `configuration`, `executableName`, `parseAsLibrary`, `timeout`
**Example:**
```bash
mcp call swift_package_run \
  --params '{"packagePath":"/path/to/package","arguments":["--verbose"]}' \
  npx -y xcodebuildmcp@latest
```

### ⬜ `swift_package_test`
**Signature:** `swift_package_test(packagePath:str, [configuration:str], [filter:str], [parallel:bool], [parseAsLibrary:bool], [showCodecov:bool], [testProduct:str])`
**Description:** Runs tests for a Swift Package
**Required params:** `packagePath`
**Optional params:** `configuration`, `filter`, `parallel`, `parseAsLibrary`, `showCodecov`, `testProduct`
**Example:**
```bash
mcp call swift_package_test \
  --params '{"packagePath":"/path/to/package","showCodecov":true}' \
  npx -y xcodebuildmcp@latest
```

### ⬜ `swift_package_clean`
**Signature:** `swift_package_clean(packagePath:str)`
**Description:** Cleans Swift Package build artifacts and derived data
**Required params:** `packagePath`
**Example:**
```bash
mcp call swift_package_clean \
  --params '{"packagePath":"/path/to/package"}' \
  npx -y xcodebuildmcp@latest
```

### ⬜ `swift_package_list`
**Signature:** `swift_package_list`
**Description:** Lists currently running Swift Package processes
**Required params:** None
**Example:**
```bash
mcp call swift_package_list --params '{}' npx -y xcodebuildmcp@latest
```

### ⬜ `swift_package_stop`
**Signature:** `swift_package_stop(pid:num)`
**Description:** Stops a running Swift Package executable
**Required params:** `pid`
**Example:**
```bash
mcp call swift_package_stop \
  --params '{"pid":12345}' \
  npx -y xcodebuildmcp@latest
```

---

## Summary Statistics

**Total Tools:** 72
**Converted:** 18 (25%)
**Remaining:** 54 (75%)

### By Category:
- Project & Workspace: 0/5 (0%)
- iOS Simulator: 11/17 (65%)
- Simulator Configuration: 0/4 (0%)
- Simulator UI Automation: 0/10 (0%)
- Physical Devices: 0/8 (0%)
- macOS Build & Test: 7/7 (100%)
- Bundle ID Utilities: 1/2 (50%)
- Project Scaffolding: 0/2 (0%)
- Swift Package Manager: 0/6 (0%)

---

## Notes for Conversion

1. **Parameter Validation:** All scripts should validate required parameters
2. **Error Handling:** Check exit codes and provide clear error messages
3. **Project Defaults:** CreatorLink project uses:
   - Project path: `/Users/Gauntlet/gauntlet/CreatorLink/CreatorLink.xcodeproj`
   - Scheme: `CreatorLink`
   - Preferred simulator: `iPhone 16 Pro`
4. **Orchestration:** Complex workflows (parallel builds, UI automation sequences) should be documented in SKILL.md for Claude to orchestrate
5. **Make Executable:** Remember `chmod +x scripts/*.sh` after creating new scripts
