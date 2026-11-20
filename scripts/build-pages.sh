#!/usr/bin/env bash
# Builds the GitHub Pages version of the site into _site/.
# The site is one index.html with clean URLs (/designos, /about …).
# GitHub Pages has no rewrites, so each address gets its own copy of index.html.
set -euo pipefail

OUT="${1:-_site}"
rm -rf "$OUT"
mkdir -p "$OUT"

# Publish only the site files (not CLAUDE.md, DESIGN.md, FILE-MAP.txt, scripts).
cp index.html JiPark_Resume.pdf "$OUT"/
cp -R images pdfs "$OUT"/

# One folder per address: every WORK slug, plus about and contact.
slugs=$(grep -o 'slug:"[a-z0-9-]*"' index.html | sed 's/slug:"\(.*\)"/\1/')
for route in $slugs about contact; do
  mkdir -p "$OUT/$route"
  cp index.html "$OUT/$route/index.html"
done

# Unknown addresses load the site, which sends visitors to the home page.
cp index.html "$OUT/404.html"

echo "magicinkux.com" > "$OUT/CNAME"
touch "$OUT/.nojekyll"

echo "Built $OUT with routes: $slugs about contact"
