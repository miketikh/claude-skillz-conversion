# Claude-Skillz

# Problem

MCP tools enable a lot of functionality, but take up huge amounts of context unecessarily. Example, if you want your agents to have access to XCODE tooling, you can add the MCP, but then all of the tools will be dumped into the main thread's context window, taking up about 10% of your available context. Some eat even more, making it tough to have many useful tools in your project.

# Objective

To have access to all the tools your agents might need, while keeping the impact on context window minimal, using Claude-Skills. Claude skills only reveal a DESCRIPTION of the tools available initially to claude (trivial space), then if you ask for a function it can incrementally explore what functions are available

# Implementation

For each MCP tool, have claude look up what tools it offers, make a skills file for relevant tools with the description of when to use them, then make bash scripts for each tool

# Directions

(Note: Currently only skills for xcode-build mcp tool)

- load this folder into claude
- `brew install mcp` (used to run the skills)
- give claude permission to bash commands

Then let it rip. Run claude, it has access to all the skill descriptions, and should be able to use tools like using MCP, with a fraction of the tokens.

You may want to give a direction to claude - "do not try interacting with xcode directly via bash commands, always use the skills and tools exposed to you"