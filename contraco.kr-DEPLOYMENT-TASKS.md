# contraco.kr Deployment Task List
## Ready-to-Execute Action Items

**Version:** 1.0
**Date:** 2025-11-10
**Target Domain:** contraco.kr / contraco.co.kr (Korean TLD)
**Purpose:** Step-by-step deployment tasks for a new Claude Code session
**Execution Mode:** Read this file and execute tasks in order

---

## 🎯 QUICK START FOR CLAUDE

**When starting a new session:**
1. Read this entire document
2. Execute tasks in order (Task 1 → Task 2 → Task 3, etc.)
3. Check off each subtask as completed
4. Run validation commands after each task
5. Commit changes with provided commit messages

**Repository Location:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.kr/`

---

## 📊 CURRENT STATUS

**Domain:** contraco.kr / contraco.co.kr
**Language:** Korean (lang="ko")
**Current Files:** 16 HTML files
**Logo Size:** ✓ 58px (already updated)
**Brand Colors:** ✓ #C00000 (consistent)
**Missing Pages:** 1 (copyright.html)
**File Naming Issues:** 1 file needs renaming
**Typography:** ⚠️ Uses Inter font (acceptable but not optimal for Korean)
**Push Access:** ✗ READ-ONLY (changes staged for manual deployment)

---

## ⚠️ CRITICAL: BEFORE YOU START

### Prerequisites Check

- [ ] You have read access to `/home/user/contraco-net/`
- [ ] Git is configured
- [ ] You can read EXISTING-TLDS-STATUS-BRIEFING.md for context
- [ ] You understand you CANNOT push to contraco.kr directly (stage for deployment)

### Branch Strategy

**Work on:** Current branch or create feature branch
**Cannot push to:** contraco.kr hosting (read-only access)
**Workflow:** Commit locally → Manual deployment by team with access

---

## 📋 TASK 1: FIX FILE NAMING INCONSISTENCY

**Priority:** CRITICAL
**Impact:** Fixes broken hreflang chains and SEO issues
**Estimated Time:** 20 minutes

### Issue Description

One file in contraco.kr has inconsistent naming compared to other TLDs:
- `thankyou.html` should be `thank-you.html`

**Note:** contraco.kr correctly uses `cultural-adaptation-guide.html` (no rename needed)

---

### Task 1A: Rename thankyou.html

**Current File:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html`
**New Name:** `thank-you.html`

#### Step 1: Verify current file exists
```bash
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html
```

**Expected Output:** File should exist

#### Step 2: Read the file to understand content
```bash
head -30 BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html
```

**Check for:**
- [ ] Content is in Korean
- [ ] Logo size is 58px
- [ ] Canonical URL (may reference thank-you.html or thankyou.html)

#### Step 3: Rename the file using git
```bash
cd /home/user/contraco-net
git mv BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html BRAND-UPDATES-INTERNATIONAL/contraco.kr/thank-you.html
```

**Why git mv:** Preserves git history, cleaner than rename + delete

#### Step 4: Verify the rename
```bash
git status
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/thank-you.html
```

**Expected:**
- [ ] Old file marked as renamed in git status
- [ ] New file exists and is readable

#### Step 5: Check canonical URL in renamed file
```bash
grep "canonical" BRAND-UPDATES-INTERNATIONAL/contraco.kr/thank-you.html
```

**Look for:** Should reference `contraco.co.kr/thank-you.html` (with hyphen)
**If it says `thankyou.html`:** Update using Edit tool

```bash
# Check if canonical needs updating
grep "thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.kr/thank-you.html
```

**If found, use Edit tool to change:**
- `href="https://contraco.co.kr/thankyou.html"` → `href="https://contraco.co.kr/thank-you.html"`

---

### Task 1B: Update Internal Links in contraco.kr

Search for references to old filename:
```bash
grep -r "thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html
```

**Action for each match found:**
- [ ] Use Edit tool to update reference from `thankyou.html` → `thank-you.html`

**Common locations:**
- Navigation menus
- Footer links
- CTA buttons
- Language switcher

---

### Task 1C: Update Hreflang References Across ALL TLDs

**IMPORTANT:** All domains reference each other via hreflang tags. We need to update references in ALL TLDs.

#### Files to update:

**In contraco.net (main site):**
```bash
grep -l "contraco.co.kr/thankyou.html" *.html
```

For each file found:
- [ ] Edit hreflang tag: `contraco.co.kr/thankyou.html` → `contraco.co.kr/thank-you.html`

**In contraco.de:**
```bash
grep -l "contraco.co.kr/thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html
```

Update same patterns.

**In contraco.ru:**
```bash
grep -l "contraco.co.kr/thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html
```

Update same patterns.

#### Automated approach (if many files):
```bash
# Update thankyou references across all HTML files
find . -name "*.html" -type f -exec sed -i 's|contraco\.co\.kr/thankyou\.html|contraco.co.kr/thank-you.html|g' {} \;

# Also check for patterns without "co." subdomain
find . -name "*.html" -type f -exec sed -i 's|contraco\.kr/thankyou\.html|contraco.kr/thank-you.html|g' {} \;
```

**Validation:**
```bash
# Should return 0 results (except in lines with "thank-you")
grep -r "contraco.co.kr/thankyou.html" --include="*.html" .
grep -r "contraco.kr/thankyou.html" --include="*.html" . | grep -v "thank-you"
```

---

### Task 1D: Validation for Task 1

Run these commands to verify all changes:

```bash
# 1. Old file should NOT exist
ls BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html 2>&1
# Expected: "No such file or directory"

# 2. New file SHOULD exist
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/thank-you.html
# Expected: File exists

# 3. No references to old name should remain
grep -r "thankyou\.html" --include="*.html" . | grep "contraco.kr" | grep -v "thank-you"
# Expected: No results

# 4. Git status should show rename
git status
# Expected: Shows renamed file
```

### Task 1E: Commit Task 1 Changes

```bash
git add -A
git commit -m "Fix contraco.kr file naming inconsistency

Renamed file to match standard naming across all TLDs:
- thankyou.html → thank-you.html

Updated all hreflang references across contraco.net, contraco.de,
contraco.ru to point to correct filename.

Fixes broken hreflang chains and SEO issues.

Files affected: 1 renamed + ~15-25 hreflang updates"
```

**Task 1 Checklist:**
- [ ] thankyou.html renamed to thank-you.html
- [ ] Canonical URL updated (if needed)
- [ ] Internal links updated in contraco.kr
- [ ] Hreflang tags updated across all TLDs
- [ ] Validation commands pass
- [ ] Changes committed

---

## 📋 TASK 2: CREATE MISSING copyright.html PAGE (KOREAN)

**Priority:** HIGH
**Impact:** Completes site structure, provides required legal information
**Estimated Time:** 60 minutes (translation to Korean required)

### Issue Description

`copyright.html` exists in contraco.net but is missing from contraco.kr (and .de, .ru).

---

### Task 2A: Read the English Source File

```bash
cat /home/user/contraco-net/copyright.html
```

**Analyze:**
- [ ] Content structure
- [ ] Legal statements
- [ ] Trademark information
- [ ] Navigation structure
- [ ] Logo size (should be 58px)
- [ ] Brand colors used

**Take notes on:**
- Sections that need translation to Korean
- Sections that should remain in English (e.g., legal entity names)
- Navigation links
- Footer content

---

### Task 2B: Create Korean Translation

**File to create:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html`

#### Translation Guidelines:

**Keep in English:**
- Company name: "contraco"
- Legal entity names
- Trademark: "The Resonance Method™"
- URLs and email addresses
- Address: "1209 10th Ln., Ava, MO 65608, United States"

**Translate to Korean:**
- Page title
- Section headings
- Body text
- Navigation labels
- Legal text

**Key Terms (Korean):**
- Copyright → 저작권 (jeojakkwon)
- All rights reserved → 모든 권리 보유 (modeun gwonri boyu)
- Trademark → 상표 (sangpyo)
- Intellectual Property → 지적 재산 (jijeok jaesan)

#### Step 1: Use Write tool to create the file

**Base structure** (adapt from contraco.net/copyright.html):

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="yandex-verification" content="6bf4d4b1fabaac1b" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저작권 및 상표 | contraco</title>

    <!-- Canonical Tag -->
    <link rel="canonical" href="https://contraco.co.kr/copyright.html">

    <!-- Robots Meta Tag -->
    <meta name="robots" content="index, follow">

    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-868WGCC45D', {
            page_title: '저작권 - contraco',
            page_location: window.location.href
        });
    </script>

    <!-- Complete hreflang for International SEO -->
    <link rel="alternate" href="https://contraco.net/copyright.html" hreflang="x-default" />
    <link rel="alternate" hreflang="en" href="https://contraco.net/copyright.html" />
    <link rel="alternate" hreflang="de" href="https://contraco.de/copyright.html" />
    <link rel="alternate" hreflang="ru" href="https://contraco.ru/copyright.html" />
    <link rel="alternate" hreflang="ko" href="https://contraco.co.kr/copyright.html" />

    <!-- [COPY ALL REMAINING HEAD CONTENT FROM CONTRACO.NET/COPYRIGHT.HTML] -->
    <!-- Including: Fonts, Favicon set, Meta tags, Complete CSS -->

</head>
<body>
    <!-- [COPY NAVIGATION FROM ANOTHER CONTRACO.KR PAGE] -->
    <!-- Ensure logo is 58px -->

    <!-- Main Content - TRANSLATE TO KOREAN -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <h1 class="hero-title">저작권 및 상표</h1>
                <p class="hero-subtitle">[KOREAN TRANSLATION OF SUBTITLE]</p>
            </div>
        </section>

        <!-- [COPY AND TRANSLATE ALL SECTIONS] -->
    </main>

    <!-- [COPY FOOTER FROM ANOTHER CONTRACO.KR PAGE] -->
</body>
</html>
```

#### Step 2: Verification Checklist

After creating the file, verify:

```bash
# File exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html

# Has correct language code
grep 'lang="ko"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html

# Has Yandex verification meta tag
grep 'yandex-verification' BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html

# Has correct canonical
grep 'contraco.co.kr/copyright.html' BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html

# Logo is 58px
grep 'height: 58px' BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html

# All hreflang tags present
grep 'hreflang=' BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html | wc -l
# Expected: 5 (x-default, en, de, ru, ko)
```

---

### Task 2C: Add copyright.html to Navigation

**Files to update:**

1. **contraco.kr/navigation_template.html** (if it exists and is used)
2. Check if copyright link should be in:
   - Main navigation menu
   - Footer links
   - Both

**Common location:** Footer only

**Update footer in these files** (if copyright should be accessible):
```bash
# List all contraco.kr HTML files
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v yandex | grep -v navigation_template
```

**For each file:**
- Read the footer section
- If other legal links exist (privacy, terms), add copyright link nearby
- If no legal section exists, consider adding one

**Example footer addition (Korean):**
```html
<div class="footer-links">
    <a href="https://contraco.co.kr/">홈</a>
    <a href="https://contraco.co.kr/about.html">회사 소개</a>
    <!-- ... other links ... -->
    <a href="https://contraco.co.kr/copyright.html">저작권</a>
</div>
```

---

### Task 2D: Update Hreflang Across TLDs

Now that contraco.kr/copyright.html exists, add it to hreflang tags:

**Files to update:**

1. **contraco.net/copyright.html** - Add contraco.kr reference
2. **contraco.de/copyright.html** (if exists from Task 1 or previous work) - Add contraco.kr reference
3. **contraco.ru/copyright.html** (if exists) - Add contraco.kr reference

**Command to check:**
```bash
ls -la */copyright.html BRAND-UPDATES-INTERNATIONAL/*/copyright.html 2>/dev/null
```

**For each file found:**
- Read the hreflang section
- Ensure it includes: `<link rel="alternate" hreflang="ko" href="https://contraco.co.kr/copyright.html" />`

---

### Task 2E: Commit Task 2 Changes

```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/copyright.html
git add -u  # Add any updated hreflang references
git commit -m "Add Korean copyright page to contraco.kr

Created translated copyright.html for contraco.kr with:
- Korean translation of all content
- Proper hreflang configuration
- 58px logo standard
- Brand-consistent styling (#C00000 colors)
- Links to other TLD versions
- Yandex verification meta tag

Updated hreflang references across existing copyright pages.

Completes site structure and provides required legal information."
```

**Task 2 Checklist:**
- [ ] Read contraco.net/copyright.html for reference
- [ ] Created contraco.kr/copyright.html with Korean translation
- [ ] Logo is 58px in new file
- [ ] Canonical URL is correct (contraco.co.kr)
- [ ] Yandex verification meta tag present
- [ ] Hreflang tags complete (5 tags)
- [ ] Added to footer navigation (if appropriate)
- [ ] Updated hreflang on other TLD copyright pages
- [ ] Changes committed

---

## 📋 TASK 3: IMPROVE KOREAN TYPOGRAPHY

**Priority:** MEDIUM-HIGH
**Impact:** Better readability and user experience for Korean users
**Estimated Time:** 45 minutes

### Issue Description

contraco.kr currently uses Inter font for all text. While Inter supports Korean characters, it's not optimized for Korean typography. Adding a Korean-specific font will improve readability.

---

### Task 3A: Research Current Font Configuration

```bash
# Check current font configuration
grep -A 5 "font-family" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html | head -20
```

**Current CSS variables:**
```css
--font-serif: 'Crimson Text', Georgia, 'Times New Roman', serif;
--font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

**Current Google Fonts link:**
```html
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

---

### Task 3B: Add Korean Font to Google Fonts Link

**Best Korean fonts for web:**
- **Noto Sans KR** - Modern, clean, excellent readability
- **Nanum Gothic** - Popular Korean web font
- **Spoqa Han Sans** - Business-appropriate

**Recommended:** Noto Sans KR (weights: 300, 400, 500, 600, 700 to match Inter)

#### Step 1: Read one HTML file to see current font link
```bash
grep "googleapis.com/css2" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
```

#### Step 2: Create new font link with Noto Sans KR

**New Google Fonts link:**
```html
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

**What changed:**
- Added: `&family=Noto+Sans+KR:wght@300;400;500;600;700`

#### Step 3: Bulk update all contraco.kr HTML files

```bash
# Find and replace font link in all contraco.kr HTML files
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|family=Inter:wght@300;400;500;600;700&display=swap|family=Inter:wght@300;400;500;600;700\&family=Noto+Sans+KR:wght@300;400;500;600;700\&display=swap|g' {} \;
```

**Verification:**
```bash
# Should show Noto+Sans+KR in all files
grep "Noto+Sans+KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l
# Expected: Number should equal HTML file count
```

---

### Task 3C: Update CSS Font Stack

Now update the CSS to use Noto Sans KR as the primary sans-serif font.

**New font-sans variable:**
```css
--font-sans: 'Noto Sans KR', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

**Why this order:**
- Noto Sans KR first (optimized for Korean)
- Inter second (fallback for Latin characters, provides good pairing)
- System fonts as final fallback

#### Step 1: Find CSS variable definition

```bash
# Find where font-sans is defined
grep -n "font-sans:" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html | head -5
```

#### Step 2: Update font-sans in all files

```bash
# Update font-sans variable
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i "s|--font-sans: 'Inter',|--font-sans: 'Noto Sans KR', 'Inter',|g" {} \;
```

**Verification:**
```bash
# Should show Noto Sans KR in font-sans definitions
grep "font-sans:.*Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l
# Expected: Should match HTML file count
```

---

### Task 3D: Optional - Improve Serif Font for Korean

**Current serif:** Crimson Text (doesn't support Korean well)

**Options:**
1. **Keep Crimson Text** - Korean falls back to system serif
2. **Add Noto Serif KR** - Korean-optimized serif font

**If adding Noto Serif KR:**

#### Update Google Fonts link:
```html
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;600;700&family=Noto+Serif+KR:wght@400;600&display=swap" rel="stylesheet">
```

#### Update CSS:
```css
--font-serif: 'Noto Serif KR', 'Crimson Text', Georgia, 'Times New Roman', serif;
```

**Command to update (optional):**
```bash
# Add Noto Serif KR to font link
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|Noto\+Sans\+KR:wght@300;400;500;600;700&display=swap|Noto+Sans+KR:wght@300;400;500;600;700\&family=Noto+Serif+KR:wght@400;600\&display=swap|g' {} \;

# Update font-serif variable
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i "s|--font-serif: 'Crimson Text',|--font-serif: 'Noto Serif KR', 'Crimson Text',|g" {} \;
```

---

### Task 3E: Validation for Task 3

```bash
# 1. Verify Noto Sans KR is in Google Fonts link
grep "Noto+Sans+KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
# Expected: Should appear in <link> tag

# 2. Verify Noto Sans KR is in CSS font-sans
grep "font-sans:.*Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
# Expected: Should appear in CSS variable

# 3. Check all files updated
grep -L "Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v yandex
# Expected: No results (all should have Noto Sans KR)

# 4. If added Noto Serif KR, verify
grep "Noto+Serif+KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
grep "font-serif:.*Noto Serif KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
```

---

### Task 3F: Commit Task 3 Changes

**If added both Sans and Serif:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/
git commit -m "Improve Korean typography for contraco.kr

Added Korean-optimized fonts for better readability:
- Noto Sans KR (primary sans-serif)
- Noto Serif KR (primary serif)
- Inter and Crimson Text as Latin fallbacks

Updated all contraco.kr HTML files:
- Added fonts to Google Fonts link
- Updated CSS font-family variables
- Maintains brand consistency while improving Korean text rendering

Weights: 300, 400, 500, 600, 700 (sans) | 400, 600 (serif)"
```

**If added only Sans:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/
git commit -m "Improve Korean typography for contraco.kr

Added Noto Sans KR as primary sans-serif font for better Korean
text readability and rendering.

- Added to Google Fonts link
- Updated --font-sans CSS variable
- Inter remains as Latin fallback
- All contraco.kr HTML files updated

Weights: 300, 400, 500, 600, 700 to match Inter"
```

**Task 3 Checklist:**
- [ ] Researched current font configuration
- [ ] Added Noto Sans KR to Google Fonts link
- [ ] Updated --font-sans CSS variable
- [ ] Optional: Added Noto Serif KR
- [ ] Optional: Updated --font-serif CSS variable
- [ ] Validated all files updated
- [ ] Changes committed

---

## 📋 TASK 4: UPDATE HREFLANG REFERENCES

**Priority:** MEDIUM
**Impact:** Ensures all cross-TLD references are correct
**Estimated Time:** 20 minutes

### Issue Description

After renaming thank-you.html and creating copyright.html, verify all hreflang chains are complete and consistent.

---

### Task 4A: Verify Hreflang Consistency

```bash
# Check thank-you.html hreflang chains
grep -r "thank-you.html" --include="*.html" . | grep "hreflang" | sort -u

# Check copyright.html hreflang chains
grep -r "copyright.html" --include="*.html" . | grep "hreflang" | grep "contraco.kr" | sort -u
```

**Verify:**
- [ ] All TLDs reference contraco.co.kr/thank-you.html (not thankyou.html)
- [ ] All TLDs reference contraco.co.kr/copyright.html
- [ ] contraco.kr references itself correctly
- [ ] No broken references to old filenames

---

### Task 4B: Count Hreflang Tags Per Page

Every page should have 5 hreflang tags (x-default, en, de, ru, ko):

```bash
for file in BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html; do
    filename=$(basename "$file")
    if [[ ! "$filename" =~ yandex ]] && [[ "$filename" != "navigation_template.html" ]]; then
        count=$(grep -c "hreflang=" "$file" 2>/dev/null)
        if [ $count -ne 5 ]; then
            echo "⚠ $filename: $count hreflang tags (expected 5)"
        else
            echo "✓ $filename: $count hreflang tags"
        fi
    fi
done
```

---

### Task 4C: Validate Domain References

Ensure contraco.kr pages use correct domain format:

```bash
# Should use contraco.co.kr (with .co)
grep 'hreflang="ko"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
# Expected: href="https://contraco.co.kr/" (not just contraco.kr)

# Check all pages use .co.kr format
grep -h 'hreflang="ko"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v "contraco.co.kr" | grep -v yandex
# Expected: No results (all should use .co.kr)
```

---

### Task 4D: Fix Any Inconsistencies

If validation finds issues, use these patterns:

**If some files use contraco.kr instead of contraco.co.kr:**
```bash
# Update to use .co.kr consistently
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|https://contraco\.kr/|https://contraco.co.kr/|g' {} \;
```

**If hreflang count is wrong on some pages:**
- Read the file
- Check which hreflang tags are missing
- Use Edit tool to add missing tags

---

### Task 4E: Commit Task 4 Changes (if any updates needed)

```bash
git add -u
git commit -m "Verify and update hreflang references for contraco.kr

Validated hreflang tags across all contraco.kr pages:
- thank-you.html references updated (renamed file)
- copyright.html references added (new file)
- All pages have complete 5-tag hreflang sets
- Consistent use of contraco.co.kr domain format

All hreflang chains now complete and consistent."
```

**Task 4 Checklist:**
- [ ] Verified thank-you.html hreflang chains
- [ ] Verified copyright.html hreflang chains
- [ ] Counted hreflang tags per page (should be 5)
- [ ] Validated domain format (contraco.co.kr)
- [ ] Fixed any inconsistencies found
- [ ] Changes committed (if any)

---

## 📋 TASK 5: FAVICON & ICON SETUP

**Priority:** MEDIUM
**Impact:** Ensures brand icons display correctly
**Estimated Time:** 30 minutes

### Current Status

contraco.kr HTML files reference favicons like:
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<!-- etc. -->
```

These reference **root-level** favicons, not contraco.kr-specific ones.

---

### Task 5A: Verify Current Favicon Setup

```bash
# Check if favicons exist in contraco.kr directory
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.png 2>/dev/null | head -10
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.ico 2>/dev/null
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.svg 2>/dev/null
```

**Expected:** Probably no icon files (0 results)

```bash
# Check if favicons exist in root
ls -la *.png *.ico *.svg 2>/dev/null | grep -i "favicon\|apple-touch\|android-icon" | head -10
```

**Expected:** ~29 icon files

---

### Task 5B: Decision Point

**Option 1: Keep Root-Level Serving (Current Setup)**
- No action needed
- Relies on proper server configuration to serve `/favicon.ico` from root
- All TLDs share same icons

**Option 2: Copy Icons to contraco.kr Directory**
- More explicit, less dependent on server config
- Allows per-TLD customization in future
- Increases file count

**Option 3: Generate New Icons for contraco.kr**
- Only if rebranding with different colors
- Requires design tools or icon generator

**Recommendation:** Option 2 (copy icons) for explicit control

---

### Task 5C: If Option 2 - Copy Icons to contraco.kr

**Only do this if you decide favicons should be per-TLD.**

```bash
# Copy all favicon files to contraco.kr directory
cp favicon*.ico BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp favicon*.png BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp apple-touch-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp android-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp mstile*.png BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp site.webmanifest BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null
cp browserconfig.xml BRAND-UPDATES-INTERNATIONAL/contraco.kr/ 2>/dev/null

# Verify copy
echo "Copied $(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.png 2>/dev/null | wc -l) PNG files"
echo "Copied $(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.ico 2>/dev/null | wc -l) ICO files"
```

**Expected counts:**
- PNG files: ~20 (apple-touch, android, favicons, mstile)
- ICO files: 1 (favicon.ico)

---

### Task 5D: Optional - Update HTML to Use Relative Paths

If you copied icons to contraco.kr directory, you can update HTML to use relative paths:

**Current (absolute):**
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
```

**Option 1 - Keep absolute (recommended):**
No changes needed. Server will serve from contraco.kr directory.

**Option 2 - Use relative paths:**
```html
<link rel="icon" type="image/x-icon" href="favicon.ico">
```

**To update to relative paths:**
```bash
# Update all icon hrefs to relative paths
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|href="/favicon|href="favicon|g' {} \;
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|href="/apple-touch-icon|href="apple-touch-icon|g' {} \;
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|href="/android-icon|href="android-icon|g' {} \;
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|href="/mstile|href="mstile|g' {} \;
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -type f -exec sed -i 's|href="/site.webmanifest"|href="site.webmanifest"|g' {} \;
```

---

### Task 5E: Validate Icon References

Test that all icon references are valid:

```bash
# List all icon references in contraco.kr HTML files
grep -h 'rel="icon"\|rel="apple-touch-icon"\|rel="manifest"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | sort -u
```

**Check:**
- [ ] Paths are correct (absolute or relative)
- [ ] All referenced files exist
- [ ] No 404 errors expected

---

### Task 5F: Commit Task 5 Changes (if any)

**If you copied icons:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.png
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.ico
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/site.webmanifest 2>/dev/null
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/browserconfig.xml 2>/dev/null
git commit -m "Add favicon files to contraco.kr directory

Copied complete favicon set (29 files) to contraco.kr for
explicit control over brand icons:
- favicon.ico and PNG variants
- Apple touch icons (9 sizes)
- Android icons (5 sizes)
- MS tile icons
- Web manifest

Allows per-TLD icon customization and reduces server config dependency."
```

**If keeping root-level:**
```bash
# No commit needed, document decision
echo "✓ Decision: Keep root-level favicon serving (current setup)"
```

**Task 5 Checklist:**
- [ ] Verified current favicon setup
- [ ] Made decision: root-level or per-TLD
- [ ] If per-TLD: Copied all icon files
- [ ] If per-TLD: Updated HTML references (optional)
- [ ] Validated icon references
- [ ] Changes committed (if any)
- [ ] Documented decision

---

## 📋 TASK 6: FINAL VALIDATION & TESTING

**Priority:** CRITICAL
**Impact:** Ensures all changes work correctly
**Estimated Time:** 30 minutes

---

### Task 6A: File Structure Validation

```bash
# 1. Count HTML files in contraco.kr (should be 16 after adding copyright.html)
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v yandex | wc -l
# Expected: 16

# 2. Verify critical files exist
for file in index about contact insights copyright cultural-adaptation-guide thank-you; do
    if [ -f "BRAND-UPDATES-INTERNATIONAL/contraco.kr/${file}.html" ]; then
        echo "✓ ${file}.html exists"
    else
        echo "✗ ${file}.html MISSING"
    fi
done

# 3. Old file should NOT exist
ls BRAND-UPDATES-INTERNATIONAL/contraco.kr/thankyou.html 2>&1 | grep "No such file" && echo "✓ Old file removed"
```

---

### Task 6B: Logo Size Validation

Verify all contraco.kr pages have 58px logo:

```bash
# Should return count equal to number of HTML files with navigation
grep -c "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v ":0" | wc -l

# No pages should have old 36px logo
grep "height: 36px" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html && echo "⚠ Found old logo size" || echo "✓ All logos 58px"
```

---

### Task 6C: Korean Typography Validation

```bash
# 1. Verify Noto Sans KR in all pages
echo "=== Checking Noto Sans KR font ==="
grep -c "Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep ":0" && echo "⚠ Some files missing Noto Sans KR" || echo "✓ All files have Noto Sans KR"

# 2. Check Google Fonts link includes Noto Sans KR
grep "googleapis.com/css2" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html | grep "Noto+Sans+KR" && echo "✓ Google Fonts link includes Noto Sans KR" || echo "⚠ Missing from Google Fonts"

# 3. Check CSS variable uses Noto Sans KR
grep "font-sans:.*Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html && echo "✓ CSS variable uses Noto Sans KR" || echo "⚠ CSS not updated"
```

---

### Task 6D: Brand Consistency Validation

```bash
# 1. All pages use Korean language code
grep -L 'lang="ko"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v yandex
# Expected: No results (all files should have lang="ko")

# 2. All pages have Yandex verification (at least in index)
grep 'yandex-verification' BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html && echo "✓ Yandex verification present"

# 3. All pages use primary red color
grep "#C00000" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html && echo "✓ Primary color present"

# 4. All pages have Google Analytics
grep -L "G-868WGCC45D" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v yandex
# Expected: No results (all should have GA)
```

---

### Task 6E: SEO Validation

```bash
# 1. Check all canonical tags point to contraco.co.kr
grep 'rel="canonical"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v "contraco.co.kr" | grep -v yandex
# Expected: No results (all should point to .co.kr domain)

# 2. Verify all pages are set to index
grep 'robots' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v "index, follow" | grep -v yandex
# Expected: No results (all should allow indexing)

# 3. Check hreflang completeness
echo "=== Hreflang tag counts ==="
for file in BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html; do
    filename=$(basename "$file")
    if [[ ! "$filename" =~ yandex ]] && [[ "$filename" != "navigation_template.html" ]]; then
        count=$(grep -c 'hreflang=' "$file")
        if [ $count -ne 5 ]; then
            echo "⚠ $filename: $count hreflang tags (expected 5)"
        fi
    fi
done
echo "If no warnings above, all pages have correct hreflang counts ✓"
```

---

### Task 6F: Cross-Domain Link Validation

```bash
# 1. Language switcher links should point to correct TLDs
echo "=== Checking language switcher in contraco.kr/index.html ==="
grep -A 1 'lang-link' BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html | grep 'href=' | head -8

# Expected output should show:
# - contraco.net for EN
# - contraco.de for DE
# - contraco.ru for RU
# - contraco.co.kr for KO (active)

# 2. Check for potentially broken internal links
echo "=== Checking for old filename references ==="
grep -r "thankyou\.html" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v "thank-you" && echo "⚠ Found old filename" || echo "✓ No old filename references"
```

---

### Task 6G: Content Validation

```bash
# 1. Verify all pages have titles
for file in BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html; do
    if ! grep -q "<title>" "$file"; then
        echo "⚠ Missing title: $(basename $file)"
    fi
done

# 2. Check that content is in Korean
echo "=== Checking Korean content ==="
grep -h "<title>" BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
# Should show Korean characters

# 3. Verify contact information
grep "transformation@contraco.net" BRAND-UPDATES-INTERNATIONAL/contraco.kr/contact.html && echo "✓ Contact email present"
```

---

### Task 6H: Git Status Check

```bash
# View all changes made
git status

# Review commits
git log --oneline -10

# Check what files were modified/added/renamed
git diff --name-status HEAD~6..HEAD | grep contraco.kr
```

**Expected changes:**
- 1 file renamed (thankyou → thank-you)
- 1 file created (copyright.html)
- ~15 files modified (typography updates)
- ~15-25 files in other TLDs modified (hreflang updates)
- Optional: favicon files added

---

### Task 6I: Create Summary Report

Generate a summary of all changes:

```bash
cat > /tmp/contraco-kr-deployment-summary.txt << 'EOF'
# contraco.kr Deployment Summary
Date: $(date)

## Files Changed:

### Renamed:
- thankyou.html → thank-you.html

### Created:
- copyright.html (Korean translation)

### Modified:
- All HTML files: Typography improvements (Noto Sans KR added)
- Multiple files: Hreflang updates across all TLDs

### Optional:
- Favicon files copied (if Option 2 chosen in Task 5)

## Improvements Made:

### Typography:
✓ Added Noto Sans KR for improved Korean readability
✓ Updated Google Fonts link
✓ Updated CSS font-family variables

### Content:
✓ Fixed file naming consistency
✓ Added missing copyright page
✓ All hreflang references updated

### Validation Results:

Logo size: $(grep -l "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l) files have 58px logo
Language code: $(grep -l 'lang="ko"' BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l) files have lang="ko"
Korean font: $(grep -l "Noto Sans KR" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l) files have Noto Sans KR
Canonical tags: All point to contraco.co.kr ✓
Hreflang tags: All pages checked ✓

## Commits Created:
$(git log --oneline HEAD~6..HEAD | grep -i "kr\|korean\|hreflang")

## Ready for Deployment: YES/NO
- [ ] All validations passed
- [ ] No broken links found
- [ ] Typography improved
- [ ] SEO tags correct
- [ ] Brand consistency maintained
- [ ] Ready for manual deployment to contraco.kr hosting

EOF

cat /tmp/contraco-kr-deployment-summary.txt
```

---

### Task 6J: Final Checklist

**Before marking deployment ready:**

- [ ] Renamed file exists with new name (thank-you.html)
- [ ] Old filename does not exist (thankyou.html removed)
- [ ] copyright.html created and translated to Korean
- [ ] All hreflang tags updated across all TLDs
- [ ] Logo is 58px on all contraco.kr pages
- [ ] Noto Sans KR font added and configured
- [ ] Google Fonts link includes Noto Sans KR
- [ ] CSS font-family updated
- [ ] Brand colors consistent (#C00000)
- [ ] All canonical URLs correct (contraco.co.kr)
- [ ] Language code is "ko" on all pages
- [ ] Yandex verification meta tag present
- [ ] Google Analytics ID present (G-868WGCC45D)
- [ ] No broken internal links
- [ ] All validation commands pass
- [ ] Git commits created with clear messages
- [ ] Summary report generated

---

## 📋 TASK 7: PREPARE FOR MANUAL DEPLOYMENT

**Priority:** CRITICAL
**Impact:** Ensures changes can be deployed to live contraco.kr
**Estimated Time:** 20 minutes

### Task 7A: Create Deployment Package

Since you cannot push directly to contraco.kr, create a deployment package:

```bash
# Create deployment directory
mkdir -p /tmp/contraco-kr-deployment

# Copy all contraco.kr files
cp -r BRAND-UPDATES-INTERNATIONAL/contraco.kr/* /tmp/contraco-kr-deployment/

# List what's in deployment package
ls -la /tmp/contraco-kr-deployment/

# Count files
echo "Total HTML files: $(ls -1 /tmp/contraco-kr-deployment/*.html | wc -l)"
echo "Total PNG files: $(ls -1 /tmp/contraco-kr-deployment/*.png 2>/dev/null | wc -l)"
echo "Total ICO files: $(ls -1 /tmp/contraco-kr-deployment/*.ico 2>/dev/null | wc -l)"
```

---

### Task 7B: Create Deployment Instructions

```bash
cat > /tmp/contraco-kr-deployment/DEPLOYMENT-INSTRUCTIONS.md << 'EOF'
# contraco.kr Deployment Instructions

## Changes Summary:
1. **Renamed File:**
   - thankyou.html → thank-you.html

2. **New File:**
   - copyright.html (Korean translation)

3. **Typography Improvements:**
   - Added Noto Sans KR font for better Korean readability
   - All HTML files updated with new font configuration

4. **Modified Files:**
   - ~15 HTML files (font updates + hreflang updates)

## Pre-Deployment Checklist:
- [ ] Backup current contraco.kr / contraco.co.kr site
- [ ] Set up 301 redirect:
  - /thankyou.html → /thank-you.html
- [ ] Test redirect on staging (if available)

## Deployment Steps:
1. Upload all files to contraco.kr / contraco.co.kr hosting
2. Overwrite existing files
3. Verify renamed file is accessible
4. Verify new copyright.html loads
5. Test 301 redirect works
6. Check logo displays at 58px
7. **Verify Korean fonts load correctly (Noto Sans KR)**
8. Test navigation and all internal links
9. Verify language switcher works
10. Submit updated sitemap to Google Search Console
11. Submit to Yandex Webmaster Tools
12. Monitor Google Analytics for errors

## Typography Testing (Important):
- [ ] Korean text renders cleanly and is easily readable
- [ ] Noto Sans KR font loads from Google Fonts
- [ ] Fallback to Inter works if font fails to load
- [ ] Check on multiple devices (desktop, mobile, tablet)
- [ ] Test on multiple browsers (Chrome, Safari, Firefox, Samsung Internet)

## Post-Deployment Testing:
- [ ] Visit https://contraco.co.kr/thank-you.html (should work)
- [ ] Visit https://contraco.co.kr/thankyou.html (should redirect)
- [ ] Visit https://contraco.co.kr/copyright.html (should work)
- [ ] Check Korean font rendering on homepage
- [ ] Check language switcher on all pages
- [ ] Verify hreflang tags with Google Search Console
- [ ] Run Lighthouse audit
- [ ] Check PageSpeed Insights for Korean font performance

## Rollback Plan:
If issues occur:
1. Restore from backup
2. Review error logs
3. Test fixes on staging
4. Retry deployment

## Contact:
If questions arise during deployment, refer to:
- EXISTING-TLDS-STATUS-BRIEFING.md (full context)
- contraco.kr-DEPLOYMENT-TASKS.md (this checklist)

Deployment prepared: $(date)
EOF

cat /tmp/contraco-kr-deployment/DEPLOYMENT-INSTRUCTIONS.md
```

---

### Task 7C: Create 301 Redirect Configuration

**Apache (.htaccess):**
```bash
cat > /tmp/contraco-kr-deployment/.htaccess << 'EOF'
# contraco.kr 301 Redirect for renamed file
RewriteEngine On

# Redirect old thankyou.html to new filename
RewriteRule ^thankyou\.html$ /thank-you.html [R=301,L]
EOF
```

**Nginx (add to server block):**
```bash
cat > /tmp/contraco-kr-deployment/nginx-redirects.conf << 'EOF'
# contraco.kr 301 Redirect for renamed file

location = /thankyou.html {
    return 301 /thank-you.html;
}
EOF
```

---

### Task 7D: Commit Final Changes

```bash
git add -A
git commit -m "Prepare contraco.kr for deployment

Completed all deployment tasks:
✓ Fixed file naming inconsistency (thankyou → thank-you)
✓ Created missing copyright.html (Korean translation)
✓ Improved typography with Noto Sans KR font
✓ Updated all hreflang references
✓ Verified favicon setup
✓ Validated all changes
✓ Created deployment package and instructions

Typography improvements:
- Noto Sans KR for better Korean readability
- Updated Google Fonts link and CSS variables
- Maintains brand consistency

Files ready for manual deployment to contraco.kr / contraco.co.kr hosting.

Includes 301 redirect configuration for Apache and Nginx.

Changes affect: 1 renamed + 1 new + ~15 modified files"
```

---

### Task 7E: Push to Repository

```bash
# Push to current branch
git push origin HEAD
```

**If you encounter issues:**
- You may not have direct push access
- Alternative: Create a pull request for team review
- Provide link to this deployment task document

---

### Task 7F: Create Deployment Notification

```bash
cat > /tmp/deployment-notification-kr.txt << 'EOF'
SUBJECT: contraco.kr Deployment Ready - File Naming Fix, New Copyright Page & Korean Typography

Hi Team,

contraco.kr / contraco.co.kr updates are ready for deployment. All changes have been validated and tested locally.

SUMMARY OF CHANGES:
• Renamed 1 file to fix naming inconsistency
• Added missing copyright.html page (Korean translation)
• IMPROVED TYPOGRAPHY: Added Noto Sans KR for better Korean readability
• Updated ~15 files with typography and hreflang references
• Verified logo at 58px across all pages
• Brand consistency maintained

TYPOGRAPHY IMPROVEMENTS (NEW):
✓ Added Noto Sans KR as primary sans-serif font
✓ Optimized for Korean text rendering and readability
✓ Inter remains as Latin fallback
✓ Google Fonts link updated
✓ All CSS font-family variables updated

DEPLOYMENT PACKAGE:
Location: /tmp/contraco-kr-deployment/
Files: 16 HTML files + icons (if included)
Instructions: See DEPLOYMENT-INSTRUCTIONS.md

CRITICAL: 301 Redirect Required
• /thankyou.html → /thank-you.html

Redirect config provided for both Apache (.htaccess) and Nginx.

TESTING CHECKLIST:
Complete post-deployment testing checklist provided in deployment instructions.
IMPORTANT: Verify Korean font rendering on multiple devices.

DOCUMENTATION:
• Full context: EXISTING-TLDS-STATUS-BRIEFING.md
• Task details: contraco.kr-DEPLOYMENT-TASKS.md
• Deployment instructions: DEPLOYMENT-INSTRUCTIONS.md

Git commits: [Link to commits]
Ready for deployment: YES

Questions? See deployment documentation or contact [your name/role].

Prepared: $(date)
EOF

cat /tmp/deployment-notification-kr.txt
```

---

**Task 7 Checklist:**
- [ ] Deployment package created
- [ ] Deployment instructions written
- [ ] 301 redirect config created (Apache & Nginx)
- [ ] All changes committed to git
- [ ] Changes pushed to repository
- [ ] Deployment notification prepared
- [ ] Team notified (if applicable)

---

## ✅ COMPLETION CHECKLIST

### All Tasks Completed:

- [ ] **Task 1:** File naming inconsistency fixed
  - [ ] thankyou.html renamed to thank-you.html
  - [ ] All hreflang references updated

- [ ] **Task 2:** Missing copyright.html page created
  - [ ] Translated to Korean
  - [ ] Added to site structure
  - [ ] Hreflang tags updated

- [ ] **Task 3:** Korean typography improved
  - [ ] Noto Sans KR added
  - [ ] Google Fonts link updated
  - [ ] CSS variables updated

- [ ] **Task 4:** Hreflang references validated
  - [ ] All cross-domain links verified
  - [ ] No broken references found

- [ ] **Task 5:** Favicon setup verified
  - [ ] Decision made (root-level or per-TLD)
  - [ ] Icons validated

- [ ] **Task 6:** Final validation completed
  - [ ] All validation commands passed
  - [ ] Summary report generated

- [ ] **Task 7:** Deployment package prepared
  - [ ] Package created
  - [ ] Instructions written
  - [ ] Redirects configured
  - [ ] Team notified

---

## 📊 SUCCESS METRICS

After deployment, verify these metrics:

**SEO:**
- [ ] All hreflang errors resolved in Google Search Console
- [ ] 301 redirect working (no 404 for old URL)
- [ ] copyright.html page indexed
- [ ] Yandex Webmaster Tools updated

**Technical:**
- [ ] All pages load successfully
- [ ] Logo displays at 58px
- [ ] **Noto Sans KR font loads correctly**
- [ ] No JavaScript errors
- [ ] Page load time < 3 seconds

**Typography:**
- [ ] Korean text is crisp and readable
- [ ] Font switching is smooth
- [ ] Fallback fonts work if needed
- [ ] Mobile rendering is excellent

**Analytics:**
- [ ] Google Analytics tracking on all pages
- [ ] No traffic drop after deployment
- [ ] Language switcher events tracking

---

## 🔄 IF ISSUES OCCUR

### Rollback Procedure:
1. Restore from backup (pre-deployment)
2. Revert git commits if needed:
   ```bash
   git log --oneline -10
   git revert [commit-hash]
   ```
3. Review error logs
4. Fix issues in development
5. Re-test before redeploying

### Common Issues:

**Issue: 404 on renamed file**
- **Cause:** 301 redirect not configured
- **Fix:** Add .htaccess or nginx redirect

**Issue: Korean font not loading**
- **Cause:** Google Fonts blocked or incorrect link
- **Fix:** Verify Google Fonts CDN accessible from Korea, check font URL

**Issue: Font rendering looks wrong**
- **Cause:** CSS not updated or font weights mismatch
- **Fix:** Verify CSS font-family, check weights match (300-700)

**Issue: Hreflang errors in Search Console**
- **Cause:** URL mismatch across TLDs
- **Fix:** Verify all TLDs updated with new filename

---

## 📝 POST-DEPLOYMENT TASKS

After successful deployment:

1. **Monitor for 1 week:**
   - [ ] Check Google Search Console daily
   - [ ] Check Yandex Webmaster Tools
   - [ ] Monitor Google Analytics
   - [ ] Watch for 404 errors in server logs
   - [ ] Monitor font loading performance

2. **Update sitemap:**
   - [ ] Generate new sitemap.xml with updated URLs
   - [ ] Submit to Google Search Console
   - [ ] Submit to Yandex Webmaster Tools
   - [ ] Submit to Naver Webmaster Tools (Korean search engine)

3. **Update documentation:**
   - [ ] Mark tasks as complete in this document
   - [ ] Update EXISTING-TLDS-STATUS-BRIEFING.md
   - [ ] Document any deployment issues encountered
   - [ ] Note typography improvements completed

4. **Plan next improvements:**
   - [ ] Russian copyright.html (contraco.ru)
   - [ ] German copyright.html (contraco.de) if not done
   - [ ] contraco.com development
   - [ ] Consider adding more Korean-specific optimizations

---

## 📚 REFERENCE DOCUMENTS

**For Context:**
- `EXISTING-TLDS-STATUS-BRIEFING.md` - Full audit of all international TLDs
- `NEW-TLD-SETUP-BRIEFING.md` - Guide for setting up new TLDs
- `contraco.de-DEPLOYMENT-TASKS.md` - Similar tasks for German site

**For Technical Details:**
- contraco.net files - Reference for structure
- `navigation_template.html` - Navigation standards

**For Validation:**
- Google Search Console
- Yandex Webmaster Tools
- Naver Webmaster Tools (Korea)
- Google PageSpeed Insights
- W3C HTML Validator

**Korean Font Resources:**
- Google Fonts: Noto Sans KR
- Alternative: Nanum Gothic, Spoqa Han Sans

---

## ⚡ QUICK COMMANDS REFERENCE

```bash
# Check file exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.kr/[filename].html

# Search for string
grep -r "search term" BRAND-UPDATES-INTERNATIONAL/contraco.kr/

# Count occurrences
grep -c "pattern" file.html

# Rename file with git
git mv old-name.html new-name.html

# Find and replace
sed -i 's/old-text/new-text/g' file.html

# Bulk find and replace
find BRAND-UPDATES-INTERNATIONAL/contraco.kr -name "*.html" -exec sed -i 's/old/new/g' {} \;

# Check Korean font
grep "Noto Sans KR" file.html

# Validate HTML
grep "pattern" file.html && echo "Found" || echo "Not found"

# Git status
git status

# Commit changes
git add -A && git commit -m "message"

# Push changes
git push origin HEAD
```

---

## 🎯 END OF DEPLOYMENT TASKS

**Status:** Ready for execution
**Last Updated:** 2025-11-10
**Version:** 1.0

**Next Session Instructions:**
1. Read this entire document
2. Execute tasks in order (1 → 2 → 3 → 4 → 5 → 6 → 7)
3. Check off each subtask
4. Run validation commands
5. Commit after each major task
6. Create deployment package when complete

**Key Differences from contraco.de:**
- Only 1 file to rename (not 2)
- Korean translation for copyright.html
- **Important: Typography improvements with Noto Sans KR**
- Uses contraco.co.kr domain format (not just contraco.kr)

**Questions?**
Refer to EXISTING-TLDS-STATUS-BRIEFING.md for full context.

---

**END OF DOCUMENT**
