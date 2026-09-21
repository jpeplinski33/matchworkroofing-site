#!/usr/bin/env bash
# Matchwork Roofing — production deploy build.
# Creates dist-prod/ = this repo with the two staging-only tweaks removed:
#   1. <base href="/matchworkroofing-site/">  ->  <base href="/">
#   2. staging noindex meta line removed
# Then upload the CONTENTS of dist-prod/ to the live host. Done.
set -euo pipefail
cd "$(dirname "$0")"

rm -rf dist-prod
mkdir dist-prod
rsync -a --exclude '.git' --exclude '.DS_Store' --exclude 'dist-prod' ./ dist-prod/

find dist-prod -name '*.html' -exec sed -i '' \
  -e 's|<base href="/matchworkroofing-site/"/>|<base href="/"/>|' \
  -e '/STAGING-ONLY: deploy.sh removes this line/d' {} +

printf 'User-agent: *\nAllow: /\n\nSitemap: https://matchworkroofing.com/sitemap.xml\n' > dist-prod/robots.txt

echo ""
echo "Production build ready: dist-prod/"
grep -c 'noindex' dist-prod/index.html >/dev/null 2>&1 && echo "WARNING: noindex still present!" || echo "✓ noindex stripped"
grep -q '<base href="/"/>' dist-prod/index.html && echo "✓ base href set to root" || echo "WARNING: base href not swapped"
echo ""
echo "Next: upload the CONTENTS of dist-prod/ to the live host (same place the current site files live)."
echo "Remember: 1) confirm the formsubmit.co email once, 2) add your GA4 ID, 3) swap in real photos."
