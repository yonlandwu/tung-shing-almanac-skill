#!/usr/bin/env bash
# Tung Shing Almanac API client (12Zodiacs.com)
# Usage: almanac.sh {day|hours|term} [date_or_year] [api_key]
set -euo pipefail
API="https://12zodiacs.com/wp-json/12z/v1/almanac"
CMD="${1:-day}"
ARG="${2:-}"
KEY="${3:-}"
KEY_Q=""
[ -n "$KEY" ] && KEY_Q="&key=$KEY"

case "$CMD" in
  day)
    DATE_Q=""
    [ -n "$ARG" ] && DATE_Q="date=$ARG"
    curl -s "${API}/day?${DATE_Q}${KEY_Q}" | jq .
    ;;
  hours)
    : "${ARG:?usage: almanac.sh hours YYYY-MM-DD}"
    curl -s "${API}/hours?date=${ARG}${KEY_Q}" | jq .
    ;;
  term)
    : "${ARG:?usage: almanac.sh term YYYY}"
    curl -s "${API}/term?year=${ARG}${KEY_Q}" | jq .
    ;;
  *)
    echo "usage: almanac.sh {day|hours|term} [date_or_year] [api_key]" >&2
    exit 1
    ;;
esac
