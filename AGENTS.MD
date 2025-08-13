# AGENTS.md  Project Overview for Agent Tools
This repo uses `AGENT.md` as the single source of truth for agentic tooling.

## Current Config
- Dev Container (Node 20)
- Global `@anthropic-ai/claude-code` installed
- Host `~/.claude` mounted into container for Max subscription login

## Guidance
- Agent tools should read `AGENT.md` for project structure.
- If a tool expects a different config filename, symlink it to `AGENT.md`.