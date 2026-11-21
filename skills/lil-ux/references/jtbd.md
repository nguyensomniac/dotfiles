---
name: jtbd
description: "Decide a screen's simplest useful flow, priority, and meaningful states before implementation. Use for /jtbd or requests to clarify a screen's job and hierarchy. Outputs a concise decision brief."
---

# JTBD

Decide what the screen should contain and prioritize.

## Ground the decisions

Use the request and available product evidence. Inspect the current flow and
trace actions in code. Establish what brought the person here and what outcome
they need. Separate their goal from the mechanism that currently serves it.
Distinguish observations, proposals, and assumptions; do not invent research.

Inspect existing flows, components, copy, tokens, and interaction patterns before
claiming they can be reused. Preserve explicit user choices and stay in scope.

## Make three judgments

1. Simplify the activity. Find the shortest useful path to the outcome. Decide
   which screens, steps, and decisions are necessary, which can disappear, and
   which can reuse an existing flow. Preserve necessary control and recovery.
2. Prioritize the experience. Decide what someone should see or do first to get
   value. Allocate space and prominence accordingly. Identify what competes
   with that activity and should move, recede, or disappear.
3. Choose meaningful states. Keep distinctions that change what someone can do
   or needs to know about the outcome. Decide where each belongs and how it
   changes the available action. Internal events do not automatically deserve
   separate UI. Preserve useful progress, uncertainty, and recovery information.

Express these decisions through the flow, layout, and available actions.
Add explanatory copy only when those are insufficient. Do not turn each
judgment or backend state into another visible heading, badge, or instruction.

## Deliver the decision brief

Return a short inline brief:

- **Activity:** The goal and simplest useful path; what steps disappear or reuse
  an existing flow.
- **Priority:** What comes first, what competes with it, and the resulting
  hierarchy or layout decision.
- **States:** Which distinctions matter, where they appear, and what actions
  they enable. Group states that mean the same thing to the person.

Make each field a concrete implementation decision, not a description or slogan.
Include starting point, observable success, reuse evidence, or an open question
only when needed to justify a decision. Mark assumptions where they occur.
If the current design already works, name what should stay.

## Implementation boundary

/jtbd alone produces the brief. If implementation is also requested, show it
and proceed when the job is clear. Ask one focused question when competing
interpretations produce materially different flows; wait on dependent work.
Do not add an approval ceremony or silently change UI while explaining it.
Answer questions about current behavior before proposing changes.
