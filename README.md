# Fable System Skill Portable Package

Fable System is a portable execution-first agent skill for product, design, coding, research, critique, verification, handoff, and design-system-first UI work.

It is designed to work in:

- Hermes Agent
- Claude Code
- Cursor / Windsurf / IDE agents via `AGENTS.md` or `CLAUDE.md`
- Codex / OpenCode / generic coding agents via project instructions
- Any LLM tool that can load markdown instructions and reference files

## Core behavior

Fable uses this loop:

```txt
intent -> mode router -> relevant references -> tool workflow -> verifier -> evidence ledger -> concise handoff
```

For UI/design work, Fable adds:

```txt
intake questions or assumptions -> design system -> components/screens/charts -> visual verification
```

## Install for Hermes

From this folder:

```bash
./install.sh hermes
```

Then invoke:

```bash
hermes -s fable-system
```

or in chat:

```txt
/skill fable-system
```

## Install for Claude Code

```bash
./install.sh claude
```

Then use:

```txt
Use the fable-system agent to ...
/fable ...
```

## Install for both Hermes and Claude

```bash
./install.sh all
```

## Use in Cursor, Windsurf, Codex, OpenCode, Replit, or generic tools

Copy this folder into your repo as:

```txt
.fable/fable-system/
```

Then copy one of these into the repo root:

```txt
universal/AGENTS.md
universal/CLAUDE.md
```

Recommended repo layout:

```txt
your-project/
  AGENTS.md
  .fable/fable-system/
    references/
    scripts/
    templates/
```

If the tool supports custom rules, paste the contents of `universal/AGENTS.md` into that tool's project instructions.

## Bootstrap a project design system

```bash
python .fable/fable-system/scripts/fable_design_system_init.py .
```

or if installed globally:

```bash
python ~/.hermes/agents/fable-system/scripts/fable_design_system_init.py .
```

This creates/updates:

- `DESIGN.md`
- `CLAUDE.md` design-system enforcement section

## Important references

- `references/00-operating-contract.md`
- `references/01-mode-router.md`
- `references/02-evidence-ledger.md`
- `references/03-verifier-subagents.md`
- `references/design-system-first.md`
- `references/design-masterclass.md`
- `references/charts-and-design-system-adapters.md`
- `references/ui-pro-max-preflight.md`
- `references/design-rubric-v2.md`

## Publish/share options

### Simple ZIP

Send `fable-system-skill-portable.zip` to someone. They unzip and run:

```bash
./install.sh all
```

### GitHub repo

Create a repo with this folder as the root. Users can install via:

```bash
git clone https://github.com/Edyrichards/fable-system.git
cd fable-system
./install.sh all
```

### Hermes direct install

If hosted publicly, users can install the Hermes skill file directly:

```bash
hermes skills install https://raw.githubusercontent.com/Edyrichards/fable-system/main/hermes/SKILL.md --name fable-system
```

For full behavior, the repo/zip install is better because it includes references and scripts.

## GitHub release ZIP install

Download `fable-system-skill-portable.zip` from the latest GitHub release, unzip it, then run:

```bash
cd fable-system-skill-portable
./install.sh all
```

## License

This package is source-available. Personal/internal install and evaluation are allowed. Redistribution, resale, repackaging, or hosted competing services require prior written permission. See `LICENSE`.

## Verify

After install:

```bash
python ~/.hermes/agents/fable-system/scripts/verify_install.py
```
