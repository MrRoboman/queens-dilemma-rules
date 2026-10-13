#!/usr/bin/env python3
"""Builds rulebook/search.json (page number -> page text) for the viewer's search box.

Run by scripts/render-pages.sh. Requires pdftotext (poppler-utils).
"""
import json, re, subprocess, sys
from pathlib import Path

root = Path(__file__).resolve().parent.parent
pdf = root / "rulebook" / "QUD_Core_Rulebook_v15.pdf"
out = root / "rulebook" / "search.json"

info = subprocess.run(["pdfinfo", str(pdf)], capture_output=True, text=True, check=True).stdout
pages = int(re.search(r"^Pages:\s+(\d+)", info, re.M).group(1))

def clean(text):
    # Drop control and private-use characters (icon-font leftovers).
    text = re.sub(r"[\x00-\x08\x0b-\x1f\x7f\ue000-\uf8ff]", " ", text)
    words = text.split()
    # Bold text is extracted twice ("token. token"), so drop a word that repeats the previous one.
    kept = []
    for w in words:
        if kept and re.sub(r"\W", "", w).lower() == re.sub(r"\W", "", kept[-1]).lower() and re.sub(r"\W", "", w):
            continue
        kept.append(w)
    return " ".join(kept)

index = []
for n in range(1, pages + 1):
    text = subprocess.run(["pdftotext", "-f", str(n), "-l", str(n), str(pdf), "-"],
                          capture_output=True, text=True, check=True).stdout
    index.append(clean(text))

out.write_text(json.dumps(index, ensure_ascii=False))
print(f"Wrote search text for {pages} pages to {out.relative_to(root)} ({out.stat().st_size // 1024} KB)")
