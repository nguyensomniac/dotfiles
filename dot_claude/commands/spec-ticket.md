The user has provided a short task description as the argument: "$ARGUMENTS"

Use this description plus the current conversation context and codebase to build a full ticket spec. Read relevant code, understand the current state of things, and flesh out the task into a well-structured spec:

## Spec format

**Title:** A concise, actionable title (under 80 chars)

**Problem**
What's broken, missing, or needed. Be specific about the current behavior vs expected behavior, or the gap that exists.

**Approach**
Proposed solution or direction. Include enough detail that someone picking this up knows where to start, but don't over-prescribe implementation details.

**Acceptance Criteria**
A checklist of concrete conditions that must be true for this to be considered done. Each item should be independently verifiable.

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] ...

**Edge Cases & Considerations**
Gotchas, risks, open questions, or things to watch out for. Include anything that might trip someone up or require a decision during implementation.

---

## Workflow

1. Draft the full spec and present it to the user for review
2. Ask if they want to adjust anything — iterate until they're happy
3. Once approved, use `mcp__linear-server__list_teams` to show available teams and ask which one to file under
4. Ask about priority (1=Urgent, 2=High, 3=Normal, 4=Low) — default to Normal if they don't care
5. Create the issue in Linear using `mcp__linear-server__save_issue` with:
   - `title`: the ticket title
   - `team`: the selected team
   - `description`: the full spec in markdown (Problem, Approach, AC, Edge Cases sections)
   - `priority`: the selected priority
6. After creation, output the Linear issue URL from the response
7. Ask if they want to set a project, labels, or assignee on the issue

Keep the tone clear and direct. Write for someone who understands the domain but wasn't in the room when this was discussed.
