# contraco.de Deployment Task List
## Ready-to-Execute Action Items

**Version:** 1.0
**Date:** 2025-11-10
**Target Domain:** contraco.de (German TLD)
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

**Repository Location:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de/`

---

## 📊 CURRENT STATUS

**Domain:** contraco.de
**Language:** German (lang="de")
**Current Files:** 16 HTML files
**Logo Size:** ✓ 58px (already updated)
**Brand Colors:** ✓ #C00000 (consistent)
**Missing Pages:** 1 (copyright.html)
**File Naming Issues:** 2 files need renaming
**Push Access:** ✗ READ-ONLY (changes staged for manual deployment)

---

## ⚠️ CRITICAL: BEFORE YOU START

### Prerequisites Check

- [ ] You have read access to `/home/user/contraco-net/`
- [ ] Git is configured
- [ ] You can read EXISTING-TLDS-STATUS-BRIEFING.md for context
- [ ] You understand you CANNOT push to contraco.de directly (stage for deployment)

### Branch Strategy

**Work on:** Current branch or create feature branch
**Cannot push to:** contraco.de hosting (read-only access)
**Workflow:** Commit locally → Manual deployment by team with access

---

## 📋 TASK 1: FIX FILE NAMING INCONSISTENCIES

**Priority:** CRITICAL
**Impact:** Fixes broken hreflang chains and SEO issues
**Estimated Time:** 30 minutes

### Issue Description

Two files in contraco.de have inconsistent naming compared to other TLDs:
1. `cultural-guide.html` should be `cultural-adaptation-guide.html`
2. `thankyou.html` should be `thank-you.html`

This breaks hreflang references across all domains.

---

### Task 1A: Rename cultural-guide.html

**Current File:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html`
**New Name:** `cultural-adaptation-guide.html`

#### Step 1: Verify current file exists
```bash
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html
```

**Expected Output:** File should exist

#### Step 2: Read the file to understand content
```bash
head -30 BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html
```

**Check for:**
- [ ] Canonical URL currently points to: `https://contraco.de/cultural-adaptation-guide.html` (WRONG - file doesn't match)
- [ ] Title and content are in German
- [ ] Logo size is 58px

#### Step 3: Rename the file using git
```bash
cd /home/user/contraco-net
git mv BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-adaptation-guide.html
```

**Why git mv:** Preserves git history, cleaner than rename + delete

#### Step 4: Verify the rename
```bash
git status
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-adaptation-guide.html
```

**Expected:**
- [ ] Old file marked as renamed in git status
- [ ] New file exists and is readable

#### Step 5: Check canonical URL in renamed file
```bash
grep "canonical" BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-adaptation-guide.html
```

**Expected:** Should show `https://contraco.de/cultural-adaptation-guide.html`
**Status:** ✓ Already correct in file content

---

### Task 1B: Rename thankyou.html

**Current File:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de/thankyou.html`
**New Name:** `thank-you.html`

#### Step 1: Verify current file exists
```bash
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/thankyou.html
```

#### Step 2: Rename the file using git
```bash
git mv BRAND-UPDATES-INTERNATIONAL/contraco.de/thankyou.html BRAND-UPDATES-INTERNATIONAL/contraco.de/thank-you.html
```

#### Step 3: Verify the rename
```bash
git status
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/thank-you.html
```

#### Step 4: Check if canonical URL needs updating
```bash
grep "canonical" BRAND-UPDATES-INTERNATIONAL/contraco.de/thank-you.html
```

**Look for:** Canonical should reference `thank-you.html` (with hyphen)
**If it says `thankyou.html`:** Update using Edit tool

---

### Task 1C: Update Internal Links in contraco.de

**Files that may reference the old names:**

Search for references to old filenames:
```bash
grep -r "cultural-guide.html" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html
grep -r "thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html
```

**Action for each match found:**
- [ ] Use Edit tool to update reference from `cultural-guide.html` → `cultural-adaptation-guide.html`
- [ ] Use Edit tool to update reference from `thankyou.html` → `thank-you.html`

**Common locations:**
- Navigation menus
- Footer links
- CTA buttons
- Language switcher

---

### Task 1D: Update Hreflang References Across ALL TLDs

**IMPORTANT:** All domains reference each other via hreflang tags. We need to update references in ALL TLDs.

#### Files to update:

**In contraco.net (main site):**
```bash
grep -l "contraco.de/cultural-guide.html" *.html
grep -l "contraco.de/thankyou.html" *.html
```

For each file found:
- [ ] Edit hreflang tag: `contraco.de/cultural-guide.html` → `contraco.de/cultural-adaptation-guide.html`
- [ ] Edit hreflang tag: `contraco.de/thankyou.html` → `contraco.de/thank-you.html`

**In contraco.kr:**
```bash
grep -l "contraco.de/cultural-guide.html" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html
grep -l "contraco.de/thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html
```

Update same patterns.

**In contraco.ru:**
```bash
grep -l "contraco.de/cultural-guide.html" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html
grep -l "contraco.de/thankyou.html" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html
```

Update same patterns.

#### Automated approach (if many files):
```bash
# Update cultural-guide references across all HTML files
find . -name "*.html" -type f -exec sed -i 's|contraco\.de/cultural-guide\.html|contraco.de/cultural-adaptation-guide.html|g' {} \;

# Update thankyou references across all HTML files
find . -name "*.html" -type f -exec sed -i 's|contraco\.de/thankyou\.html|contraco.de/thank-you.html|g' {} \;
```

**Validation:**
```bash
# Should return 0 results
grep -r "contraco.de/cultural-guide.html" --include="*.html" .
grep -r "contraco.de/thankyou.html" --include="*.html" .
```

---

### Task 1E: Validation for Task 1

Run these commands to verify all changes:

```bash
# 1. Old files should NOT exist
ls BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html 2>&1
ls BRAND-UPDATES-INTERNATIONAL/contraco.de/thankyou.html 2>&1
# Expected: "No such file or directory"

# 2. New files SHOULD exist
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-adaptation-guide.html
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/thank-you.html
# Expected: Files exist

# 3. No references to old names should remain
grep -r "cultural-guide\.html" --include="*.html" . | grep -v "cultural-adaptation-guide"
grep -r "thankyou\.html" --include="*.html" . | grep -v "thank-you"
# Expected: No results

# 4. Git status should show renames
git status
# Expected: Shows renamed files
```

### Task 1F: Commit Task 1 Changes

```bash
git add -A
git commit -m "Fix contraco.de file naming inconsistencies

Renamed files to match standard naming across all TLDs:
- cultural-guide.html → cultural-adaptation-guide.html
- thankyou.html → thank-you.html

Updated all hreflang references across contraco.net, contraco.kr,
contraco.ru to point to correct filenames.

Fixes broken hreflang chains and SEO issues.

Files affected: 2 renamed + ~20-30 hreflang updates"
```

**Task 1 Checklist:**
- [ ] cultural-guide.html renamed to cultural-adaptation-guide.html
- [ ] thankyou.html renamed to thank-you.html
- [ ] Internal links updated in contraco.de
- [ ] Hreflang tags updated across all TLDs
- [ ] Validation commands pass
- [ ] Changes committed

---

## 📋 TASK 2: CREATE MISSING copyright.html PAGE

**Priority:** HIGH
**Impact:** Completes site structure, provides required legal information
**Estimated Time:** 45 minutes

### Issue Description

`copyright.html` exists in contraco.net but is missing from contraco.de, contraco.kr, and contraco.ru.

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
- Sections that need translation
- Sections that should remain in English (e.g., legal entity names)
- Navigation links
- Footer content

---

### Task 2B: Create German Translation

**File to create:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html`

#### Translation Guidelines:

**Keep in English:**
- Company name: "contraco"
- Legal entity names
- Trademark: "The Resonance Method™"
- URLs and email addresses
- Address: "1209 10th Ln., Ava, MO 65608, United States"

**Translate to German:**
- Page title
- Section headings
- Body text
- Navigation labels
- Legal text

**Key Terms:**
- Copyright → Urheberrecht
- All rights reserved → Alle Rechte vorbehalten
- Trademark → Markenzeichen
- Intellectual Property → Geistiges Eigentum

#### Step 1: Use Write tool to create the file

**Base structure** (adapt from contraco.net/copyright.html):

```html
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Urheberrecht und Markenzeichen | contraco</title>

    <!-- Canonical Tag -->
    <link rel="canonical" href="https://contraco.de/copyright.html">

    <!-- Robots Meta Tag -->
    <meta name="robots" content="index, follow">

    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-868WGCC45D', {
            page_title: 'Urheberrecht - contraco',
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
    <!-- [COPY NAVIGATION FROM ANOTHER CONTRACO.DE PAGE] -->
    <!-- Ensure logo is 58px -->

    <!-- Main Content - TRANSLATE TO GERMAN -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <h1 class="hero-title">Urheberrecht und Markenzeichen</h1>
                <p class="hero-subtitle">[GERMAN TRANSLATION OF SUBTITLE]</p>
            </div>
        </section>

        <!-- [COPY AND TRANSLATE ALL SECTIONS] -->
    </main>

    <!-- [COPY FOOTER FROM ANOTHER CONTRACO.DE PAGE] -->
</body>
</html>
```

#### Step 2: Verification Checklist

After creating the file, verify:

```bash
# File exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html

# Has correct language code
grep 'lang="de"' BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html

# Has correct canonical
grep 'contraco.de/copyright.html' BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html

# Logo is 58px
grep 'height: 58px' BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html

# All hreflang tags present
grep 'hreflang=' BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html | wc -l
# Expected: 5 (x-default, en, de, ru, ko)
```

---

### Task 2C: Add copyright.html to Navigation

**Files to update:**

1. **contraco.de/navigation_template.html** (if it exists and is used)
2. Check if copyright link should be in:
   - Main navigation menu
   - Footer links
   - Both

**Common location:** Footer only

**Update footer in these files** (if copyright should be accessible):
```bash
# List all contraco.de HTML files
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v yandex | grep -v navigation_template
```

**For each file:**
- Read the footer section
- If other legal links exist (privacy, terms), add copyright link nearby
- If no legal section exists, consider adding one

**Example footer addition:**
```html
<div class="footer-links">
    <a href="https://contraco.de/">Home</a>
    <a href="https://contraco.de/about.html">Über uns</a>
    <!-- ... other links ... -->
    <a href="https://contraco.de/copyright.html">Urheberrecht</a>
</div>
```

---

### Task 2D: Update Hreflang Across TLDs

Now that contraco.de/copyright.html exists, add it to hreflang tags:

**Files to update:**

1. **contraco.net/copyright.html** - Add contraco.de reference
2. **contraco.kr/copyright.html** (if exists) - Add contraco.de reference
3. **contraco.ru/copyright.html** (if exists) - Add contraco.de reference

**Command to check:**
```bash
ls -la */copyright.html BRAND-UPDATES-INTERNATIONAL/*/copyright.html 2>/dev/null
```

**For each file found:**
- Read the hreflang section
- Ensure it includes: `<link rel="alternate" hreflang="de" href="https://contraco.de/copyright.html" />`

---

### Task 2E: Commit Task 2 Changes

```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/copyright.html
git add -u  # Add any updated hreflang references
git commit -m "Add German copyright page to contraco.de

Created translated copyright.html for contraco.de with:
- German translation of all content
- Proper hreflang configuration
- 58px logo standard
- Brand-consistent styling (#C00000 colors)
- Links to other TLD versions

Updated hreflang references across existing copyright pages.

Completes site structure and provides required legal information."
```

**Task 2 Checklist:**
- [ ] Read contraco.net/copyright.html for reference
- [ ] Created contraco.de/copyright.html with German translation
- [ ] Logo is 58px in new file
- [ ] Canonical URL is correct
- [ ] Hreflang tags complete (5 tags)
- [ ] Added to footer navigation (if appropriate)
- [ ] Updated hreflang on other TLD copyright pages
- [ ] Changes committed

---

## 📋 TASK 3: UPDATE HREFLANG REFERENCES FOR NEW FILES

**Priority:** MEDIUM
**Impact:** Ensures copyright.html is properly indexed and linked
**Estimated Time:** 20 minutes

### Issue Description

After creating copyright.html in contraco.de, we need to ensure ALL pages across ALL TLDs know about it in their hreflang tags.

---

### Task 3A: Find All Pages With copyright.html Hreflang

Some pages may already reference copyright.html in their hreflang (if they link to the English version). We need to add contraco.de to those.

```bash
# Find all pages that reference copyright.html in hreflang
grep -r "copyright.html" --include="*.html" . | grep "hreflang"
```

---

### Task 3B: Verify Hreflang Consistency

For the renamed files from Task 1, verify hreflang is now consistent:

```bash
# Check cultural-adaptation-guide.html hreflang chains
grep -r "cultural-adaptation-guide.html" --include="*.html" . | grep "hreflang" | sort -u

# Check thank-you.html hreflang chains
grep -r "thank-you.html" --include="*.html" . | grep "hreflang" | sort -u
```

**Verify:**
- [ ] All TLDs reference contraco.de with correct filename
- [ ] contraco.de references itself correctly
- [ ] No broken references to old filenames

---

### Task 3C: Validation Commands

Run comprehensive hreflang validation:

```bash
# 1. Count hreflang tags per domain (should be 5 per page)
for file in BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html; do
    count=$(grep -c "hreflang=" "$file" 2>/dev/null)
    if [ $count -ne 5 ]; then
        echo "WARNING: $file has $count hreflang tags (expected 5)"
    fi
done

# 2. Check for broken references (old filenames)
echo "Checking for old filename references..."
grep -r "cultural-guide\.html" --include="*.html" . && echo "FOUND OLD REFERENCE" || echo "✓ No old cultural-guide references"
grep -r "thankyou\.html" --include="*.html" . | grep -v "thank-you" && echo "FOUND OLD REFERENCE" || echo "✓ No old thankyou references"

# 3. Verify self-references are correct
grep 'hreflang="de"' BRAND-UPDATES-INTERNATIONAL/contraco.de/index.html
# Expected: href="https://contraco.de/"
```

---

### Task 3D: Commit Task 3 Changes (if any updates needed)

```bash
git add -u
git commit -m "Update hreflang references for contraco.de

Verified and updated hreflang tags across all TLDs to reference:
- contraco.de/cultural-adaptation-guide.html (renamed)
- contraco.de/thank-you.html (renamed)
- contraco.de/copyright.html (newly created)

All hreflang chains now complete and consistent."
```

**Task 3 Checklist:**
- [ ] Found all pages with copyright.html references
- [ ] Added contraco.de to relevant hreflang tags
- [ ] Verified cultural-adaptation-guide.html chains
- [ ] Verified thank-you.html chains
- [ ] Ran validation commands
- [ ] All hreflang counts correct (5 per page)
- [ ] No broken references found
- [ ] Changes committed (if any)

---

## 📋 TASK 4: FAVICON & ICON SETUP

**Priority:** MEDIUM
**Impact:** Ensures brand icons display correctly
**Estimated Time:** 30 minutes

### Current Status

contraco.de HTML files reference favicons like:
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<!-- etc. -->
```

These reference **root-level** favicons, not contraco.de-specific ones.

---

### Task 4A: Verify Current Favicon Setup

```bash
# Check if favicons exist in contraco.de directory
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/*.png 2>/dev/null
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/*.ico 2>/dev/null
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/*.svg 2>/dev/null
```

**Expected:** Probably no icon files (0 results)

```bash
# Check if favicons exist in root
ls -la *.png *.ico *.svg 2>/dev/null | grep -i "favicon\|apple-touch\|android-icon"
```

**Expected:** ~29 icon files

---

### Task 4B: Decision Point

**Option 1: Keep Root-Level Serving (Current Setup)**
- No action needed
- Relies on proper server configuration to serve `/favicon.ico` from root
- All TLDs share same icons

**Option 2: Copy Icons to contraco.de Directory**
- More explicit, less dependent on server config
- Allows per-TLD customization in future
- Increases file count

**Option 3: Generate New Icons for contraco.de**
- Only if rebranding with different colors
- Requires design tools or icon generator

---

### Task 4C: If Option 2 - Copy Icons to contraco.de

**Only do this if you decide favicons should be per-TLD.**

```bash
# Copy all favicon files to contraco.de directory
cp favicon*.ico BRAND-UPDATES-INTERNATIONAL/contraco.de/
cp favicon*.png BRAND-UPDATES-INTERNATIONAL/contraco.de/
cp apple-touch-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.de/
cp android-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.de/
cp mstile*.png BRAND-UPDATES-INTERNATIONAL/contraco.de/ 2>/dev/null
cp site.webmanifest BRAND-UPDATES-INTERNATIONAL/contraco.de/ 2>/dev/null
cp browserconfig.xml BRAND-UPDATES-INTERNATIONAL/contraco.de/ 2>/dev/null

# Verify copy
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/*.png | wc -l
# Expected: Should match root count
```

**Then update HTML references:**
- Change `href="/favicon.ico"` to `href="favicon.ico"` (relative)
- Change all other favicon references to relative paths
- Or keep absolute paths pointing to contraco.de

---

### Task 4D: Validate Icon References

Test that all icon references are valid:

```bash
# List all icon references in contraco.de HTML files
grep -h 'rel="icon"\|rel="apple-touch-icon"\|rel="manifest"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | sort -u
```

**Check:**
- [ ] Paths are correct (absolute or relative)
- [ ] All referenced files exist
- [ ] No 404 errors when deployed

---

### Task 4E: Commit Task 4 Changes (if any)

**If you copied icons:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/*.png
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/*.ico
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/site.webmanifest
git commit -m "Add favicon files to contraco.de directory

Copied complete favicon set (29 files) to contraco.de for
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

**Task 4 Checklist:**
- [ ] Verified current favicon setup
- [ ] Made decision: root-level or per-TLD
- [ ] If per-TLD: Copied all 29 icon files
- [ ] If per-TLD: Updated HTML references (if needed)
- [ ] Validated icon references
- [ ] Changes committed (if any)
- [ ] Documented decision

---

## 📋 TASK 5: FINAL VALIDATION & TESTING

**Priority:** CRITICAL
**Impact:** Ensures all changes work correctly
**Estimated Time:** 30 minutes

---

### Task 5A: File Structure Validation

```bash
# 1. Count HTML files in contraco.de (should be 16 after adding copyright.html)
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v yandex | wc -l
# Expected: 16

# 2. Verify critical files exist
for file in index about contact insights copyright cultural-adaptation-guide thank-you; do
    if [ -f "BRAND-UPDATES-INTERNATIONAL/contraco.de/${file}.html" ]; then
        echo "✓ ${file}.html exists"
    else
        echo "✗ ${file}.html MISSING"
    fi
done

# 3. Old files should NOT exist
ls BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html 2>&1 | grep "No such file"
ls BRAND-UPDATES-INTERNATIONAL/contraco.de/thankyou.html 2>&1 | grep "No such file"
```

---

### Task 5B: Logo Size Validation

Verify all contraco.de pages have 58px logo:

```bash
# Should return count equal to number of HTML files with navigation
grep -c "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v ":0"

# No pages should have old 36px logo
grep "height: 36px" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html
# Expected: No results
```

---

### Task 5C: Brand Consistency Validation

```bash
# 1. All pages use German language code
grep -L 'lang="de"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v yandex
# Expected: No results (all files should have lang="de")

# 2. All pages use primary red color
grep -c "#C00000" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep ":0"
# Expected: No results (all should have primary color)

# 3. All pages have Google Analytics
grep -L "G-868WGCC45D" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v yandex
# Expected: No results (all should have GA)
```

---

### Task 5D: SEO Validation

```bash
# 1. Check all canonical tags point to contraco.de
grep 'rel="canonical"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v "contraco.de" | grep -v yandex
# Expected: No results (all should point to .de domain)

# 2. Verify all pages are set to index
grep 'robots' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -v "index, follow" | grep -v yandex
# Expected: No results (all should allow indexing)

# 3. Check hreflang completeness
for file in BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html; do
    count=$(grep -c 'hreflang=' "$file")
    filename=$(basename "$file")
    if [ $count -ne 5 ] && [ "$filename" != "navigation_template.html" ] && [[ ! "$filename" =~ yandex ]]; then
        echo "⚠ $filename: $count hreflang tags (expected 5)"
    fi
done
```

---

### Task 5E: Cross-Domain Link Validation

Verify links between TLDs work correctly:

```bash
# 1. Language switcher links should point to correct TLDs
echo "=== Checking language switcher in contraco.de/index.html ==="
grep -A 1 'lang-link' BRAND-UPDATES-INTERNATIONAL/contraco.de/index.html | grep 'href='

# Expected output should show:
# - contraco.net for EN
# - contraco.de for DE (active)
# - contraco.ru for RU
# - contraco.co.kr for KO

# 2. Check for broken internal links
echo "=== Checking for potentially broken internal links ==="
grep -h 'href=".*\.html"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | grep -o 'href="[^"]*"' | sort -u

# Verify each referenced file exists
```

---

### Task 5F: Content Validation

```bash
# 1. Verify all pages have titles
for file in BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html; do
    if ! grep -q "<title>" "$file"; then
        echo "⚠ Missing title: $(basename $file)"
    fi
done

# 2. Check for English content that should be translated
echo "=== Checking for untranslated content ==="
grep -i "digital transformation" BRAND-UPDATES-INTERNATIONAL/contraco.de/index.html
# Should be German: "Digitale Transformation" or similar

# 3. Verify contact information
grep -A 5 "transformation@contraco.net" BRAND-UPDATES-INTERNATIONAL/contraco.de/contact.html
# Verify email, phone, address are present
```

---

### Task 5G: Git Status Check

```bash
# View all changes made
git status

# Review commits
git log --oneline -10

# Check what files were modified/added/renamed
git diff --name-status HEAD~5..HEAD
```

**Expected changes:**
- 2 files renamed (cultural-guide, thankyou)
- 1 file created (copyright.html)
- ~20-30 files modified (hreflang updates)
- Optional: favicon files added

---

### Task 5H: Create Summary Report

Generate a summary of all changes:

```bash
cat > /tmp/contraco-de-deployment-summary.txt << 'EOF'
# contraco.de Deployment Summary
Date: $(date)

## Files Changed:

### Renamed:
- cultural-guide.html → cultural-adaptation-guide.html
- thankyou.html → thank-you.html

### Created:
- copyright.html (German translation)

### Modified:
$(git diff --name-only HEAD~5..HEAD | grep "contraco.de" | wc -l) files in contraco.de
$(git diff --name-only HEAD~5..HEAD | wc -l) files total (including hreflang updates across TLDs)

## Validation Results:

Logo size: $(grep -l "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | wc -l) files have 58px logo
Language code: $(grep -l 'lang="de"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | wc -l) files have lang="de"
Canonical tags: $(grep -c 'rel="canonical"' BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | wc -l) present
Hreflang tags: All pages checked

## Commits Created:
$(git log --oneline HEAD~5..HEAD)

## Ready for Deployment: YES/NO
- [ ] All validations passed
- [ ] No broken links found
- [ ] SEO tags correct
- [ ] Brand consistency maintained
- [ ] Ready for manual deployment to contraco.de hosting

EOF

cat /tmp/contraco-de-deployment-summary.txt
```

---

### Task 5I: Final Checklist

**Before marking deployment ready:**

- [ ] All renamed files exist with new names
- [ ] Old filenames do not exist
- [ ] copyright.html created and translated to German
- [ ] All hreflang tags updated across all TLDs
- [ ] Logo is 58px on all contraco.de pages
- [ ] Brand colors consistent (#C00000)
- [ ] All canonical URLs correct (point to contraco.de)
- [ ] Language code is "de" on all pages
- [ ] Google Analytics ID present (G-868WGCC45D)
- [ ] No broken internal links
- [ ] All validation commands pass
- [ ] Git commits created with clear messages
- [ ] Summary report generated

---

## 📋 TASK 6: PREPARE FOR MANUAL DEPLOYMENT

**Priority:** CRITICAL
**Impact:** Ensures changes can be deployed to live contraco.de
**Estimated Time:** 20 minutes

### Task 6A: Create Deployment Package

Since you cannot push directly to contraco.de, create a deployment package:

```bash
# Create deployment directory
mkdir -p /tmp/contraco-de-deployment

# Copy all contraco.de files
cp -r BRAND-UPDATES-INTERNATIONAL/contraco.de/* /tmp/contraco-de-deployment/

# List what's in deployment package
ls -la /tmp/contraco-de-deployment/

# Count files
echo "Total HTML files: $(ls -1 /tmp/contraco-de-deployment/*.html | wc -l)"
echo "Total PNG files: $(ls -1 /tmp/contraco-de-deployment/*.png 2>/dev/null | wc -l)"
echo "Total ICO files: $(ls -1 /tmp/contraco-de-deployment/*.ico 2>/dev/null | wc -l)"
```

---

### Task 6B: Create Deployment Instructions

```bash
cat > /tmp/contraco-de-deployment/DEPLOYMENT-INSTRUCTIONS.md << 'EOF'
# contraco.de Deployment Instructions

## Changes Summary:
1. **Renamed Files:**
   - cultural-guide.html → cultural-adaptation-guide.html
   - thankyou.html → thank-you.html

2. **New Files:**
   - copyright.html (German translation)

3. **Modified Files:**
   - ~14 files (hreflang updates)

## Pre-Deployment Checklist:
- [ ] Backup current contraco.de site
- [ ] Set up 301 redirects:
  - /cultural-guide.html → /cultural-adaptation-guide.html
  - /thankyou.html → /thank-you.html
- [ ] Test redirects on staging (if available)

## Deployment Steps:
1. Upload all files to contraco.de hosting
2. Overwrite existing files
3. Verify renamed files are accessible
4. Verify new copyright.html loads
5. Test 301 redirects work
6. Check logo displays at 58px
7. Test navigation and all internal links
8. Verify language switcher works
9. Submit updated sitemap to Google Search Console
10. Monitor Google Analytics for errors

## Post-Deployment Testing:
- [ ] Visit https://contraco.de/cultural-adaptation-guide.html (should work)
- [ ] Visit https://contraco.de/cultural-guide.html (should redirect)
- [ ] Visit https://contraco.de/thank-you.html (should work)
- [ ] Visit https://contraco.de/thankyou.html (should redirect)
- [ ] Visit https://contraco.de/copyright.html (should work)
- [ ] Check language switcher on all pages
- [ ] Verify hreflang tags with Google Search Console
- [ ] Run Lighthouse audit

## Rollback Plan:
If issues occur:
1. Restore from backup
2. Review error logs
3. Test fixes on staging
4. Retry deployment

## Contact:
If questions arise during deployment, refer to:
- EXISTING-TLDS-STATUS-BRIEFING.md (full context)
- contraco.de-DEPLOYMENT-TASKS.md (this checklist)

Deployment prepared: $(date)
EOF

cat /tmp/contraco-de-deployment/DEPLOYMENT-INSTRUCTIONS.md
```

---

### Task 6C: Create 301 Redirect Configuration

**Apache (.htaccess):**
```bash
cat > /tmp/contraco-de-deployment/.htaccess << 'EOF'
# contraco.de 301 Redirects for renamed files
RewriteEngine On

# Redirect old cultural-guide.html to new filename
RewriteRule ^cultural-guide\.html$ /cultural-adaptation-guide.html [R=301,L]

# Redirect old thankyou.html to new filename
RewriteRule ^thankyou\.html$ /thank-you.html [R=301,L]
EOF
```

**Nginx (add to server block):**
```bash
cat > /tmp/contraco-de-deployment/nginx-redirects.conf << 'EOF'
# contraco.de 301 Redirects for renamed files

location = /cultural-guide.html {
    return 301 /cultural-adaptation-guide.html;
}

location = /thankyou.html {
    return 301 /thank-you.html;
}
EOF
```

---

### Task 6D: Commit Final Changes

```bash
git add -A
git commit -m "Prepare contraco.de for deployment

Completed all deployment tasks:
✓ Fixed file naming inconsistencies
✓ Created missing copyright.html
✓ Updated all hreflang references
✓ Verified favicon setup
✓ Validated all changes
✓ Created deployment package and instructions

Files ready for manual deployment to contraco.de hosting.

Includes 301 redirect configurations for Apache and Nginx.

Changes affect: 2 renamed + 1 new + ~14 modified files"
```

---

### Task 6E: Push to Repository

```bash
# Push to current branch
git push origin HEAD
```

**If you encounter issues:**
- You may not have direct push access
- Alternative: Create a pull request for team review
- Provide link to this deployment task document

---

### Task 6F: Create Deployment Notification

```bash
cat > /tmp/deployment-notification.txt << 'EOF'
SUBJECT: contraco.de Deployment Ready - File Naming Fixes & New Copyright Page

Hi Team,

contraco.de updates are ready for deployment. All changes have been validated and tested locally.

SUMMARY OF CHANGES:
• Renamed 2 files to fix naming inconsistencies
• Added missing copyright.html page (German translation)
• Updated ~14 files with corrected hreflang references
• Verified logo at 58px across all pages
• Brand consistency maintained

DEPLOYMENT PACKAGE:
Location: /tmp/contraco-de-deployment/
Files: 16 HTML files + icons (if included)
Instructions: See DEPLOYMENT-INSTRUCTIONS.md

CRITICAL: 301 Redirects Required
• /cultural-guide.html → /cultural-adaptation-guide.html
• /thankyou.html → /thank-you.html

Redirect configs provided for both Apache (.htaccess) and Nginx.

TESTING CHECKLIST:
Complete post-deployment testing checklist provided in deployment instructions.

DOCUMENTATION:
• Full context: EXISTING-TLDS-STATUS-BRIEFING.md
• Task details: contraco.de-DEPLOYMENT-TASKS.md
• Deployment instructions: DEPLOYMENT-INSTRUCTIONS.md

Git commits: [Link to commits]
Ready for deployment: YES

Questions? See deployment documentation or contact [your name/role].

Prepared: $(date)
EOF

cat /tmp/deployment-notification.txt
```

---

**Task 6 Checklist:**
- [ ] Deployment package created
- [ ] Deployment instructions written
- [ ] 301 redirect configs created (Apache & Nginx)
- [ ] All changes committed to git
- [ ] Changes pushed to repository
- [ ] Deployment notification prepared
- [ ] Team notified (if applicable)

---

## ✅ COMPLETION CHECKLIST

### All Tasks Completed:

- [ ] **Task 1:** File naming inconsistencies fixed
  - [ ] cultural-guide.html renamed
  - [ ] thankyou.html renamed
  - [ ] All hreflang references updated

- [ ] **Task 2:** Missing copyright.html page created
  - [ ] Translated to German
  - [ ] Added to site structure
  - [ ] Hreflang tags updated

- [ ] **Task 3:** Hreflang references validated
  - [ ] All cross-domain links verified
  - [ ] No broken references found

- [ ] **Task 4:** Favicon setup verified
  - [ ] Decision made (root-level or per-TLD)
  - [ ] Icons validated

- [ ] **Task 5:** Final validation completed
  - [ ] All validation commands passed
  - [ ] Summary report generated

- [ ] **Task 6:** Deployment package prepared
  - [ ] Package created
  - [ ] Instructions written
  - [ ] Redirects configured
  - [ ] Team notified

---

## 📊 SUCCESS METRICS

After deployment, verify these metrics:

**SEO:**
- [ ] All hreflang errors resolved in Google Search Console
- [ ] 301 redirects working (no 404s for old URLs)
- [ ] copyright.html page indexed

**Technical:**
- [ ] All pages load successfully
- [ ] Logo displays at 58px
- [ ] No JavaScript errors
- [ ] Page load time < 3 seconds

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

**Issue: 404 on renamed files**
- **Cause:** 301 redirects not configured
- **Fix:** Add .htaccess or nginx redirects

**Issue: Hreflang errors in Search Console**
- **Cause:** URL mismatch across TLDs
- **Fix:** Verify all TLDs updated with new filenames

**Issue: Logo not displaying**
- **Cause:** Wrong file path after deployment
- **Fix:** Check logo CDN URL or copy logo locally

---

## 📝 POST-DEPLOYMENT TASKS

After successful deployment:

1. **Monitor for 1 week:**
   - [ ] Check Google Search Console daily
   - [ ] Monitor Google Analytics
   - [ ] Watch for 404 errors in server logs

2. **Update sitemap:**
   - [ ] Generate new sitemap.xml with updated URLs
   - [ ] Submit to Google Search Console
   - [ ] Submit to Yandex Webmaster Tools

3. **Update documentation:**
   - [ ] Mark tasks as complete in this document
   - [ ] Update EXISTING-TLDS-STATUS-BRIEFING.md
   - [ ] Document any deployment issues encountered

4. **Plan next improvements:**
   - [ ] Korean font optimization (contraco.kr)
   - [ ] Russian copyright.html (contraco.ru)
   - [ ] Korean copyright.html (contraco.kr)
   - [ ] contraco.com development

---

## 📚 REFERENCE DOCUMENTS

**For Context:**
- `EXISTING-TLDS-STATUS-BRIEFING.md` - Full audit of all international TLDs
- `NEW-TLD-SETUP-BRIEFING.md` - Guide for setting up new TLDs

**For Technical Details:**
- contraco.net files - Reference for structure
- `navigation_template.html` - Navigation standards

**For Validation:**
- Google Search Console
- Google PageSpeed Insights
- W3C HTML Validator

---

## ⚡ QUICK COMMANDS REFERENCE

```bash
# Check file exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.de/[filename].html

# Search for string
grep -r "search term" BRAND-UPDATES-INTERNATIONAL/contraco.de/

# Count occurrences
grep -c "pattern" file.html

# Rename file with git
git mv old-name.html new-name.html

# Find and replace
sed -i 's/old-text/new-text/g' file.html

# Bulk find and replace
find . -name "*.html" -exec sed -i 's/old/new/g' {} \;

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
2. Execute tasks in order (1 → 2 → 3 → 4 → 5 → 6)
3. Check off each subtask
4. Run validation commands
5. Commit after each major task
6. Create deployment package when complete

**Questions?**
Refer to EXISTING-TLDS-STATUS-BRIEFING.md for full context.

---

**END OF DOCUMENT**
