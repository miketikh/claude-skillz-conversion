# MCP to Skills Conversion Guide

Quick reference for converting MCP servers to Skills format to save context tokens.

## Token Savings

- **Before**: MCP server loads all tools at startup (e.g., 60 tools = 45k tokens)
- **After**: Skill metadata only (~100 tokens), tools invoked via scripts when needed
- **Savings**: ~99% reduction in context usage

## Directory Structure

```
.claude/skills/
└── <skill-name>/
    ├── SKILL.md              # Metadata + instructions
    ├── scripts/
    │   ├── <command-1>.sh    # Wrapper scripts
    │   ├── <command-2>.sh
    │   └── ...
    └── resources/            # Optional: configs, examples
```

## Step 1: Discover Available Tools

List all tools from an MCP server:

```bash
mcp tools npx -y <package-name>@latest
```

**Example:**
```bash
mcp tools npx -y xcodebuildmcp@latest
mcp tools npx -y firebase-tools@latest mcp
```

**Output shows:**
- Tool names
- Parameters (required vs optional)
- Descriptions

## Step 2: Create Skill Directory

```bash
mkdir -p .claude/skills/<skill-name>/scripts
mkdir -p .claude/skills/<skill-name>/resources
```

## Step 3: Create SKILL.md

**Template:**

```markdown
---
name: <skill-name>
description: Brief description of what this skill does (one sentence)
---

# <Skill Name> Skill

## Capabilities

- List what this skill can do
- Be specific and action-oriented

## When to Use

Use this skill when the user asks to:
- Trigger phrase 1
- Trigger phrase 2

## Project Configuration

(Optional - include project-specific defaults)

## Available Commands

### Command Name

Description of what it does.

**Usage:**
\`\`\`bash
bash scripts/command-name.sh <param1> [param2]
\`\`\`

**Parameters:**
- `param1`: Description
- `param2`: (Optional) Description

## Typical Workflows

### Workflow Name

1. Step 1
2. Step 2
3. **Important:** Note about orchestration/parallelization if needed

## Notes

- Important caveats
- Tips for usage
```

## Step 4: Create Wrapper Scripts

**Script template:**

```bash
#!/bin/bash
# Description of what this script does

# Validate required parameters
if [ -z "$1" ]; then
  echo "Error: Parameter required"
  echo "Usage: bash script-name.sh <param>"
  exit 1
fi

PARAM1="$1"
# ... define other params

# Call MCP tool via mcp CLI
mcp call <tool_name> \
  --params '{"param1":"value1","param2":"value2"}' \
  npx -y <package-name>@latest
```

**Key points:**
- Use `mcp call <tool_name>` to invoke MCP tools
- Pass params as JSON via `--params '{...}'`
- End with the MCP server command: `npx -y <package>@latest`
- Make executable: `chmod +x scripts/*.sh`

## Step 5: Handle Parameters Correctly

**Check tool signature:**
```bash
mcp tools npx -y <package>@latest | grep -A 3 "<tool_name>"
```

**Parameter format:**
- Required params: `paramName:type`
- Optional params: `[paramName:type]`

**Examples:**

```bash
# Tool with no params (still needs empty object)
mcp call list_sims --params '{}' npx -y xcodebuildmcp@latest

# Tool with optional boolean
mcp call list_sims --params '{"enabled":true}' npx -y xcodebuildmcp@latest

# Tool with multiple params
mcp call build_sim \
  --params '{"projectPath":"/path/to/project","scheme":"MyScheme","simulatorId":"UUID"}' \
  npx -y xcodebuildmcp@latest
```

## Step 6: Update .mcp.json

Comment out or remove the MCP server entry:

```json
{
  "mcpServers": {
    // "ServerName": {
    //   "type": "stdio",
    //   "command": "npx",
    //   "args": ["-y", "package-name@latest"]
    // }
  }
}
```

**Note:** You'll need to restart Claude Code for MCP changes to take effect.

## Conversion Checklist

When converting an MCP server to a skill:

- [ ] List all available tools: `mcp tools npx -y <package>@latest`
- [ ] Create skill directory structure
- [ ] Write SKILL.md with metadata (~100 tokens max)
- [ ] Create wrapper scripts for commonly-used tools
- [ ] Test each script independently
- [ ] Make scripts executable: `chmod +x scripts/*.sh`
- [ ] Document orchestration patterns (parallel execution, etc.)
- [ ] Comment out MCP server in .mcp.json
- [ ] Verify skill activates correctly

## Example: XcodeBuildMCP Conversion

**Before:**
- 60 tools in MCP = 45k tokens
- Always loaded in context

**After:**
```
.claude/skills/xcode-build/
├── SKILL.md                    # ~100 tokens
├── scripts/
│   ├── list-sims.sh           # List simulators
│   ├── build-sim.sh           # Build only
│   └── build-and-run.sh       # Build + deploy
```

**Result:** 45k tokens → 100 tokens = 99% savings

## Common Patterns

### Tools with No Parameters
```bash
mcp call tool_name --params '{}' npx -y package@latest
```

### Tools with Optional Parameters
```bash
# Provide default or user-specified values
PARAM="${1:-default_value}"
mcp call tool_name --params "{\"param\":\"$PARAM\"}" npx -y package@latest
```

### Parallel Execution (Multiple Targets)
- Keep scripts simple (one target each)
- Let Claude orchestrate parallel execution with agents
- Document in SKILL.md: "Use agents to run in parallel"

### Error Handling
```bash
if [ $? -eq 0 ]; then
  echo "✅ Success"
else
  echo "❌ Failed"
  exit 1
fi
```

## Tools Required

- **mcptools CLI**: `brew install f/mcptools/mcp`
  - Or via Go: `go install github.com/f/mcptools/cmd/mcptools@latest`
- Used to invoke MCP tools from bash scripts

## When NOT to Convert

Don't convert if:
- MCP server has only 1-2 tools (minimal savings)
- Tools are used constantly (always needed in context anyway)
- MCP server provides resources/prompts (skills only handle tools)

## Quick Reference

```bash
# List tools
mcp tools npx -y <package>@latest

# Call a tool
mcp call <tool_name> --params '{"key":"value"}' npx -y <package>@latest

# Test a script
bash .claude/skills/<skill>/scripts/<script>.sh <args>

# Make executable
chmod +x .claude/skills/<skill>/scripts/*.sh
```

## Next Steps After Conversion

1. Test the skill by asking Claude to use it
2. Monitor context usage with `/context`
3. Add more wrapper scripts as needed
4. Share skills via git (commit `.claude/skills/`)
