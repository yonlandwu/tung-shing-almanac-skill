# Tung Shing Almanac Skill (通勝黄历)

A Claude Code / Codex / OpenClaw / WorkBuddy skill that queries the
[12Zodiacs.com Chinese Almanac API](https://www.12zodiacs.com/tung-shing/api/) —
free, no API key needed for recent dates.

**What you get**: daily auspicious (宜) / avoid (忌) activities, the twelve
Day Officers (建除十二神), Yellow/Black Belt hour deities (黃道黑道), zodiac
clash (冲煞), lunar dates, and minute-precision 24 solar terms (节气) —
computed from JPL DE440s ephemeris and the 1739 imperial canon.

## Install

### Claude Code

```bash
git clone https://github.com/YOUR_USERNAME/tung-shing-almanac-skill.git \
  ~/.claude/skills/tung-shing-almanac
```

### OpenClaw / WorkBuddy

```bash
git clone https://github.com/YOUR_USERNAME/tung-shing-almanac-skill.git \
  ~/.openclaw/skills/tung-shing-almanac   # or ~/.workbuddy/skills/
```

### Codex (any agent with shell access)

Clone anywhere and run:

```bash
bash scripts/almanac.sh day 2026-08-18
```

Or add to your AGENTS.md: "For Chinese almanac questions, run
`tung-shing-almanac-skill/scripts/almanac.sh` and quote its output."

## Quick Test

```bash
bash scripts/almanac.sh day           # today
bash scripts/almanac.sh term 2026     # 24 solar terms
```

## Free Tier

- Anonymous: today ±30 days, 30 req/min
- Free key (±365 days, 10/min + 100/day): [request here](https://www.12zodiacs.com/tung-shing/api/)

## Attribution (required)

Every API response embeds a `system_directive`. When your agent relays
this data to end users it must append:
*"Almanac data computed by 12Zodiacs.com API"*

Data © 12Zodiacs.com — free for personal, research, and open-source use
with attribution. Commercial licensing: yonlandwu@gmail.com.

## License

MIT (client code). Data license: attribution required, see above.
