# CLAUDE.md — magicinkux.com portfolio

## Project
Personal UX portfolio for Ji Park, VP UX Product Design Lead (15+ years: JPMorgan Chase, Publicis Sapient, R/GA, MRM).
Goal: get hired into a senior/lead UX role. The site must show personality, craft and strategic thinking, and prove I design with AI.

## Audience
- Hiring managers and design directors scanning on their phones, often for under 60 seconds
- Recruiters who need role, level and contact info right away
- Design leaders who will go deep into one or two case studies

## How to work with me
- I'm a senior designer. Skip the basics and give me options with the trade-offs.
- Before large changes, propose a direction in 2–3 bullets and wait for my OK.
- Make one change at a time so I can review it. Don't redesign sections I didn't mention.
- If a request conflicts with DESIGN.md, say so before doing it.
- Never invent metrics, client names or quotes. Use [PLACEHOLDER] and flag it.

## Design system
For any task that touches UI, styling, motion, layout or copy tone:
1. Read DESIGN.md first.
2. Use only the tokens and patterns defined there.
3. If something new is needed, propose it as an addition to DESIGN.md. Don't hard-code it.

## Tech + hosting
- One static file: `index.html` (inline CSS + vanilla JS). No frameworks, no build step, no WordPress.
- Clean URLs: `/`, `/<project-slug>` (each WORK item has a `slug`), `/about`, `/contact`. `_redirects` (`/* /index.html 200`) sends every path to index.html; `<base href="/">` keeps relative asset paths working. Old `#work-N` links forward via the `LEGACY` array; don't reorder it.
- Live on Netlify at magicinkux.com (domain at Porkbun). Clean URLs need Netlify's `_redirects`; on a host without redirects, only `/` works.
- Images live in `images/<project>/<project>-01.jpg` (loaded via the `imgs("slug", count)` helper); PDFs in `pdfs/`. Paths are relative, so the site works on any host. Update the count in WORK when adding images.
- Performance: aim for no image over 300KB when adding new ones (WebP preferred).
- Respect `prefers-reduced-motion` (already built in; keep it working).

## Content structure
- Content lives in the `ME`, `WORK` and `LINES` constants at the top of the script. Edit there first.
- Index: rotating "I'm Ji, a UX designer who…" headline, magic ink quote, 1.0 Selected work, 2.0 Archive.
- Selected work (full case studies): DesignOS (concept, first), Chase Core Card MVP, Chase OVD Wallet Evolution, Mercedes-Benz Inventory, Mercedes-Benz Build Your Own.
- Archive (images only): Pilot Flying J, Nike+ Fuel Apple Watch, Nike+ AR, Nike+ Connected Jersey, Nike+ Retail Touch Points.
- About and Contact views.

## Case study template
Full case studies use these WORK fields, in display order: ctx (context list) → lede → problem / goal / process → decisions → images → result → stats → learn, plus an optional pdf.
Keep each field short: 1–3 sentences, plain language. Stats are real, verified numbers only. Concept work (DesignOS) has no stats: goals go in the result text, labeled as goals.

## Writing voice
Confident, plain, specific. First person. No buzzwords ("synergy," "delightful," "seamless"). Show the decisions I made, not just the deliverables.

## Done checklist (run before calling any task complete)
- [ ] Follows DESIGN.md tokens (no stray colors, sizes or fonts)
- [ ] Every image and PDF path still resolves
- [ ] Works at 375px, 860px (the mobile breakpoint) and 1440px
- [ ] Color contrast passes WCAG AA
- [ ] Keyboard navigable, visible focus states
- [ ] Motion is disabled under reduced-motion
