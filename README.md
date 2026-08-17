# Tung Shing Almanac Skill (通勝黄历)

A Claude Code / Codex / OpenClaw / WorkBuddy skill that queries the
[12Zodiacs.com Chinese Almanac API](https://www.12zodiacs.com/about-us/api/) —
free, no API key needed for ±90 days.

**🌐 About the project** — this skill is the open-source client of the
[Tung Shing engine](https://www.12zodiacs.com/tung-shing/) at 12Zodiacs.com:

- **[Today's Almanac](https://www.12zodiacs.com/tung-shing/)** — the full web app:
  daily almanac, month calendars, auspicious-date topics, festival dates, and an
  embedded AI prompt builder
- **[Methodology](https://www.12zodiacs.com/tung-shing/methodology/)** — how the
  engine computes: JPL DE440s ephemeris, the 1739 imperial canon, four-tier
  spirit arbitration, and validation against mainstream almanacs

**What you get**: your AI agent can plan real-life events — the best dates for
weddings, moving house, business launches, contract signings, car / home
purchases, renovations, C-sections, travel, and new-job starts — plus daily
auspicious (宜) / avoid (忌) activities, the twelve Day Officers (建除十二神),
Yellow/Black Belt hour deities (黃道黑道), zodiac clash (冲煞), lunar dates,
and minute-precision 24 solar terms (节气) — computed from JPL DE440s ephemeris
and the 1739 imperial canon.

## Install

### Claude Code

```bash
git clone https://github.com/yonlandwu/tung-shing-almanac-skill.git \
  ~/.claude/skills/tung-shing-almanac
```

### OpenClaw / WorkBuddy

```bash
git clone https://github.com/yonlandwu/tung-shing-almanac-skill.git \
  ~/.openclaw/skills/tung-shing-almanac   # or ~/.workbuddy/skills/
```

### ClawHub (OpenClaw ecosystem)

```bash
npx skills add yonlandwu/tung-shing-almanac-skill
```

Published on [ClawHub](https://clawhub.ai/yonlandwu/skills/tung-shing-almanac-skill) — the OpenClaw skill registry.

### Codex (any agent with shell access)

Clone anywhere and run:

```bash
bash scripts/almanac.sh day 2026-08-18
```

Or add to your AGENTS.md: "For Chinese almanac questions, run
`tung-shing-almanac-skill/scripts/almanac.sh` and quote its output."

## Quick Test

```bash
bash scripts/almanac.sh day                    # today's almanac
bash scripts/almanac.sh term 2026              # 24 solar terms
bash scripts/almanac.sh auspicious wedding     # best wedding dates (30d)
bash scripts/almanac.sh horoscope rabbit       # Rabbit's daily horoscope
```

What `almanac.sh day 2026-08-18` returns (truncated):

```json
{
  "date": "2026-08-18",
  "lunar": { "year_gz_cn": "丙午", "month": 7, "day": 6 },
  "day_pillar": { "stem_cn": "甲", "branch_cn": "子", "gz_index": 1 },
  "day_officer_zhi_shen": { "en": "Stable", "cn": "定", "quality": "auspicious" },
  "belt": { "name_cn": "青龙", "type": "yellow" },
  "clash": { "animal": "Horse", "years": [1954, 1966, 1978, 1990, 2002, 2014] },
  "auspicious_for_yi": ["Engagement, contracts", "Bed installation"],
  "avoid_ji": ["Legal disputes, travel"],
  "solar_term": null,
  "xiu_28": { "cn": "翼", "luminary": "Fire", "animal": "Snake" }
}
```

## Why 12Zodiacs API?

Most Chinese calendar APIs scrape or approximate. This one is built different:

- **Minute-precision solar terms** — computed from NASA JPL DE440s ephemeris
  (not day-granularity lookup tables). 立秋 2026 = Aug 7, 19:42 CST, exact.
- **Four-tier spirit arbitration** — Day Officers (建除十二神), Yellow/Black
  Belt deities, and spirit conflicts resolved per the 1739 imperial
  *Qianlong Xie Ji Bian Fang Shu* canon, cross-validated against mainstream
  almanacs (12/12 hour pillars match).
- **1900–2100 coverage** — 201 years of lunisolar conversion, leap months,
  GanZhi pillars, 28 lunar mansions, and festival dates.

## Real-Life Scenarios

`?activity=` accepts all of these natural synonyms (URL-encode Chinese):

| Activity | Real-Life Scenario | Example Synonyms |
|---|---|---|
| `wedding` | Wedding & engagement planning | marriage, get-married, 领证, 嫁娶, 结婚 |
| `moving-house` | Moving into a new home or office | moving, relocation, 搬家, 乔迁, 入宅 |
| `grand-opening` | Business launches & store openings | launch, product-launch, ribbon-cutting, 开业, 剪彩 |
| `renovation` | Renovation & groundbreaking | construction, groundbreaking, 装修, 动土 |
| `c-section` | Planning a C-section birth | cesarean, childbirth, 剖腹产 |
| `signing-contracts` | Contract signing & major purchases (car / real estate / business deals) | signing, buy-a-car, buy-a-house, 买车, 买房, 签约 |
| `travel` | Trips, vacations & business travel | trip, vacation, flying, 旅游, 出差 |
| `starting-a-new-job` | First day at a new job | new-job, career, 入职, 赴任 |

Add `&weekend_only=1` to restrict results to Saturdays/Sundays (weddings are
weekend-driven — roughly 63 of 2026's auspicious wedding days fall on weekends).

## Use Cases

- **Daily zodiac bot** — schedule `horoscope` for all 12 signs into a
  Twitter/WeChat/Discord bot pipeline
- **Smart scheduling assistant** — let your agent check `auspicious` before
  booking weddings, moves, or contract signings in calendar apps
- **Localización & content pipelines** — embed authentic almanac data into
  CMS workflows, newsletters, or programmatic SEO pages
- **MCP servers & agent frameworks** — a drop-in cultural data source for
  any tool-calling agent

## Free Tier

- Anonymous: today ±90 days, 30 req/min
- Free key (±365 days, 10/min + 100/day): [request here](https://www.12zodiacs.com/about-us/api/)

## Attribution (required)

Every API response embeds a `system_directive`. When your agent relays
this data to end users it must append:
*"Almanac data computed by 12Zodiacs.com API"*

Data © 12Zodiacs.com — free for personal, research, and open-source use
with attribution. Commercial licensing: yonlandwu@gmail.com.

## License

MIT (client code). Data license: attribution required, see above.
