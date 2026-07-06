#!/usr/bin/env python3
from pathlib import Path
import subprocess, sys
HOME = Path.home()
agent = HOME/'.hermes/agents/fable-system'
skill = HOME/'.hermes/skills/fable-system'
required_agent = [
    'references/00-operating-contract.md','references/01-mode-router.md','references/02-evidence-ledger.md',
    'references/03-verifier-subagents.md','references/design-system-first.md','references/charts-and-design-system-adapters.md','scripts/fable_init.py','scripts/fable_eval.py','scripts/fable_design_system_init.py','scripts/score_output.py',
    'README.md','agent.md'
]
required_skill = ['SKILL.md','references/00-operating-contract.md','references/01-mode-router.md','scripts/fable_init.py','scripts/fable_eval.py','scripts/fable_design_system_init.py']
errors = []
for rel in required_agent:
    if not (agent/rel).exists(): errors.append(f'missing agent/{rel}')
for rel in required_skill:
    if not (skill/rel).exists(): errors.append(f'missing skill/{rel}')
content = (skill/'SKILL.md').read_text(encoding='utf-8') if (skill/'SKILL.md').exists() else ''
if not content.startswith('---\n') or '\n---\n' not in content[4:]: errors.append('SKILL.md invalid frontmatter')
if len(content.splitlines()) > 500: errors.append(f'SKILL.md too long: {len(content.splitlines())} lines')
try:
    out = subprocess.run(['hermes','skills','list'], capture_output=True, text=True, timeout=20)
    if 'fable-system' not in (out.stdout + out.stderr): errors.append('hermes skills list does not show fable-system')
except Exception as e:
    errors.append(f'could not run hermes skills list: {e}')
if errors:
    print('Fable install verification FAILED')
    for e in errors: print('-', e)
    sys.exit(1)
print('Fable install verification PASSED')
print('agent_dir:', agent)
print('skill_dir:', skill)
print('skill_lines:', len(content.splitlines()))
