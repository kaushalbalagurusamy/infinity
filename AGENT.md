# Project Agent Guide — GarmentSeg
Minimal Dev Container setup for Claude Code (Max subscription, no API key).

## Workflow
- Reopen in container: Command Palette → "Dev Containers: Reopen in Container"
- Verify: `claude-code --version` & `claude-code --help`
- Claude config mounted from host: `~/.claude` → `/home/node/.claude`

## Next Steps
- Add Makefile, CLI, tests when segmentation work starts.

## Conventions
- Keep changes small and documented.
- No secrets committed. No API keys needed for Claude Code Max login.