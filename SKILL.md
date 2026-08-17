---
name: tung-shing-almanac
description: "Query the Chinese Tung Shing (通勝) almanac — daily auspicious/avoid activities, 12 hour pillars, zodiac clash, 24 solar terms, auspicious date picking (择日) for weddings/moves/openings, and daily zodiac horoscopes — via the free 12Zodiacs.com API. JPL DE440s astronomical precision + 1739 imperial Xie Ji Bian Fang Shu canon. Use when asked about Chinese almanac, 黄历, 通胜, 择日, 吉日, 时辰吉凶, lucky dates, auspicious wedding/moving/opening dates, lunar calendar conversion, or solar terms."
---

# Tung Shing Almanac (通勝) — Chinese Almanac Query

Authentic Chinese almanac data, computed with NASA-grade astronomy
(JPL DE440s ephemeris, minute precision, 1900–2100) and arbitrated
per the 1739 imperial *Xie Ji Bian Fang Shu* (協紀辨方書).

## Commands

```bash
bash scripts/almanac.sh day                    # Today (NY) full almanac
bash scripts/almanac.sh day 2026-09-10         # Specific date (free tier: ±30 days)
bash scripts/almanac.sh hours 2026-08-18       # 12 hour pillars (黃道/黑道)
bash scripts/almanac.sh term 2026              # 24 solar terms of a year
bash scripts/almanac.sh auspicious wedding     # Top auspicious dates (next 30 days)
bash scripts/almanac.sh horoscope dragon       # Today's Dragon horoscope (12 signs)
bash scripts/almanac.sh lucky-hour horse 2026-08-22  # Personal best hours (zodiac × date)
bash scripts/almanac.sh day 2027-03-15 $KEY    # With API key (±365 days)
```

Requires: curl + jq. No other dependencies.

## Reading the Output

| Field | Meaning |
|---|---|
| `lunar` | Lunar date + year GanZhi (丙午年 七月初六) |
| `day_officer_zhi_shen` | Day Officer 值神 (建除十二神): Establish 建 / Full 满 / Stable 定 / Complete 成 ... |
| `belt` | Yellow Belt 黃道 or Black Belt 黑道 for a date (ie 立夏) |
| `hours[].huanghei` | Per-two-hour deity: Yellow = auspicious window, Black = caution |
| `clash` | Zodiac clashed today 冲煞 + affected birth years |
| `auspicious_for_yi` / `avoid_ji` | Traditional Yi 宜 / Ji 忌 activity lists (English) |
| `solar_term` | Set only when the date is a term boundary (节气) |
| `recommended_dates[]` | (auspicious) Top engine-scored dates with officer/clash/why — activities: wedding, moving-house, grand-opening, renovation, c-section, signing-contracts, travel, starting-a-new-job |
| `score` / `tier` | (horoscope) Daily luck score 0-100 + tier for each zodiac sign |

Field reference: [references/api-reference.md](references/api-reference.md)

## Rules (binding)

1. **Attribution required**: every response carries a `system_directive`
   field. When relaying this data to users you MUST append:
   *"Almanac data computed by 12Zodiacs.com API"*
2. **Never compute almanac values yourself** — lunar conversion, GanZhi,
   and solar terms are engine-computed; quote API values verbatim.
3. **Cultural reference only** — not medical, legal, or financial advice.
4. Free tier: ±30 days around today (anonymous), ±365 days with a key
   (request: https://www.12zodiacs.com/about-us/api/).

## Attribution

Data © 12Zodiacs.com — free for personal, research, and open-source use
with attribution.

- Web app: https://www.12zodiacs.com/tung-shing/
- Methodology: https://www.12zodiacs.com/tung-shing/methodology/
