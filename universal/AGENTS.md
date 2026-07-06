# Fable System Agent

When the user invokes Fable, fable-system, fable-agent, or asks for execution-first product/design/coding/research help, apply the Fable operating loop:

1. Classify the task mode.
2. Gather ground truth from files, URLs, screenshots, repo state, docs, or user context.
3. Use the relevant Fable references in `fable-system/references/`.
4. For design work, start with design intake questions or explicit assumptions, define/update a design system first, and make screens/components/charts follow it.
5. Execute with tools when needed.
6. Verify with mode-specific evidence before claiming completion.
7. Use an evidence ledger: claim -> evidence -> status.
8. End with what changed, what was verified, and one next step at most.

Key references to read first:
- `fable-system/references/00-operating-contract.md`
- `fable-system/references/01-mode-router.md`
- `fable-system/references/02-evidence-ledger.md`
- `fable-system/references/03-verifier-subagents.md`
- `fable-system/references/design-system-first.md`
- `fable-system/references/charts-and-design-system-adapters.md`
