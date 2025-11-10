# contraco.ru Deployment Task List
## Ready-to-Execute Action Items

**Version:** 1.0
**Date:** 2025-11-10
**Target Domain:** contraco.ru (Russian TLD)
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

**Repository Location:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.ru/`

---

## 📊 CURRENT STATUS

**Domain:** contraco.ru
**Language:** Russian (lang="ru")
**Current Files:** 16 HTML files (including css_base_styles.html)
**Logo Size:** ✓ 58px (already updated)
**Brand Colors:** ✓ #C00000 (consistent)
**Missing Pages:** 1 (copyright.html)
**File Naming Issues:** ✓ NONE - All filenames are correct!
**Extra File:** css_base_styles.html (investigate purpose)
**Typography:** ✓ Inter font has good Cyrillic support (acceptable)
**Push Access:** ✗ READ-ONLY (changes staged for manual deployment)

---

## 🎉 GOOD NEWS: contraco.ru Status

contraco.ru is the **cleanest** of all international TLDs:
- ✓ All filenames are correct (thank-you.html, cultural-adaptation-guide.html)
- ✓ No files need renaming
- ✓ Typography is acceptable (Inter supports Cyrillic well)
- ⚠️ Only missing copyright.html

**Main Task:** Create Russian copyright.html page
**Optional:** Investigate css_base_styles.html purpose

---

## ⚠️ CRITICAL: BEFORE YOU START

### Prerequisites Check

- [ ] You have read access to `/home/user/contraco-net/`
- [ ] Git is configured
- [ ] You can read EXISTING-TLDS-STATUS-BRIEFING.md for context
- [ ] You understand you CANNOT push to contraco.ru directly (stage for deployment)

### Branch Strategy

**Work on:** Current branch or create feature branch
**Cannot push to:** contraco.ru hosting (read-only access)
**Workflow:** Commit locally → Manual deployment by team with access

---

## 📋 TASK 1: CREATE MISSING copyright.html PAGE (RUSSIAN)

**Priority:** HIGH
**Impact:** Completes site structure, provides required legal information
**Estimated Time:** 60 minutes (translation to Russian required)

### Issue Description

`copyright.html` exists in contraco.net but is missing from contraco.ru (and .de, .kr).

**Good News:** No file renaming needed! contraco.ru uses correct filenames.

---

### Task 1A: Read the English Source File

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
- Sections that need translation to Russian
- Sections that should remain in English (e.g., legal entity names)
- Navigation links
- Footer content

---

### Task 1B: Create Russian Translation

**File to create:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html`

#### Translation Guidelines:

**Keep in English:**
- Company name: "contraco"
- Legal entity names
- Trademark: "The Resonance Method™"
- URLs and email addresses
- Address: "1209 10th Ln., Ava, MO 65608, United States"

**Translate to Russian:**
- Page title
- Section headings
- Body text
- Navigation labels
- Legal text

**Key Terms (Russian - Cyrillic):**
- Copyright → Авторские права (Avtorskiye prava)
- All rights reserved → Все права защищены (Vse prava zashchishcheny)
- Trademark → Товарный знак (Tovarnyy znak)
- Intellectual Property → Интеллектуальная собственность (Intellektual'naya sobstvennost')

#### Step 1: Use Write tool to create the file

**Base structure** (adapt from contraco.net/copyright.html):

```html
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторские права и товарные знаки | contraco</title>

    <!-- Canonical Tag -->
    <link rel="canonical" href="https://contraco.ru/copyright.html">

    <!-- Robots Meta Tag -->
    <meta name="robots" content="index, follow">

    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-868WGCC45D', {
            page_title: 'Авторские права - contraco',
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
    <!-- [COPY NAVIGATION FROM ANOTHER CONTRACO.RU PAGE] -->
    <!-- Ensure logo is 58px -->

    <!-- Main Content - TRANSLATE TO RUSSIAN -->
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <h1 class="hero-title">Авторские права и товарные знаки</h1>
                <p class="hero-subtitle">[RUSSIAN TRANSLATION OF SUBTITLE]</p>
            </div>
        </section>

        <!-- [COPY AND TRANSLATE ALL SECTIONS] -->
    </main>

    <!-- [COPY FOOTER FROM ANOTHER CONTRACO.RU PAGE] -->
</body>
</html>
```

#### Step 2: Verification Checklist

After creating the file, verify:

```bash
# File exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html

# Has correct language code
grep 'lang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html

# Has correct canonical
grep 'contraco.ru/copyright.html' BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html

# Logo is 58px
grep 'height: 58px' BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html

# All hreflang tags present
grep 'hreflang=' BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html | wc -l
# Expected: 5 (x-default, en, de, ru, ko)

# Contains Russian (Cyrillic) text
grep 'Авторские права' BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html
```

---

### Task 1C: Add copyright.html to Navigation

**Files to update:**

Check if copyright link should be in:
- Main navigation menu
- Footer links
- Both

**Common location:** Footer only

**Update footer in these files** (if copyright should be accessible):
```bash
# List all contraco.ru HTML files
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v yandex | grep -v css_base_styles
```

**For each file:**
- Read the footer section
- If other legal links exist (privacy, terms), add copyright link nearby
- If no legal section exists, consider adding one

**Example footer addition (Russian):**
```html
<div class="footer-links">
    <a href="https://contraco.ru/">Главная</a>
    <a href="https://contraco.ru/about.html">О нас</a>
    <!-- ... other links ... -->
    <a href="https://contraco.ru/copyright.html">Авторские права</a>
</div>
```

---

### Task 1D: Update Hreflang Across TLDs

Now that contraco.ru/copyright.html exists, add it to hreflang tags:

**Files to update:**

1. **contraco.net/copyright.html** - Add contraco.ru reference
2. **contraco.de/copyright.html** (if exists from previous work) - Add contraco.ru reference
3. **contraco.kr/copyright.html** (if exists from previous work) - Add contraco.ru reference

**Command to check:**
```bash
ls -la */copyright.html BRAND-UPDATES-INTERNATIONAL/*/copyright.html 2>/dev/null
```

**For each file found:**
- Read the hreflang section
- Ensure it includes: `<link rel="alternate" hreflang="ru" href="https://contraco.ru/copyright.html" />`

---

### Task 1E: Commit Task 1 Changes

```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html
git add -u  # Add any updated hreflang references
git commit -m "Add Russian copyright page to contraco.ru

Created translated copyright.html for contraco.ru with:
- Russian (Cyrillic) translation of all content
- Proper hreflang configuration
- 58px logo standard
- Brand-consistent styling (#C00000 colors)
- Links to other TLD versions

Updated hreflang references across existing copyright pages.

Completes site structure and provides required legal information.

Note: contraco.ru already has correct file naming (no renames needed)."
```

**Task 1 Checklist:**
- [ ] Read contraco.net/copyright.html for reference
- [ ] Created contraco.ru/copyright.html with Russian translation
- [ ] Logo is 58px in new file
- [ ] Canonical URL is correct (contraco.ru)
- [ ] Hreflang tags complete (5 tags)
- [ ] Contains Russian (Cyrillic) text
- [ ] Added to footer navigation (if appropriate)
- [ ] Updated hreflang on other TLD copyright pages
- [ ] Changes committed

---

## 📋 TASK 2: INVESTIGATE css_base_styles.html

**Priority:** LOW
**Impact:** Understanding site structure and cleanup if needed
**Estimated Time:** 15 minutes

### Issue Description

contraco.ru has a file called `css_base_styles.html` that doesn't exist in other TLDs (.net, .de, .kr).

**Purpose:** Determine if this file is:
- A template/reference file (should be kept)
- A documentation file (should be kept)
- An unused file (should be removed)
- A useful file (should be added to other TLDs)

---

### Task 2A: Read and Analyze the File

```bash
# Check file exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/css_base_styles.html

# Read the entire file
cat BRAND-UPDATES-INTERNATIONAL/contraco.ru/css_base_styles.html
```

**Analyze:**
- [ ] What is the purpose of this file?
- [ ] Is it a complete HTML page or a code snippet?
- [ ] Does it have navigation/header/footer?
- [ ] Is it linked from other pages?
- [ ] Does it contain documentation or actual styles?

---

### Task 2B: Check for References

Search if other pages link to this file:

```bash
# Search for references in contraco.ru
grep -r "css_base_styles" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v "css_base_styles.html:"

# Search for references across all TLDs
grep -r "css_base_styles" --include="*.html" . | grep -v "contraco.ru/css_base_styles.html"
```

**Expected:**
- If no results: File is not linked, may be safe to remove or keep as reference
- If results found: File is actively used, should be kept

---

### Task 2C: Check Similar Files in Other TLDs

```bash
# Check if .com has similar file
ls BRAND-UPDATES-INTERNATIONAL/contraco.com/css_base_styles.html 2>/dev/null && echo "contraco.com has it" || echo "contraco.com does not have it"

# List all unique filenames in contraco.ru vs contraco.de
diff <(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | xargs -n1 basename | sort) <(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.de/*.html | xargs -n1 basename | sort)
```

---

### Task 2D: Decision Point

**Based on analysis, choose one:**

**Option 1: Keep as-is**
- If it's a useful template or documentation
- Document its purpose in a comment or README
- No action needed

**Option 2: Remove the file**
- If it's unused and not referenced
- If it's outdated or redundant
- Use git rm to remove

**Option 3: Add to other TLDs**
- If it's useful and should be standardized
- Copy to .de, .kr, .net

**To remove (if Option 2):**
```bash
git rm BRAND-UPDATES-INTERNATIONAL/contraco.ru/css_base_styles.html
```

---

### Task 2E: Commit Task 2 Changes (if any)

**If removed:**
```bash
git commit -m "Remove unused css_base_styles.html from contraco.ru

File analysis showed:
- Not referenced by any other pages
- Not present in other TLDs
- Appears to be unused template/reference

Removed for consistency with contraco.de, contraco.kr, contraco.net.

If needed in future, can be restored from git history."
```

**If keeping:**
```bash
# No commit needed, but document decision
echo "Decision: Keep css_base_styles.html as [describe purpose]" >> /tmp/contraco-ru-notes.txt
```

**Task 2 Checklist:**
- [ ] Read and analyzed css_base_styles.html
- [ ] Checked for references from other pages
- [ ] Compared with other TLDs
- [ ] Made decision: keep, remove, or standardize
- [ ] Executed decision (if removing or adding)
- [ ] Changes committed (if any)
- [ ] Documented decision

---

## 📋 TASK 3: OPTIONAL TYPOGRAPHY ENHANCEMENT

**Priority:** LOW (Inter already has good Cyrillic support)
**Impact:** Potentially improved readability for Russian users
**Estimated Time:** 45 minutes

### Current Status

contraco.ru currently uses Inter font for all text. Inter has **excellent Cyrillic support** and is widely used for Russian content.

**This task is OPTIONAL.** Only proceed if you want to optimize further.

---

### Task 3A: Evaluate Current Typography

```bash
# Check current font configuration
grep -A 5 "font-family" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html | head -20
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

**Assessment:**
- ✓ Inter has full Cyrillic character support
- ✓ Widely used for Russian web content
- ✓ Excellent readability
- ⚠️ Could optionally add Noto Sans for consistency with .kr

---

### Task 3B: Decision Point

**Option 1: Keep Inter (Recommended)**
- Inter is already excellent for Cyrillic
- No changes needed
- Maintains current performance
- Skip to Task 4

**Option 2: Add Noto Sans for Consistency**
- Matches contraco.kr approach
- Adds slight file size overhead
- May provide marginally better rendering on some devices

**Recommendation:** **Option 1 - Keep Inter**

---

### Task 3C: If Option 2 - Add Noto Sans (Optional)

**Only proceed if you chose Option 2.**

#### Step 1: Update Google Fonts link

```bash
# Add Noto Sans to font link
find BRAND-UPDATES-INTERNATIONAL/contraco.ru -name "*.html" -type f -exec sed -i 's|family=Inter:wght@300;400;500;600;700&display=swap|family=Inter:wght@300;400;500;600;700\&family=Noto+Sans:wght@300;400;500;600;700\&display=swap|g' {} \;
```

#### Step 2: Update CSS font stack

```bash
# Update font-sans variable
find BRAND-UPDATES-INTERNATIONAL/contraco.ru -name "*.html" -type f -exec sed -i "s|--font-sans: 'Inter',|--font-sans: 'Noto Sans', 'Inter',|g" {} \;
```

#### Step 3: Validate

```bash
# Verify Noto Sans added
grep "Noto+Sans" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html
grep "font-sans:.*Noto Sans" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html
```

---

### Task 3D: Commit Task 3 Changes (if any)

**If added Noto Sans:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/
git commit -m "Add Noto Sans to contraco.ru typography (optional enhancement)

Added Noto Sans as primary font for consistency with contraco.kr:
- Inter remains as excellent Cyrillic fallback
- Both fonts have full Cyrillic support
- Maintains brand consistency across international TLDs

Note: This is an optional enhancement - Inter alone is excellent for Russian."
```

**If keeping Inter:**
```bash
# No commit needed
echo "✓ Decision: Keep Inter font (already excellent for Cyrillic)"
```

**Task 3 Checklist:**
- [ ] Evaluated current typography
- [ ] Made decision: keep Inter or add Noto Sans
- [ ] If adding: Updated Google Fonts link
- [ ] If adding: Updated CSS variables
- [ ] If adding: Validated changes
- [ ] Changes committed (if any)

---

## 📋 TASK 4: UPDATE HREFLANG REFERENCES

**Priority:** MEDIUM
**Impact:** Ensures all cross-TLD references are correct
**Estimated Time:** 20 minutes

### Issue Description

After creating copyright.html, verify all hreflang chains are complete and consistent.

**Good News:** contraco.ru uses correct filenames, so fewer updates needed!

---

### Task 4A: Verify Hreflang Consistency

```bash
# Check copyright.html hreflang chains
grep -r "copyright.html" --include="*.html" . | grep "hreflang" | grep "contraco.ru" | sort -u

# Verify contraco.ru self-references are correct
grep 'hreflang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html
# Expected: href="https://contraco.ru/"
```

**Verify:**
- [ ] All TLDs reference contraco.ru/copyright.html
- [ ] contraco.ru references itself correctly
- [ ] All filenames use correct hyphenation (thank-you, cultural-adaptation-guide)

---

### Task 4B: Count Hreflang Tags Per Page

Every page should have 5 hreflang tags (x-default, en, de, ru, ko):

```bash
for file in BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html; do
    filename=$(basename "$file")
    if [[ ! "$filename" =~ yandex ]] && [[ "$filename" != "css_base_styles.html" ]]; then
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

Ensure contraco.ru pages use correct domain format:

```bash
# Check self-references
grep 'hreflang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v "contraco.ru" | grep -v yandex
# Expected: No results (all should use contraco.ru)

# Check format consistency
grep -h 'hreflang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | head -5
# Should all show: href="https://contraco.ru/..."
```

---

### Task 4D: Fix Any Inconsistencies

If validation finds issues:

**If hreflang count is wrong on some pages:**
- Read the file
- Check which hreflang tags are missing
- Use Edit tool to add missing tags

**Common pattern for complete hreflang:**
```html
<link rel="alternate" href="https://contraco.net/[page].html" hreflang="x-default" />
<link rel="alternate" hreflang="en" href="https://contraco.net/[page].html" />
<link rel="alternate" hreflang="de" href="https://contraco.de/[page].html" />
<link rel="alternate" hreflang="ru" href="https://contraco.ru/[page].html" />
<link rel="alternate" hreflang="ko" href="https://contraco.co.kr/[page].html" />
```

---

### Task 4E: Commit Task 4 Changes (if any updates needed)

```bash
git add -u
git commit -m "Verify and update hreflang references for contraco.ru

Validated hreflang tags across all contraco.ru pages:
- copyright.html references added (new file)
- All pages have complete 5-tag hreflang sets
- Consistent domain format (contraco.ru)

All hreflang chains now complete and consistent.

Note: contraco.ru already uses correct file naming (no updates needed)."
```

**Task 4 Checklist:**
- [ ] Verified copyright.html hreflang chains
- [ ] Counted hreflang tags per page (should be 5)
- [ ] Validated domain format (contraco.ru)
- [ ] Fixed any inconsistencies found
- [ ] Changes committed (if any)

---

## 📋 TASK 5: FAVICON & ICON SETUP

**Priority:** MEDIUM
**Impact:** Ensures brand icons display correctly
**Estimated Time:** 30 minutes

### Current Status

contraco.ru HTML files reference favicons like:
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<!-- etc. -->
```

These reference **root-level** favicons, not contraco.ru-specific ones.

---

### Task 5A: Verify Current Favicon Setup

```bash
# Check if favicons exist in contraco.ru directory
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.png 2>/dev/null | head -10
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.ico 2>/dev/null
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.svg 2>/dev/null
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

**Option 2: Copy Icons to contraco.ru Directory**
- More explicit, less dependent on server config
- Allows per-TLD customization in future
- Increases file count

**Option 3: Generate New Icons for contraco.ru**
- Only if rebranding with different colors
- Requires design tools or icon generator

**Recommendation:** Option 2 (copy icons) for consistency with .de and .kr

---

### Task 5C: If Option 2 - Copy Icons to contraco.ru

**Only do this if you decide favicons should be per-TLD.**

```bash
# Copy all favicon files to contraco.ru directory
cp favicon*.ico BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp favicon*.png BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp apple-touch-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp android-icon*.png BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp mstile*.png BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp site.webmanifest BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null
cp browserconfig.xml BRAND-UPDATES-INTERNATIONAL/contraco.ru/ 2>/dev/null

# Verify copy
echo "Copied $(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.png 2>/dev/null | wc -l) PNG files"
echo "Copied $(ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.ico 2>/dev/null | wc -l) ICO files"
```

**Expected counts:**
- PNG files: ~20 (apple-touch, android, favicons, mstile)
- ICO files: 1 (favicon.ico)

---

### Task 5D: Validate Icon References

Test that all icon references are valid:

```bash
# List all icon references in contraco.ru HTML files
grep -h 'rel="icon"\|rel="apple-touch-icon"\|rel="manifest"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | sort -u
```

**Check:**
- [ ] Paths are correct (absolute or relative)
- [ ] All referenced files exist (or will after copy)
- [ ] No 404 errors expected

---

### Task 5E: Commit Task 5 Changes (if any)

**If you copied icons:**
```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.png
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.ico
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/site.webmanifest 2>/dev/null
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/browserconfig.xml 2>/dev/null
git commit -m "Add favicon files to contraco.ru directory

Copied complete favicon set (29 files) to contraco.ru for
explicit control over brand icons:
- favicon.ico and PNG variants
- Apple touch icons (9 sizes)
- Android icons (5 sizes)
- MS tile icons
- Web manifest

Maintains consistency with contraco.de and contraco.kr approach."
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
# 1. Count HTML files in contraco.ru
# Expected: 16 if keeping css_base_styles, 15 if removed, +1 if added copyright = 16 or 17
ls -1 BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v yandex | wc -l

# 2. Verify critical files exist
for file in index about contact insights copyright cultural-adaptation-guide thank-you; do
    if [ -f "BRAND-UPDATES-INTERNATIONAL/contraco.ru/${file}.html" ]; then
        echo "✓ ${file}.html exists"
    else
        echo "✗ ${file}.html MISSING"
    fi
done

# 3. Check css_base_styles decision
if [ -f "BRAND-UPDATES-INTERNATIONAL/contraco.ru/css_base_styles.html" ]; then
    echo "ℹ css_base_styles.html present (kept)"
else
    echo "ℹ css_base_styles.html removed"
fi

# 4. Verify correct filenames (no old patterns)
ls BRAND-UPDATES-INTERNATIONAL/contraco.ru/ | grep -E "(thankyou|cultural-guide)\.html" && echo "⚠ Old filename pattern found" || echo "✓ All filenames correct"
```

---

### Task 6B: Logo Size Validation

Verify all contraco.ru pages have 58px logo:

```bash
# Should return count equal to number of HTML files with navigation
grep -c "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v ":0" | wc -l

# No pages should have old 36px logo
grep "height: 36px" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html && echo "⚠ Found old logo size" || echo "✓ All logos 58px"
```

---

### Task 6C: Brand Consistency Validation

```bash
# 1. All pages use Russian language code
grep -L 'lang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v yandex | grep -v css_base
# Expected: No results (all files should have lang="ru")

# 2. All pages use primary red color
grep "#C00000" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html && echo "✓ Primary color present"

# 3. All pages have Google Analytics
grep -L "G-868WGCC45D" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v yandex | grep -v css_base
# Expected: No results (all should have GA)

# 4. Check for Russian (Cyrillic) content
grep -q '[А-Яа-я]' BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html && echo "✓ Russian content present"
```

---

### Task 6D: SEO Validation

```bash
# 1. Check all canonical tags point to contraco.ru
grep 'rel="canonical"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v "contraco.ru" | grep -v yandex | grep -v css_base
# Expected: No results (all should point to .ru domain)

# 2. Verify all pages are set to index
grep 'robots' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | grep -v "index, follow" | grep -v yandex | grep -v css_base
# Expected: No results (all should allow indexing)

# 3. Check hreflang completeness
echo "=== Hreflang tag counts ==="
for file in BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html; do
    filename=$(basename "$file")
    if [[ ! "$filename" =~ yandex ]] && [[ "$filename" != "css_base_styles.html" ]]; then
        count=$(grep -c 'hreflang=' "$file" 2>/dev/null)
        if [ $count -ne 5 ]; then
            echo "⚠ $filename: $count hreflang tags (expected 5)"
        fi
    fi
done
echo "If no warnings above, all pages have correct hreflang counts ✓"
```

---

### Task 6E: Typography Validation

```bash
# Check current font configuration
echo "=== Typography Check ==="
grep "googleapis.com/css2" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html | head -1

# Check if Inter is present (should be)
grep "Inter" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html && echo "✓ Inter font present"

# Check if Noto Sans added (if Task 3 Option 2 was chosen)
if grep -q "Noto+Sans" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html; then
    echo "ℹ Noto Sans added (optional enhancement)"
else
    echo "✓ Using Inter (excellent for Cyrillic)"
fi
```

---

### Task 6F: Cross-Domain Link Validation

```bash
# 1. Language switcher links should point to correct TLDs
echo "=== Checking language switcher in contraco.ru/index.html ==="
grep -A 1 'lang-link' BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html | grep 'href=' | head -8

# Expected output should show:
# - contraco.net for EN
# - contraco.de for DE
# - contraco.ru for RU (active)
# - contraco.co.kr for KO

# 2. Verify correct filename patterns are used
echo "=== Checking filename patterns ==="
grep -h "thank-you.html" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | head -3
grep -h "cultural-adaptation-guide.html" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | head -3
echo "✓ Should see correct hyphenated filenames above"
```

---

### Task 6G: Content Validation

```bash
# 1. Verify all pages have titles
echo "=== Checking titles ==="
for file in BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html; do
    if ! grep -q "<title>" "$file"; then
        echo "⚠ Missing title: $(basename $file)"
    fi
done

# 2. Check that content is in Russian (Cyrillic)
echo "=== Checking Russian content ==="
grep -h "<title>" BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html
# Should show Cyrillic characters

# 3. Verify contact information
grep "transformation@contraco.net" BRAND-UPDATES-INTERNATIONAL/contraco.ru/contact.html && echo "✓ Contact email present"

# 4. Check new copyright page has Russian content
if [ -f "BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html" ]; then
    grep -q "Авторские права" BRAND-UPDATES-INTERNATIONAL/contraco.ru/copyright.html && echo "✓ Copyright page in Russian"
fi
```

---

### Task 6H: Git Status Check

```bash
# View all changes made
git status

# Review commits
git log --oneline -10

# Check what files were modified/added/removed
git diff --name-status HEAD~5..HEAD | grep contraco.ru
```

**Expected changes:**
- 0 files renamed (contraco.ru already had correct names!)
- 1 file created (copyright.html)
- 0-1 file removed (css_base_styles.html if removed)
- ~15 files in other TLDs modified (hreflang updates)
- Optional: favicon files added
- Optional: typography updates (if Task 3 Option 2 chosen)

---

### Task 6I: Create Summary Report

Generate a summary of all changes:

```bash
cat > /tmp/contraco-ru-deployment-summary.txt << 'EOF'
# contraco.ru Deployment Summary
Date: $(date)

## Status: CLEANEST INTERNATIONAL TLD ✓

contraco.ru had the best file structure from the start:
✓ All filenames already correct (no renames needed)
✓ thank-you.html already hyphenated correctly
✓ cultural-adaptation-guide.html already correct
✓ Inter font already excellent for Cyrillic

## Files Changed:

### Created:
- copyright.html (Russian translation)

### Investigated:
- css_base_styles.html (kept/removed - see decision)

### Modified:
- Hreflang updates across other TLDs
- Optional: Typography enhancements (if Task 3 Option 2 chosen)

### Optional:
- Favicon files copied (if Option 2 chosen in Task 5)

## Validation Results:

Logo size: $(grep -l "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | wc -l) files have 58px logo
Language code: $(grep -l 'lang="ru"' BRAND-UPDATES-INTERNATIONAL/contraco.ru/*.html | wc -l) files have lang="ru"
Canonical tags: All point to contraco.ru ✓
Hreflang tags: All pages checked ✓
Russian content: Cyrillic text present ✓

## Commits Created:
$(git log --oneline HEAD~5..HEAD | grep -i "ru\|russian\|hreflang")

## Ready for Deployment: YES/NO
- [ ] All validations passed
- [ ] No broken links found
- [ ] SEO tags correct
- [ ] Brand consistency maintained
- [ ] Russian translation quality verified
- [ ] Ready for manual deployment to contraco.ru hosting

## Notes:
- contraco.ru required minimal changes (most organized TLD)
- Only needed copyright.html addition
- All other structure already correct

EOF

cat /tmp/contraco-ru-deployment-summary.txt
```

---

### Task 6J: Final Checklist

**Before marking deployment ready:**

- [ ] copyright.html created and translated to Russian (Cyrillic)
- [ ] css_base_styles.html decision made and executed
- [ ] All hreflang tags updated across all TLDs
- [ ] Logo is 58px on all contraco.ru pages
- [ ] Brand colors consistent (#C00000)
- [ ] All canonical URLs correct (contraco.ru)
- [ ] Language code is "ru" on all pages
- [ ] Google Analytics ID present (G-868WGCC45D)
- [ ] Russian (Cyrillic) content displays correctly
- [ ] No broken internal links
- [ ] All filenames use correct hyphenation
- [ ] All validation commands pass
- [ ] Git commits created with clear messages
- [ ] Summary report generated

---

## 📋 TASK 7: PREPARE FOR MANUAL DEPLOYMENT

**Priority:** CRITICAL
**Impact:** Ensures changes can be deployed to live contraco.ru
**Estimated Time:** 20 minutes

### Task 7A: Create Deployment Package

Since you cannot push directly to contraco.ru, create a deployment package:

```bash
# Create deployment directory
mkdir -p /tmp/contraco-ru-deployment

# Copy all contraco.ru files
cp -r BRAND-UPDATES-INTERNATIONAL/contraco.ru/* /tmp/contraco-ru-deployment/

# List what's in deployment package
ls -la /tmp/contraco-ru-deployment/

# Count files
echo "Total HTML files: $(ls -1 /tmp/contraco-ru-deployment/*.html | wc -l)"
echo "Total PNG files: $(ls -1 /tmp/contraco-ru-deployment/*.png 2>/dev/null | wc -l)"
echo "Total ICO files: $(ls -1 /tmp/contraco-ru-deployment/*.ico 2>/dev/null | wc -l)"
```

---

### Task 7B: Create Deployment Instructions

```bash
cat > /tmp/contraco-ru-deployment/DEPLOYMENT-INSTRUCTIONS.md << 'EOF'
# contraco.ru Deployment Instructions

## Changes Summary:
1. **New File:**
   - copyright.html (Russian/Cyrillic translation)

2. **File Structure:**
   - css_base_styles.html (kept/removed - see notes)

3. **Modified Files:**
   - Hreflang updates across all TLDs to reference new copyright page

4. **Optional:**
   - Typography enhancements (if Noto Sans added)
   - Favicon files (if copied to directory)

## Good News:
✓ No file renames needed (contraco.ru already had correct naming!)
✓ All existing filenames already correct
✓ Minimal changes required

## Pre-Deployment Checklist:
- [ ] Backup current contraco.ru site
- [ ] Verify no 301 redirects needed (all filenames correct)
- [ ] Test on staging (if available)

## Deployment Steps:
1. Upload all files to contraco.ru hosting
2. Overwrite existing files
3. Verify new copyright.html loads
4. Check logo displays at 58px
5. **Verify Russian (Cyrillic) text renders correctly**
6. Test navigation and all internal links
7. Verify language switcher works
8. Submit updated sitemap to Google Search Console
9. Submit to Yandex Webmaster Tools (important for Russian market)
10. Monitor Google Analytics for errors

## Russian Content Testing (Important):
- [ ] Cyrillic characters display correctly
- [ ] Font rendering is clean and readable
- [ ] Check on multiple devices (desktop, mobile, tablet)
- [ ] Test on Yandex Browser (popular in Russia)
- [ ] Test on multiple browsers (Chrome, Firefox, Safari)

## Post-Deployment Testing:
- [ ] Visit https://contraco.ru/copyright.html (should work)
- [ ] Check all existing pages still load
- [ ] Check Russian content rendering on homepage
- [ ] Check language switcher on all pages
- [ ] Verify hreflang tags with Google Search Console
- [ ] Run Lighthouse audit
- [ ] Check PageSpeed Insights
- [ ] Verify Yandex indexing

## Rollback Plan:
If issues occur:
1. Restore from backup
2. Review error logs
3. Test fixes on staging
4. Retry deployment

## Contact:
If questions arise during deployment, refer to:
- EXISTING-TLDS-STATUS-BRIEFING.md (full context)
- contraco.ru-DEPLOYMENT-TASKS.md (this checklist)

Deployment prepared: $(date)
EOF

cat /tmp/contraco-ru-deployment/DEPLOYMENT-INSTRUCTIONS.md
```

---

### Task 7C: No 301 Redirects Needed! ✓

**Great news:** contraco.ru doesn't need any 301 redirects because all filenames are already correct!

```bash
cat > /tmp/contraco-ru-deployment/NO-REDIRECTS-NEEDED.txt << 'EOF'
# contraco.ru - No 301 Redirects Required

Unlike contraco.de and contraco.kr, contraco.ru already uses correct file naming:
✓ thank-you.html (not thankyou.html)
✓ cultural-adaptation-guide.html (not cultural-guide.html)

No redirect configuration needed!

This makes deployment simpler and faster.
EOF

cat /tmp/contraco-ru-deployment/NO-REDIRECTS-NEEDED.txt
```

---

### Task 7D: Commit Final Changes

```bash
git add -A
git commit -m "Prepare contraco.ru for deployment

Completed all deployment tasks:
✓ Created missing copyright.html (Russian translation)
✓ Investigated css_base_styles.html (kept/removed)
✓ Updated all hreflang references
✓ Verified favicon setup
✓ Validated all changes
✓ Created deployment package and instructions

Good news:
✓ NO file renames needed (contraco.ru already had correct naming)
✓ NO 301 redirects needed
✓ Minimal changes required

contraco.ru is the cleanest international TLD:
- All filenames already correct
- Inter font already excellent for Cyrillic
- Only missing copyright.html (now added)

Files ready for manual deployment to contraco.ru hosting.

Changes affect: 1 new file + hreflang updates across TLDs"
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
cat > /tmp/deployment-notification-ru.txt << 'EOF'
SUBJECT: contraco.ru Deployment Ready - New Copyright Page (Minimal Changes)

Hi Team,

contraco.ru updates are ready for deployment. This is the SIMPLEST deployment of all international TLDs!

SUMMARY OF CHANGES:
• Added missing copyright.html page (Russian/Cyrillic translation)
• Investigated css_base_styles.html (see decision notes)
• Updated hreflang references across other TLDs
• Verified logo at 58px across all pages
• Brand consistency maintained

GOOD NEWS:
✓ NO file renames needed (all filenames already correct!)
✓ NO 301 redirects needed
✓ Minimal changes required
✓ contraco.ru had the best structure from the start

DEPLOYMENT PACKAGE:
Location: /tmp/contraco-ru-deployment/
Files: 16-17 HTML files + icons (if included)
Instructions: See DEPLOYMENT-INSTRUCTIONS.md

NO REDIRECTS REQUIRED:
✓ All filenames already use correct hyphenation
✓ No old URLs to redirect

TESTING CHECKLIST:
Complete post-deployment testing checklist provided in deployment instructions.
IMPORTANT: Verify Russian (Cyrillic) text rendering.

YANDEX WEBMASTER TOOLS:
Remember to submit updated sitemap to Yandex (important for Russian market).

DOCUMENTATION:
• Full context: EXISTING-TLDS-STATUS-BRIEFING.md
• Task details: contraco.ru-DEPLOYMENT-TASKS.md
• Deployment instructions: DEPLOYMENT-INSTRUCTIONS.md

Git commits: [Link to commits]
Ready for deployment: YES

Questions? See deployment documentation or contact [your name/role].

Prepared: $(date)
EOF

cat /tmp/deployment-notification-ru.txt
```

---

**Task 7 Checklist:**
- [ ] Deployment package created
- [ ] Deployment instructions written
- [ ] Noted that NO 301 redirects needed (major simplification!)
- [ ] All changes committed to git
- [ ] Changes pushed to repository
- [ ] Deployment notification prepared
- [ ] Team notified (if applicable)

---

## ✅ COMPLETION CHECKLIST

### All Tasks Completed:

- [ ] **Task 1:** Missing copyright.html page created
  - [ ] Translated to Russian (Cyrillic)
  - [ ] Added to site structure
  - [ ] Hreflang tags updated

- [ ] **Task 2:** css_base_styles.html investigated
  - [ ] Decision made: keep or remove
  - [ ] Action executed

- [ ] **Task 3:** Typography evaluated (optional)
  - [ ] Decision made: keep Inter or add Noto Sans
  - [ ] Changes applied (if any)

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
  - [ ] NO redirects needed (documented)
  - [ ] Team notified

---

## 📊 SUCCESS METRICS

After deployment, verify these metrics:

**SEO:**
- [ ] All hreflang errors resolved in Google Search Console
- [ ] copyright.html page indexed
- [ ] Yandex Webmaster Tools updated

**Technical:**
- [ ] All pages load successfully
- [ ] Logo displays at 58px
- [ ] Russian (Cyrillic) text renders correctly
- [ ] No JavaScript errors
- [ ] Page load time < 3 seconds

**Content:**
- [ ] Cyrillic characters display properly
- [ ] Font rendering is excellent (Inter or Noto Sans)
- [ ] No encoding issues

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

**Issue: Cyrillic text not displaying**
- **Cause:** Character encoding issue
- **Fix:** Verify UTF-8 encoding in all files, check server configuration

**Issue: Font rendering looks wrong**
- **Cause:** Font not loading or incorrect font-family
- **Fix:** Verify Google Fonts CDN accessible from Russia, check CSS

**Issue: Hreflang errors in Search Console**
- **Cause:** URL mismatch across TLDs
- **Fix:** Verify all TLDs reference contraco.ru correctly

---

## 📝 POST-DEPLOYMENT TASKS

After successful deployment:

1. **Monitor for 1 week:**
   - [ ] Check Google Search Console daily
   - [ ] Check Yandex Webmaster Tools daily (important for Russian market)
   - [ ] Monitor Google Analytics
   - [ ] Watch for errors in server logs
   - [ ] Monitor font loading and Cyrillic rendering

2. **Update sitemap:**
   - [ ] Generate new sitemap.xml with copyright.html
   - [ ] Submit to Google Search Console
   - [ ] Submit to Yandex Webmaster Tools (critical!)

3. **Update documentation:**
   - [ ] Mark tasks as complete in this document
   - [ ] Update EXISTING-TLDS-STATUS-BRIEFING.md
   - [ ] Document any deployment issues encountered
   - [ ] Note contraco.ru success as reference for future TLDs

4. **Plan next improvements:**
   - [ ] Verify German copyright.html deployed (contraco.de)
   - [ ] Verify Korean copyright.html deployed (contraco.kr)
   - [ ] contraco.com development
   - [ ] Consider regional SEO optimization

---

## 📚 REFERENCE DOCUMENTS

**For Context:**
- `EXISTING-TLDS-STATUS-BRIEFING.md` - Full audit of all international TLDs
- `NEW-TLD-SETUP-BRIEFING.md` - Guide for setting up new TLDs
- `contraco.de-DEPLOYMENT-TASKS.md` - Similar tasks for German site
- `contraco.kr-DEPLOYMENT-TASKS.md` - Similar tasks for Korean site

**For Technical Details:**
- contraco.net files - Reference for structure
- Inter font - Already excellent for Cyrillic

**For Validation:**
- Google Search Console
- Yandex Webmaster Tools (important for Russian market)
- Google PageSpeed Insights
- W3C HTML Validator

**Russian Market Resources:**
- Yandex Browser - Popular in Russia
- Yandex Webmaster Tools
- Mail.ru services

---

## ⚡ QUICK COMMANDS REFERENCE

```bash
# Check file exists
ls -la BRAND-UPDATES-INTERNATIONAL/contraco.ru/[filename].html

# Search for string
grep -r "search term" BRAND-UPDATES-INTERNATIONAL/contraco.ru/

# Check for Cyrillic content
grep -P '[\p{Cyrillic}]' file.html

# Count occurrences
grep -c "pattern" file.html

# Find and replace
sed -i 's/old-text/new-text/g' file.html

# Bulk find and replace
find BRAND-UPDATES-INTERNATIONAL/contraco.ru -name "*.html" -exec sed -i 's/old/new/g' {} \;

# Check font configuration
grep "Inter" file.html

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

**Key Advantages of contraco.ru:**
- ✓ NO file renames needed (all already correct!)
- ✓ NO 301 redirects needed
- ✓ Only needs copyright.html
- ✓ Inter font already excellent for Cyrillic
- ✓ Cleanest structure of all international TLDs

**Questions?**
Refer to EXISTING-TLDS-STATUS-BRIEFING.md for full context.

---

**END OF DOCUMENT**
