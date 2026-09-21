# Matchwork Roofing — Website Build-Out (Staging)

Expanded staging version of **matchworkroofing.com**, built for review before anything touches the live site.

**Staging preview:** https://jpeplinski33.github.io/matchworkroofing-site/
**Production:** https://matchworkroofing.com/ (untouched)

## What's in here

All 13 live pages rebuilt, plus 12 new pages (25 total):

| Area | Pages |
|---|---|
| Conversion | `estimate/` (real quote-request form), `estimate/thanks.html` |
| Proof | `projects/` (photo gallery), `about/` |
| New services | `services/siding.html`, `services/gutters.html`, `services/chimney-masonry.html` |
| Locations | 5 existing suburbs expanded (600–900 words + FAQ + schema each), **3 new**: Bexley, Grandview Heights, Worthington |
| New guides | `blog/roof-replacement-cost-columbus.html`, `blog/insurance-shingle-matching-ohio.html` |
| Sitewide | OG/Twitter share tags + branded `og-image.png`, FAQPage/Service/Article schema, GA4 snippet, updated sitemap, unified header/footer with all pages linked |

## ⚠️ Before going live — 3 small setup steps

1. **Confirm the estimate form.** The form emails submissions via formsubmit.co to
   `info@matchworkroofing.com`. The **first** submission triggers a one-time confirmation email to that
   address — click the link in it once, and every submission after that delivers normally.
2. **Add your GA4 Measurement ID.** Search any page for `G-XXXXXXXXXX` (2 spots per page) and replace with
   your real ID. Until then analytics is inert.
3. **Swap placeholder photos for real ones.** The 6 images in `assets/img/` are AI-generated stand-ins so you
   can review the design. Replace them with real Matchwork job photos per `PHOTOS-NEEDED.md` — same
   filenames, done. HTML comments on each image mark them as placeholders.

Optional but recommended: add founder photo/bio on `about/`, and CertainTeed credential badge once confirmed
(there's a `TODO(Jordan)` comment in `about/index.html`).

## Deploying to production

```bash
./deploy.sh
```

This creates `dist-prod/` — a production-ready copy with the two staging-only tweaks removed
(`<base href>` pointed at root, `noindex` meta stripped, live `robots.txt` restored). Upload the
**contents** of `dist-prod/` to the live host (the same place the current site files live). Nothing else
changes — same stack, same file layout, just more pages.

## How this repo was built

`build.py` (in the parent project workspace, see `PLAYBOOK.md`/`HANDOFF.md` there) generates these files
from a mirror of the live site. The repo is pure static HTML/CSS — no build step needed to host it.
