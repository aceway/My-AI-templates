# CODEBASE_RISKS

This file tracks known bugs, high-risk areas, and unresolved engineering hazards.

Use concise entries with enough context for humans and AI to act safely.

## How to Use

- Add a new entry when a risk is discovered.
- Update status when mitigation is implemented or validated.
- Keep entries factual and code-aligned.
- Do not delete history silently; mark items as resolved instead.

## Entry Format

Use this structure for each risk item:

```text
## [RISK-<ID>] <Short Title>
- Discovered: <YYYY-MM-DD HH:MM TZ>
- Area: <module/path>
- Severity: <low|medium|high|critical>
- Status: <open|mitigating|blocked|resolved>
- Summary: <1-3 sentence description>
- Evidence: <file paths / commands / logs>
- Impact: <what can break and who is affected>
- Mitigation Plan: <next action>
- Owner: <person/role>
- Last Updated: <YYYY-MM-DD HH:MM TZ>
```

## Active Risks

## [RISK-001] <Example Risk Title>
- Discovered: <YYYY-MM-DD HH:MM TZ>
- Area: <module/path>
- Severity: high
- Status: open
- Summary: <Describe the risk and failure mode.>
- Evidence: <path/to/file>, <failing command>
- Impact: <User-facing or system impact>
- Mitigation Plan: <What to change next>
- Owner: <assignee>
- Last Updated: <YYYY-MM-DD HH:MM TZ>

## Resolved Risks

Move resolved items here instead of deleting them.
