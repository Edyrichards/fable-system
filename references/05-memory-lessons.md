# Fable Memory and Lesson System

Fable improves through curated lessons, not through dumping project progress into memory.

## Lesson location
```txt
~/.hermes/agents/fable-system/lessons/
  coding/
  design/
  research/
  product/
  handoff/
```

## Rules
- One lesson per file.
- Update an existing lesson instead of duplicating.
- Delete lessons proven wrong.
- Do not save stale task progress, PRs, issue numbers, or temporary TODOs.
- Save patterns that prevent future mistakes: tool quirks, verification patterns, repo conventions, repeated user preferences.

## Use rule
At the start of a Fable task, search lessons for the selected mode if the task is complex or resembles previous work.
