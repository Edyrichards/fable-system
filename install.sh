#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:-all}"
install_hermes() {
  mkdir -p "$HOME/.hermes/skills/fable-system" "$HOME/.hermes/agents/fable-system"
  cp "$ROOT/README.md" "$ROOT/agent.md" "$HOME/.hermes/agents/fable-system/" 2>/dev/null || true
  cp -R "$ROOT"/references "$ROOT"/scripts "$ROOT"/templates "$ROOT"/prompts "$ROOT"/project-knowledge "$ROOT"/repo "$ROOT"/playbooks "$ROOT"/research "$HOME/.hermes/agents/fable-system/" 2>/dev/null || true
  cp "$ROOT/hermes/SKILL.md" "$HOME/.hermes/skills/fable-system/SKILL.md"
  mkdir -p "$HOME/.hermes/skills/fable-system/references" "$HOME/.hermes/skills/fable-system/scripts" "$HOME/.hermes/skills/fable-system/templates"
  cp -R "$ROOT/references/"* "$HOME/.hermes/skills/fable-system/references/" 2>/dev/null || true
  cp -R "$ROOT/scripts/"* "$HOME/.hermes/skills/fable-system/scripts/" 2>/dev/null || true
  cp -R "$ROOT/templates/"* "$HOME/.hermes/skills/fable-system/templates/" 2>/dev/null || true
  chmod +x "$HOME/.hermes/agents/fable-system/scripts/"*.py "$HOME/.hermes/skills/fable-system/scripts/"*.py 2>/dev/null || true
  echo "Installed Hermes skill: fable-system"
}
install_claude() {
  mkdir -p "$HOME/.claude/agents" "$HOME/.claude/commands"
  cp "$ROOT/claude/fable-system.md" "$HOME/.claude/agents/fable-system.md" 2>/dev/null || true
  cp "$ROOT/claude/commands/"*.md "$HOME/.claude/commands/" 2>/dev/null || true
  echo "Installed Claude agent and /fable commands"
}
case "$MODE" in
  hermes) install_hermes ;;
  claude) install_claude ;;
  all) install_hermes; install_claude ;;
  *) echo "Usage: ./install.sh [all|hermes|claude]"; exit 2 ;;
esac
