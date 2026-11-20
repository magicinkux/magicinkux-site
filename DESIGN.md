---
name: magicinkux
version: 1.0
source: index.html ("Ji Park Magic Ink", live on magicinkux.com)
colors:
  bg: "#000000"
  fg: "#FFFFFF"
  dim: "#8A8A8A"
  faint: "#4A4A4A"
  rule: "#262626"
  placeholder: "#141414"
  spark: ["143,168,255", "127,224,212", "255,184,107", "229,156,255", "255,143,163"]
typography:
  family: "'Helvetica Neue', HelveticaNeue, 'Helvetica Neue LT Std', Helvetica, Arial, sans-serif"
  base: 14px / 1.4
  meta: 10px (11px on mobile)
  body-prose: 12px / 1.55 (14px on mobile)
  list: clamp(16px, 1.35vw, 19px) / 1.3
  h1: clamp(36px, 4.2vw, 58px) / 1.05, weight 400, tracking -0.015em
  h2: clamp(26px, 2.6vw, 36px) / 1.12, weight 400
  h3: clamp(18px, 1.5vw, 22px) / 1.15, weight 400
  stat: clamp(40px, 4.4vw, 64px) / 1, tracking -0.03em
  weights: [400, 700]
grid:
  desktop: { columns: 12, gutter: 20, max-width: 1400 }
  mobile: { breakpoint: 860, columns: 4, gutter: 12 }
  page-padding: max(16px, safe-area-inset)
radius: 0 (exceptions: live dot and stats dot are circles)
motion:
  easing: "cubic-bezier(.2,.7,.2,1)"
  rise: 0.9s, 14px, staggered 0.08s per block
  headline-rotate: every 3.4s
  breath: 1.5s opacity 1 → .57
  count-up: 1.3s, 0.16s stagger
---

# DESIGN.md: magicinkux.com

## Design intent
A portfolio built like the R/GA "Brand as Interface" deck. Every view is a "slide": a small metadata row at the top, regular-weight Helvetica headlines, and numbered contents lists on a strict Swiss grid, all on black.
The tone is editorial, calm and precise. Personality comes from motion (the living background, the rotating headline, the breathing hover) and from the writing, never from decoration.

## Color
- Strictly black and white plus greys. **There is no accent color in the UI.**
- **fg #FFFFFF**: headlines, body, active nav.
- **dim #8A8A8A**: inactive nav, the fixed half of the headline, decision numbers, stat labels, copyright.
- **faint #4A4A4A**: the Archive list and its label, which should feel quieter than Selected work.
- **rule #262626**: 1px dividers between key decisions and under the mobile header.
- **placeholder #141414**: image backgrounds and the fallback when an image fails to load.
- **Spark colors** (soft blue, teal, orange, violet, pink) appear ONLY in the background canvas as brief glows on individual nodes. Never use them for text, buttons or UI.

## Typography
- One family, Helvetica Neue. No second typeface.
- Headlines are always weight 400 (regular), never bold. Hierarchy comes from size and space.
- Bold (700) is only for the name in the nav, employer names in Experience, and stat labels.
- Metadata and column labels are tiny (10px). The contrast between tiny labels and large headlines is the signature look.
- Numbers use tabular figures (`font-variant-numeric: tabular-nums`): list numbers, years, the clock, page numbers, stats.
- Use `text-wrap: balance` on headlines. Flush-left, never centered, except the stats row.

## Layout
- A 12-column grid on desktop; 4 columns below 860px.
- Standard placement: the label column is columns 3–4 (`.col-l`, 10px labels like "Context", "Story", "Key decisions"), and content is columns 5–12 (`.col-main`).
- The left nav (columns 1–2) is sticky: name in bold 10px, then Work / About / Contact at 16px. The active page is white with a leading em dash; inactive is dim.
- The metadata row at the top of every view shows section/subsection (cols 5–8), a pulsing live dot with "New York" and the live clock (cols 9–11), and the page number (col 12).
- Generous vertical rhythm: 40px between related blocks, 72–96px between sections. The body starts at clamp(64px, 12vh, 140px) from the top.
- Mobile (≤860px): the nav becomes a sticky top bar with an 82% black blurred background, a back chevron on inner pages, and nav links in a row. The metadata row is hidden. Everything stacks into the 4 columns.

## Views
- **Index**: rotating headline ("I'm Ji, a UX designer who" in dim + a rotating line in white), a 16px dash, the Bret Victor "magic ink" quote at 10px, then Contents: "1.0 Selected work" and "2.0 Archive" (faint).
- **Case study** (in this order): number + title as h1 → Context list (year, client, role, team, methods, PDF link) → full-width cover image → Story (lede as h2) → three columns (The problem / The goal / The process) → numbered Key decisions → image gallery → Results paragraph → stats with a count-up animation → Key learning as h2 → footer with Back, Previous/Next and "01 / 09".
- Archive projects show only the context and images (no story, no stats).
- **About**: intent statement as h1, approach, Experience and Education as two-column fact lists (dates | role, **Employer**).
- **Contact**: "Let's grab a virtual coffee." as h1, then Direct (email, phone, resume) and Elsewhere (LinkedIn, Strava).

## Components
- **Contents row**: a grid of number (2.2em) | title | type (7em) | year (3.5em). The type column is hidden on mobile. Viewed projects get a 1px line-through (saved per visitor in the browser).
- **Key decisions**: a numbered list (01, 02…) in dim, each item with a 1px rule on top, max width 760px.
- **Stats**: a big number + bold dim label, centered, two grid columns each. The values count up from 0 when scrolled into view.
- **Links and buttons**: no underlines, no fills, no arrows animating. On hover or focus they "breathe" (opacity 1 → .57, 1.5s loop) and the cursor shows `progress`. Text links use "→" or "←" in the copy.
- **Focus**: a 1px white outline with a 4px offset.
- **Images**: full grid width, lazy-loaded, height auto. If one fails to load, swap in a #141414 box showing its alt text in dim 10px.

## Motion
- **Background**: a full-screen canvas of drifting dots (28–90 depending on screen size, about 12% of them larger) joined by hairlines when close (white, up to 20% opacity). Dots move away from the cursor, and occasionally one glows briefly in a spark color. It pauses when the tab is hidden.
- **Page entrance**: each block rises 14px and fades in, staggered by 0.08s.
- **Rotating headline**: lines cycle every 3.4s (the incoming line rises 18px, the outgoing line exits upward). It pauses on hover.
- **Live dot**: pulses (opacity 1 → .2, 2.4s). The stats dot beats (scale 1 → 1.6, 3.2s).
- **Reduced motion** (`prefers-reduced-motion: reduce`): the background is drawn once and frozen, with no entrance animation, no rotation and no count-up; hover becomes a static .57 opacity.

## Content and assets
- All case study content lives in the `WORK` array at the top of the script. Add or edit projects there, not in the markup.
- Images live in `images/<project>/<project>-NN.jpg` and PDFs in `pdfs/<project>-case-study.pdf` or `-wireframes.pdf`. Paths are relative.
- The resume is `JiPark_Resume.pdf`, next to `index.html`.

## Don'ts
- No accent color, gradients, shadows, rounded corners or cards.
- No bold headlines and no second typeface.
- No color outside the background sparks.
- Don't change the slide structure (nav, metadata row, label column / content column) without updating this file first.

## Embedded film (exception)
- The DesignOS case study opens with a looping, muted MP4 (`videos/designos-flow.mp4`) in place of its cover image: a requester types "@DesignOS I need a brochure for LUMA for my clients," and the film shows DesignOS building, checking and delivering it.
- It is product content shown in a frame, like an image, so it may use LUMA's colors and Inter. These never leak into the site's own UI.
- It sits in columns 3–12 on desktop and full width on mobile. Native controls let anyone pause it; under reduced motion it does not autoplay.
- Source: an HTML animation rendered frame by frame (ask the author for film.html); the DesignOS mark is an ink stroke, a nod to Magic Ink.
