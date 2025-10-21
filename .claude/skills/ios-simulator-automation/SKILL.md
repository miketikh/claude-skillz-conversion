---
name: ios-simulator-automation
description: Automate UI interactions on iOS simulators. Tap buttons, type text, swipe, take screenshots, and interact with app elements programmatically.
---

# iOS Simulator Automation Skill

This skill provides UI automation and interaction capabilities for iOS simulators.

## Capabilities

- Get UI element hierarchy with precise coordinates
- Tap, long press, and touch at specific coordinates
- Swipe and perform gestures (scroll, edge swipes)
- Type text and press keyboard keys
- Press hardware buttons (home, lock, side button, Siri)
- Capture screenshots and record videos
- Automate complex UI interaction sequences

## When to Use

Use this skill when the user asks to:
- Tap a button on the simulator
- Type text into a field
- Swipe or scroll in the app
- Take a screenshot
- Record a video of the simulator
- Press the home button or other hardware buttons
- Automate UI testing or interactions
- Find UI elements and their positions
- Perform gestures

## Available Commands

### Describe UI

Gets the complete view hierarchy with element coordinates.

**Usage:**
```bash
bash scripts/describe-ui.sh <simulator-uuid>
```

**Returns:** JSON with all UI elements, frames, labels, and accessibility info

### Tap

Taps at specific coordinates.

**Usage:**
```bash
bash scripts/tap.sh <simulator-uuid> <x> <y>
```

### Long Press

Long presses at specific coordinates for a given duration.

**Usage:**
```bash
bash scripts/long-press.sh <simulator-uuid> <x> <y> <duration-ms>
```

### Touch

Performs touch down/up events at specific coordinates.

**Usage:**
```bash
bash scripts/touch.sh <simulator-uuid> <x> <y> [down] [up]
```

### Type Text

Types text into the focused field.

**Usage:**
```bash
bash scripts/type-text.sh <simulator-uuid> "text to type"
```

### Swipe

Swipes from one point to another.

**Usage:**
```bash
bash scripts/swipe.sh <simulator-uuid> <x1> <y1> <x2> <y2>
```

### Gesture

Performs preset gestures.

**Usage:**
```bash
bash scripts/gesture.sh <simulator-uuid> <preset>
```

**Presets:** scroll-up, scroll-down, scroll-left, scroll-right, swipe-from-left-edge, swipe-from-right-edge, swipe-from-top-edge, swipe-from-bottom-edge

### Screenshot

Captures a screenshot.

**Usage:**
```bash
bash scripts/screenshot.sh <simulator-uuid>
```

### Record Video

Starts/stops video recording.

**Usage:**
```bash
bash scripts/record-video.sh <simulator-uuid> start
bash scripts/record-video.sh <simulator-uuid> stop <output-path>
```

### Hardware Button

Presses hardware buttons.

**Usage:**
```bash
bash scripts/button.sh <simulator-uuid> <button-type>
```

**Buttons:** home, lock, side-button, siri, apple-pay

### Key Press

Presses a single key by keycode.

**Usage:**
```bash
bash scripts/key-press.sh <simulator-uuid> <keycode>
```

**Common keycodes:** 40=Return, 42=Backspace, 43=Tab, 44=Space, 58-67=F1-F10

### Key Sequence

Presses a sequence of keys using HID keycodes.

**Usage:**
```bash
bash scripts/key-sequence.sh <simulator-uuid> <keycode1> <keycode2> ...
```

## Typical Workflows

### Automated UI Testing

1. Use `describe-ui.sh` to find element coordinates
2. Use `tap.sh` to interact with buttons/fields
3. Use `type-text.sh` to enter data
4. Use `screenshot.sh` to capture results
5. Verify expected UI state

### Recording a Demo

1. Start recording with `record-video.sh`
2. Perform UI interactions
3. Stop recording and save video

## Notes

- **ALWAYS use describe-ui.sh first** to get precise coordinates - never guess from screenshots
- Coordinates are in points, not pixels
- Use gestures for common actions like scrolling
- Screenshots return base64-encoded images
- Video recording uses the simulator's native recording capabilities
