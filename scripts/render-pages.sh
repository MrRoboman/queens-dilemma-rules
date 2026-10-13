#!/usr/bin/env bash
# Pre-renders every rulebook page to rulebook/pages/N.jpg for the web viewer (index.html).
# Re-run this if the rulebook PDF is replaced, then update PAGE_COUNT in index.html if the page count changed.
# Requires pdftoppm (poppler-utils).
set -euo pipefail
cd "$(dirname "$0")/.."

PDF=rulebook/QUD_Core_Rulebook_v15.pdf
OUT=rulebook/pages
WIDTH=1600   # pixels; sharp on phones and laptops, ~300-500 KB per page

rm -rf "$OUT" && mkdir -p "$OUT"
pdftoppm -jpeg -jpegopt quality=80,progressive=y -scale-to-x "$WIDTH" -scale-to-y -1 "$PDF" "$OUT/tmp"
for f in "$OUT"/tmp-*.jpg; do
  n=$(basename "$f" .jpg); n=${n#tmp-}; n=$((10#$n))
  mv "$f" "$OUT/$n.jpg"
done
echo "Rendered $(ls "$OUT" | wc -l) pages to $OUT ($(du -sh "$OUT" | cut -f1))"
