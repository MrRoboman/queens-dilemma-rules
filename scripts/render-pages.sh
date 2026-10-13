#!/usr/bin/env bash
# Regenerates the web viewer's assets (index.html) from the rulebook PDF:
#   rulebook/pages/N.jpg  pre-rendered page images
#   rulebook/search.json  page text for the search box
# Re-run this if the rulebook PDF is replaced, then update PAGE_COUNT in index.html if the page count changed.
# Requires pdftoppm and pdftotext (poppler-utils) and python3.
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
python3 scripts/build-search-index.py
