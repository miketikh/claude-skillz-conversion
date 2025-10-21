#!/bin/bash
# Lists available iOS simulators using xcodebuildmcp via mcp CLI

mcp call list_sims --params '{"enabled":true}' npx -y xcodebuildmcp@latest
