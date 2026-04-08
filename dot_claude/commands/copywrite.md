# Copywriting Audit

Audit user-facing copy in the current diff or specified files. Flag jargon, unclear errors, and tone violations.

## How to run

1. **Get the diff** — run `git diff` (staged + unstaged) or read the files the user specifies
2. **Scan every string** that a user could see: UI text, error messages, button labels, empty states, tooltips, toasts, aria-labels
3. **Check against every rule below** — flag violations with severity, file, line, and fix
4. **Output the audit** using the format at the bottom

---

## Voice

Direct, helpful, specific. Write like you're explaining to a friend who's new to crypto but not stupid.

- **Use contractions** — "can't", "doesn't", "you're" (not "cannot", "does not")
- **Use "you" and "your"** — address the user directly
- **Active voice** — "Your wallet doesn't have enough" not "Insufficient funds were detected"
- **No hedging** — "Something went wrong" not "It appears there may have been an issue"
- **No exclamation marks in errors** — "Success!" is fine for confirmations, not for problems

## Spelling

- **"onchain"** — one word, no hyphen. Never "on-chain" or "on chain".

## Jargon Map

Flag these terms in user-facing text. Replace with the plain alternative.

### Common (cross-chain)

| Technical term         | Plain alternative                         | Notes                                                                       |
| ---------------------- | ----------------------------------------- | --------------------------------------------------------------------------- |
| Liquidity pool         | "market"                                  |                                                                             |
| Bonding curve          | omit or "market"                          | Implementation detail                                                       |
| Slippage / slippage exceeded | "Price changed too much"            |                                                                             |
| RPC / RPC error        | "Can't connect" or "Something went wrong" | Internal infrastructure                                                     |
| On-chain / on chain    | "onchain" (if needed) or omit             | Always one word, no hyphen. Omit when possible — everything here is onchain |
| Transaction simulation | "Something went wrong before sending"     | Never expose simulation concept                                             |
| Signature (tx)         | omit                                      | Internal concept                                                            |
| Decimals (token)       | omit                                      | Internal                                                                    |

### Solana-specific

| Technical term         | Plain alternative                         | Notes                                    |
| ---------------------- | ----------------------------------------- | ---------------------------------------- |
| Lamports               | "SOL"                                     | Always convert to SOL for display        |
| Insufficient lamports  | "Not enough SOL in your wallet"           | Never mention lamports                   |
| Mint / mint address    | "token" or "market"                       | "Mint" is Solana jargon                  |
| Blockhash expired      | "Transaction expired"                     |                                          |
| Program error          | "Something went wrong"                    | Never expose Solana program errors       |

### Ethereum / Base-specific

| Technical term         | Plain alternative                         | Notes                                          |
| ---------------------- | ----------------------------------------- | ---------------------------------------------- |
| Gas / gas fee          | "fee"                                     | Just "fee" — users don't need to know mechanics |
| Wei / gwei             | omit (show ETH or currency)               | Always convert to human-readable units         |
| Revert / reverted      | "Something went wrong"                    | Never expose EVM revert reasons directly       |
| Nonce                  | omit                                      | Internal concept                               |
| Contract address       | "token" or "address"                      | Use "token" for token contracts, "address" otherwise |

### Acceptable terms

These are understood by the target audience — no need to flag:

- Token/currency names (SOL, ETH, USDC, ZORA, etc.)
- Wallet, balance, deposit, withdraw
- Trade, buy, sell
- Fee (not "gas fee")
- Market

## Error Copy Pattern

Errors use a three-part structure:

```
message:     Short statement (what happened)
description: One sentence (why it happened)
action:      Clear next step (what to do)
```

Examples:

| Raw error                   | message                        | description                                                                         | action                                    |
| --------------------------- | ------------------------------ | ----------------------------------------------------------------------------------- | ----------------------------------------- |
| Insufficient funds          | "Not enough funds to cover fees" | "Your wallet needs a small amount to cover fees."                                 | "Deposit funds and try again."            |
| Transaction expired         | "Transaction expired"          | "The transaction took too long and the network moved on."                           | "Please try again."                       |
| Slippage exceeded           | "Price changed too much"       | "The price changed between when you submitted and when it would have gone through." | "Try again — the price may have settled." |
| Generic failure             | "Something went wrong"         | "We couldn't complete your transaction."                                            | "Please try again."                       |

Rules:

- **Never show raw error strings to users** — always map through an error handler
- **Action must be actionable** — "Please try again" is fine, "An error occurred" is not
- **Use em-dash for asides** — "Try again — the price may have settled"
- **Severity affects tone** — errors are direct, warnings are reassuring, info is neutral

## Button & CTA Labels

### Authentication

- **"Sign In"** — standard auth CTA (not "Connect", "Log In", or "Connect Wallet")
- **"Sign In to [Action]"** — contextual variants are fine
- **"Sign Out"** — not "Disconnect" or "Log Out"

### Trading

- **"Buy"** / **"Sell"** — verb only, no noun ("Buy" not "Buy Token")

### Wallet

- **"Deposit"** / **"Withdraw"** — standard financial terms
- **"Send"** — for the final confirm step

### Progressive states

Use present participle for in-progress actions:

- "Confirming..." / "Sending..." / "Finalizing..."

Don't mix imperative and progressive: "Sign in wallet..." should be "Confirming in wallet..."

## Empty States

Two patterns, used for different contexts:

| Context                             | Pattern      | Example                                   |
| ----------------------------------- | ------------ | ----------------------------------------- |
| User-owned data (will appear later) | "No X yet"   | "No positions yet", "No transactions yet" |
| Search / query results              | "No X found" | "No results found", "No markets found"    |

Include a helpful sub-line when the user can take action:

```
"No positions yet"
"Deposit funds to get started"    ← helpful guidance
```

Without guidance is a violation.

## Quick Reference

| Issue                                    | Severity | Fix                                             |
| ---------------------------------------- | -------- | ----------------------------------------------- |
| Crypto jargon in user-facing text        | SERIOUS  | Replace with plain alternative (see Jargon Map) |
| Raw error string shown to user           | SERIOUS  | Map through error handler                       |
| Error without actionable next step       | SERIOUS  | Add action text ("Try again", "Deposit", etc.)  |
| "on-chain" or "on chain" spelling        | SERIOUS  | Use "onchain" (one word, no hyphen)             |
| "Connect Wallet" or "Log In"             | MODERATE | Use "Sign In"                                   |
| "Gas fee" in non-Ethereum context        | MODERATE | Use "fee"                                       |
| Empty state without guidance sub-line    | MODERATE | Add helpful context for what to do next         |
| Hedging language in errors               | MODERATE | Be direct — state what happened                 |
| Passive voice in user-facing text        | MODERATE | Rewrite in active voice                         |

---

## Output Format

For each violation:

```
SERIOUS: Crypto jargon "mint address" in user-facing text
  File: components/TokenCard.tsx:42
  Fix: Replace "mint address" with "token"
```

End every audit with:

```
## Copywriting Audit Summary
- **SERIOUS:** N (jargon: X, errors: Y, ...)
- **MODERATE:** N (labels: X, empty-states: Y, ...)
- **Total:** N violations across M files
```

Omit severity lines with 0 violations. If the diff is clean:

```
## Copywriting Audit Summary
No violations found.
```
