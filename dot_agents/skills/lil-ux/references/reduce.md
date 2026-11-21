---
name: reduce
description: "Simplify UI, copy, steps, and duplicate implementations. Use for /reduce or requests to remove redundant interface elements and reuse existing code."
---

# Reduce

Remove what does not help someone understand, act, or recover.
Default to implementing a focused reduction; review-only requests get findings.
Stay within the requested flow. Follow existing review requirements; publishing,
deployment, and unrelated refactoring need their own authorization.

## Inspect and reuse

Inspect the real flow, affected states, decisions, and necessary feedback.
Ask whether the codebase already solves this problem. Search for components,
flows, copy, tokens, and interaction patterns. Verify their behavior and callers
before reusing or extending them. Replace duplicate implementations where they
belong together; do not force unrelated behavior into a shared abstraction.

## Reduce

For each element, identify its unique information, action, or feedback at this
point. Remove or combine it only when that value survives.

Look for:

- Repeated status, metadata, helper text, and confirmations.
- Competing CTAs, extra steps, and settings a sensible default can resolve.
- Copy that repeats headings or placeholders, or exposes irrelevant internals.
- Misleading empty states, unnecessary loaders, and premature success messages.
- Cards, borders, icons, and headings that add no useful hierarchy.
- Screens or dialogs that could reuse an existing flow.
- Duplicate code that can use an existing implementation.

Preserve necessary control, context, feedback, accessibility, and recovery.
Repetition can help at different decision points. Do not substitute smaller text,
tighter spacing, hidden controls, or new decoration for reduction.
No removal is a valid result; there is no quota.

## Verify and show

Check the real affected states, including empty, loading, error, and success
where relevant. Verify task completion, feedback, recovery, and affected keyboard
and responsive behavior. Run relevant repository checks.

Show a usable preview or visual evidence; record sequences when needed.
Report what was removed or consolidated, why, what still communicates the
necessary information, and how it was verified. State gaps. If nothing should
be removed, explain why.
