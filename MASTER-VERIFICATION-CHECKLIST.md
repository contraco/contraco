# MASTER VERIFICATION & FIX CHECKLIST
## Complete Quality Control for All Contraco Domains

**Purpose:** ONE definitive document covering EVERY element that needs checking/fixing
**Domains:** contraco.com, contraco.net, contraco.de, contraco.kr, contraco.ru
**Status:** 🔴 COMPREHENSIVE QA IN PROGRESS

---

## 🎯 CRITICAL RULES

1. **Reference Site:** contraco.net is the MASTER - all others must match it exactly
2. **Zero Tolerance:** No visual differences allowed between domains (except language)
3. **Systematic:** Check EVERY file, EVERY element, EVERY detail
4. **Document Everything:** Record what's checked, what's broken, what's fixed

---

## 📊 VERIFICATION MATRIX

### File: organizational-design-ai.html

| Element | contraco.net (MASTER) | contraco.com | contraco.de | contraco.kr | contraco.ru |
|---------|---------------------|--------------|-------------|-------------|-------------|
| **Logo Size** | 58px | N/A | ? | ? | ? |
| **Logo Source** | contraco.net/Logo_rectangle.svg | N/A | contraco.net ✗ | contraco.net ✗ | contraco.net ✗ |
| **Bullets** | ✓ CORRECT circles | N/A | ✗ ARROWS | ✗ ARROWS | ? |
| **Numbered Circles** | ✓ Perfect circles | N/A | ✗ ELLIPSES | ? | ? |
| **Favicons** | ✓ Correct | ✓ | ✗ OLD | ✗ OLD | ✓ |
| **Google Analytics** | ✓ G-868WGCC45D | N/A | ? | ? | ? |
| **Brand Color** | #C00000 | N/A | ? | ? | ? |
| **Links (organizational)** | organizational-design-ai.html | N/A | organizational_design_ai ✗ | contraco-organizational ✗ | ? |

---

## 🔴 KNOWN ISSUES (User Reported)

### Issue 1: Bullets Showing as ARROWS
**Files:**
- contraco.de/organizational-design-ai.html ✗
- contraco.kr/organizational-design-ai.html ✗

**Expected:** Round bullet points (like contraco.net)
**Actual:** Arrow symbols showing instead

**Root Cause:** CSS difference - need to compare list-style CSS

**Fix Required:**
```
Find in contraco.net what CSS controls bullets
Copy exact CSS to contraco.de and contraco.kr
```

---

### Issue 2: Numbered Circles Showing as ELLIPSES
**Files:**
- contraco.de/organizational-design-ai.html ✗

**Expected:** Perfect circles (like contraco.net)
**Actual:** Ellipses (stretched circles)

**Root Cause:** Width ≠ Height or flex container distortion

**Fix Required:**
```
Ensure width = height
Add aspect-ratio: 1/1
Add flex-shrink: 0
```

---

### Issue 3: 404 Error - Wrong Filename
**URL:** https://www.contraco.net/organizational_design_ai.html

**Files with wrong links:**
- contraco.de/organizational-design-ai.html (3 instances with underscores)
- contraco.kr/organizational-design-ai.html (3 instances with wrong prefix)

**Fix Required:** Already documented in previous instructions

---

### Issue 4: Cross-Domain Logo Sources
**All international TLDs load from contraco.net**

**Files Affected:**
- contraco.de: 12+ files
- contraco.kr: 11 files
- contraco.ru: 14 files

**Fix Required:** Change to local domain logo sources

---

### Issue 5: Old Favicons
**Domains:**
- contraco.de ✗
- contraco.kr ✗

**Fix Required:** User copying correct favicons from contraco.net

---

## 📋 SYSTEMATIC FILE-BY-FILE CHECK

### Template for EACH file on EACH domain:

```
FILE: [filename].html
DOMAIN: [domain]
REFERENCE: contraco.net/[filename].html

□ Logo
  □ Size: 58px height
  □ Source: Uses own domain (not contraco.net)
  □ Fallback mechanism present
  □ Renders correctly (144x58px displayed)

□ Icons & Bullets
  □ Service icons: Consistent size (no 100% width/height styles)
  □ List bullets: Round circles (not arrows)
  □ Numbered circles: Perfect circles (not ellipses)
  □ All icons same visual size

□ Typography
  □ Font: Inter for body, Crimson Text for headings
  □ Font sizes match reference
  □ Line heights match reference
  □ No text overflow or truncation

□ Colors
  □ Primary red: #C00000
  □ Deep charcoal: #404040
  □ All brand colors consistent

□ Google Analytics
  □ Tag present: G-868WGCC45D
  □ Page title correct
  □ Event tracking present (if applicable)

□ SEO & Meta
  □ Canonical tag correct domain
  □ Hreflang tags all correct
  □ No broken hreflang links (underscores, wrong prefixes)
  □ Meta description present
  □ Open Graph tags present

□ Favicons
  □ All sizes referenced
  □ Files exist and are correct version
  □ Tile color: #C00000

□ Links
  □ All internal links work
  □ All language switcher links work
  □ No 404 errors
  □ Correct filename format (hyphens not underscores)

□ Layout & Spacing
  □ Padding/margins match reference
  □ Grid layouts match reference
  □ Responsive breakpoints work
  □ No element overflow

□ Interactive Elements
  □ Hover states work
  □ Transitions smooth (0.3s ease)
  □ Buttons/CTAs styled correctly
  □ Forms work (if present)

□ Visual Consistency
  □ Shadows match reference
  □ Border radius match reference
  □ Card styles match reference
  □ Section spacing match reference
```

---

## 🎯 PRIORITY FIXES (Execute in Order)

### PRIORITY 1: Fix Bullets & Circles on organizational-design-ai.html

**Step 1: Identify correct CSS from contraco.net**
```bash
# Extract bullet CSS from contraco.net version
grep -A 10 "ul\|li\|list-style" /home/user/contraco-net/organizational-design-ai.html > bullets_correct.txt

# Extract circle CSS from contraco.net version
grep -A 10 "principle-number\|pattern-rank\|border-radius: 50%" /home/user/contraco-net/organizational-design-ai.html > circles_correct.txt
```

**Step 2: Compare with broken versions**
```bash
# Check what's different in contraco.de
grep -A 10 "ul\|li\|list-style" /home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de/organizational-design-ai.html > bullets_de.txt

diff bullets_correct.txt bullets_de.txt
```

**Step 3: Create fix instructions for contraco.de session**

**Step 4: Create fix instructions for contraco.kr session**

---

### PRIORITY 2: Fix Logo Sources (All TLDs)

**Files needing updates:**
- contraco.de: ALL HTML files
- contraco.kr: ALL HTML files
- contraco.ru: ALL HTML files

**Change from:**
```html
<img src="https://contraco.net/Logo_rectangle.svg"
```

**Change to:**
```html
<!-- For contraco.de -->
<img src="https://contraco.de/Logo_rectangle.svg"

<!-- For contraco.kr -->
<img src="https://contraco.co.kr/Logo_rectangle.svg"

<!-- For contraco.ru -->
<img src="https://contraco.ru/Logo_rectangle.svg"
```

**Prerequisite:** User must copy Logo_rectangle.svg to each TLD directory first

---

### PRIORITY 3: Fix Broken Links (404 errors)

**Already documented** - awaiting execution in TLD sessions

---

### PRIORITY 4: Deploy Correct Favicons

**Action:** User copying favicon files - monitor completion

---

### PRIORITY 5: Fix Icon Sizing on contraco.ru

**Files:**
- index.html
- about.html
- resonance-method.html
- strategic-intelligence.html

**Fix:** Remove `style="width: 100%; height: 100%;"` from SVG elements

**Already documented in:** CRITICAL-FIXES.md

---

## 📝 COMPLETE FILE INVENTORY

### contraco.net (15 files)
1. index.html - ✓ VERIFIED
2. about.html - ✓ Logo 58px
3. ai-adoption-research.html - ✓ Logo 58px
4. ai-strategy-framework.html - ✓ Logo 58px
5. contact.html - ✓ Logo 58px
6. copyright.html - ✓ Logo 58px
7. cultural-adaptation-guide.html - ✓ Logo 58px
8. digital-transformation-roi.html - ✓ Logo 58px
9. insights.html - ⚠️ MISSING Google Analytics
10. leading-ai-transformation.html - ✓ Logo 58px
11. organizational-design-ai.html - ✓ MASTER REFERENCE
12. pricing-psychology.html - ✓ Logo 58px
13. resonance-method.html - ✓ Logo 58px
14. strategic-intelligence.html - ✓ Logo 58px
15. thank-you.html - ✓ Logo 58px

**Issues:**
- insights.html needs Google Analytics added

---

### contraco.com (4 files)
1. index.html - ✓ PERFECT
2. navigation_template.html - ✓ Template
3. css_base_styles.html - ✓ Template
4. yandex_3ab46e6433c1642a.html - ✓ Verification file

**Issues:** NONE

---

### contraco.de (15 files)
1. about.html - ? Need full check
2. ai-adoption-research.html - ✓ Fixed by me (58px image logo)
3. ai-strategy-framework.html - ✗ TEXT logo (needs replacement)
4. contact.html - ? Need full check
5. cultural-guide.html - ⚠️ 40px logo (needs resize to 58px)
6. digital-transformation-roi.html - ? Need full check
7. index.html - ? Need full check
8. insights.html - ? Need full check
9. leading-ai-transformation.html - ? Need full check
10. organizational-design-ai.html - 🔴 ARROWS + ELLIPSES + WRONG LINKS
11. pricing-psychology.html - ✗ TEXT logo (needs replacement)
12. resonance-method.html - ⚠️ 40px logo (needs resize to 58px)
13. strategic-intelligence.html - ⚠️ 40px logo (needs resize to 58px)
14. thankyou.html - ⚠️ 40px logo (needs resize to 58px)
15. navigation_template.html - ? Template

**Critical Issues:**
- organizational-design-ai.html: Bullets, circles, links ALL wrong
- 2 files with text logos
- 4-5 files with 40px logos
- ALL files load logo from contraco.net (cross-domain)
- Old favicons

---

### contraco.kr (15 files)
1. about.html - ? Need full check
2. ai-adoption-research.html - ? Need full check
3. ai-strategy-framework.html - ? Need full check
4. contact.html - ? Need full check
5. cultural-adaptation-guide.html - ? Need full check
6. digital-transformation-roi.html - ? Need full check
7. index.html - ? Need full check
8. insights.html - ? Need full check
9. leading-ai-transformation.html - ? Need full check
10. organizational-design-ai.html - 🔴 ARROWS + WRONG LINKS
11. pricing-psychology.html - ? Need full check
12. resonance-method.html - ? Need full check
13. strategic-intelligence.html - ? Need full check
14. thankyou.html - ? Need full check
15. navigation_template.html - ? Template

**Critical Issues:**
- organizational-design-ai.html: Bullets and links wrong
- ~8 files estimated with 40px logos or text logos
- ALL files load logo from contraco.net (cross-domain)
- Old favicons

---

### contraco.ru (14 files)
1. about.html - ⚠️ 40px logo + icon sizing issues
2. ai-adoption-research.html - ⚠️ 40px logo
3. ai-strategy-framework.html - ⚠️ 40px logo
4. contact.html - ⚠️ 40px logo
5. cultural-adaptation-guide.html - ⚠️ 40px logo
6. digital-transformation-roi.html - ⚠️ 40px logo
7. index.html - ⚠️ 40px logo + icon sizing issues
8. insights.html - ⚠️ 40px logo
9. leading-ai-transformation.html - ⚠️ 40px logo
10. organizational-design-ai.html - ? Need bullet/circle check
11. pricing-psychology.html - ⚠️ 40px logo
12. resonance-method.html - ⚠️ 35px logo + icon sizing issues
13. strategic-intelligence.html - ⚠️ 35px logo + icon sizing issues
14. thank-you.html - ⚠️ 40px logo

**Critical Issues:**
- ALL 14 files have wrong logo size (40px or 35px instead of 58px)
- 4 files have icon sizing inconsistencies
- ALL files load logo from contraco.net (cross-domain)
- Favicons reportedly OK but needs verification

---

## 🔍 DETAILED CSS COMPARISON NEEDED

### organizational-design-ai.html - Bullets Issue

**Task:** Extract and compare ALL list-related CSS between:
- contraco.net/organizational-design-ai.html (CORRECT)
- contraco.de/organizational-design-ai.html (WRONG - arrows)
- contraco.kr/organizational-design-ai.html (WRONG - arrows)

**CSS to check:**
```
ul { }
li { }
li::before { }
li::after { }
list-style-type
list-style-image
list-style-position
content: "..."
```

**Action:** Create side-by-side diff showing exact differences

---

### organizational-design-ai.html - Circles Issue

**Task:** Extract and compare ALL circle-related CSS between:
- contraco.net/organizational-design-ai.html (CORRECT)
- contraco.de/organizational-design-ai.html (WRONG - ellipses)

**CSS to check:**
```
.principle-number {
  width:
  height:
  border-radius:
  display:
  aspect-ratio:
  flex-shrink:
}

.pattern-rank {
  width:
  height:
  border-radius:
  display:
  aspect-ratio:
  flex-shrink:
}

Parent containers that might distort:
.principle-card { }
.pattern-item { }
.pattern-header { }
```

**Action:** Create side-by-side diff showing exact differences

---

## ✅ EXECUTION WORKFLOW

### Phase 1: Analysis (NOW)
- [ ] Extract correct CSS from contraco.net for bullets
- [ ] Extract correct CSS from contraco.net for circles
- [ ] Compare with broken versions
- [ ] Document exact differences
- [ ] Create precise fix instructions

### Phase 2: Fixes (NEXT)
- [ ] Fix bullets on contraco.de/organizational-design-ai.html
- [ ] Fix bullets on contraco.kr/organizational-design-ai.html
- [ ] Fix circles on contraco.de/organizational-design-ai.html
- [ ] Fix broken links (underscores, prefixes)
- [ ] Add Google Analytics to contraco.net/insights.html

### Phase 3: Logo Updates (AFTER USER COPIES FILES)
- [ ] Update all contraco.de files to use contraco.de/Logo_rectangle.svg
- [ ] Update all contraco.kr files to use contraco.kr/Logo_rectangle.svg
- [ ] Update all contraco.ru files to use contraco.ru/Logo_rectangle.svg
- [ ] Update contraco.ru logo sizes (40px/35px → 58px)

### Phase 4: Full Verification (FINAL)
- [ ] Check EVERY file on EVERY domain using checklist
- [ ] Visual inspection of all pages
- [ ] Link testing (all internal, all language switchers)
- [ ] Google Analytics verification
- [ ] Favicon verification
- [ ] Mobile responsiveness check

---

## 🎯 IMMEDIATE NEXT STEPS

1. **EXTRACT CORRECT CSS** from contraco.net/organizational-design-ai.html
   - Bullets/list styling
   - Circle styling

2. **COMPARE** with broken versions
   - Document exact differences

3. **CREATE FIX INSTRUCTIONS** for:
   - contraco.de session
   - contraco.kr session
   - contraco.ru session (if needed)

4. **USER ACTIONS NEEDED:**
   - Copy Logo_rectangle.svg to all TLD directories
   - Copy favicon files to contraco.de and contraco.kr
   - Confirm when files are copied

5. **THEN** create logo source update instructions for all TLDs

---

## 📊 SUCCESS CRITERIA

### All domains must have:
✓ Logo at 58px height rendering as 144x58px
✓ Logo loading from own domain (not cross-domain)
✓ Correct favicons (matching contraco.net)
✓ Perfect circle numbered elements (not ellipses)
✓ Round bullet points (not arrows)
✓ Google Analytics on all pages (G-868WGCC45D)
✓ Brand color #C00000 everywhere
✓ All links working (no 404s)
✓ Correct filename format (hyphens not underscores)
✓ No visual differences between domains (except language)
✓ All icons consistent size
✓ All fonts correct

### Zero tolerance for:
✗ Cross-domain dependencies
✗ Visual inconsistencies
✗ Broken links
✗ Missing analytics
✗ Wrong colors
✗ Distorted shapes (ellipses instead of circles)
✗ Wrong bullet styles

---

**END OF MASTER CHECKLIST**

**Next Action:** Extract and compare CSS to identify exact bullet and circle issues
