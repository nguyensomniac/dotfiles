# Frontend Style

## Primitives over ad-hoc
If 2+ files need the same pattern, extract a shared component. But keep it composable — a standalone animated icon (drops into any layout) over a full button wrapper (forces its own structure). Don't abstract prematurely; wait until the pattern repeats.

## One canonical formatter
Never duplicate formatting logic. If a shared formatter exists, use it. If it doesn't exist yet, create one in a shared location and delete the inline version.

## Semantic tokens, not hardcoded values
Use design tokens for colors, spacing, and typography — not raw hex or arbitrary values. One change should propagate everywhere.

## Plain language in UI copy
Write for someone who understands the domain but not the implementation. No internal jargon, no raw error strings. Error messages need a clear next step.

## Iterate in code, not in mockups
Design decisions surface in real rendering — translated text overflow, dark mode contrast, animation timing at small sizes. Work with the designer watching the browser.
