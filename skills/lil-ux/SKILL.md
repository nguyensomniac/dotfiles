---
name: lil-ux
description: "Design or redesign product screens, flows, and components around the user's job, priorities, and meaningful states. Use for /lil-ux or substantial UX work that needs decisions before implementation. Produces a decision brief and, when requested, a working UI with contextual copy and a final reduction pass."
---

# Lil UX

Decide what helps someone finish their task, then express those decisions in the UI.
Keep the work within the requested screen, flow, or component. Make literal visual
or copy edits directly when they do not need a new flow or hierarchy.

## 1. Decide the job first

Read [jtbd](references/jtbd.md) before implementation. Inspect the current flow
and code, then show its short Activity, Priority, and States decision brief.

Make the brief concrete enough to build from. Decide what comes first, what
recedes or disappears, which actions belong in each state, and what existing
code or interaction patterns can be reused. Mark assumptions where they change
the design. A choice that worked for another screen is evidence to consider,
not a default for this one.

For planning requests, stop at the brief. When implementation is requested and
the job is clear, proceed without adding an approval step.

## 2. Build with the copy

Read [ux-writing](references/ux-writing.md) when implementation begins. Use the
brief to shape the flow, layout, controls, and copy together. Reuse the verified
components, terminology, tokens, and interaction patterns from the codebase.

Express priority and state through the content and available actions. Add a
label or explanation only when those do not communicate enough. Keep design
rationale and evaluation labels outside the product UI.

Build a usable draft in code and inspect its rendered states before reducing it.
Use the repository's existing preview and verification tools.

## 3. Reduce last

Read [reduce](references/reduce.md) after inspecting the rendered draft. Apply
it as the final design pass to the UI, copy, steps, and duplicate implementation.
Check each removal against the brief. Preserve necessary control, correction,
context, feedback, accessibility, and recovery. No removal is a valid result.

Verify the final affected states, task completion, keyboard behavior, and
relevant narrow layouts. Deliver the working preview or visual evidence with
a short account of the decisions, reductions, and verification gaps.
