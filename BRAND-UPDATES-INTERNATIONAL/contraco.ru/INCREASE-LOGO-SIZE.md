# TASK: Increase Logo Size to 58px - contraco.ru
## Quick Fix Instructions for Claude Session

**Issue:** Logo images are too small (35px-40px) compared to contraco.net (58px)
**Impact:** Inconsistent branding across domains - WORST CASE (ALL 14 files affected!)
**Priority:** CRITICAL

---

## 🎯 OBJECTIVE

Increase logo size to **58px** across **ALL** contraco.ru HTML files to match contraco.net standard.

---

## 📊 STATUS CHECK - MOST CRITICAL!

### Files with 40px logos (need → 58px): **12 files**
1. about.html
2. ai-adoption-research.html
3. ai-strategy-framework.html
4. contact.html
5. cultural-adaptation-guide.html
6. digital-transformation-roi.html
7. index.html (homepage!)
8. insights.html
9. leading-ai-transformation.html
10. organizational-design-ai.html
11. pricing-psychology.html
12. thank-you.html

### Files with 35px logos (need → 58px): **2 files**
13. resonance-method.html
14. strategic-intelligence.html

**Total files to update: ALL 14 FILES (100% of site!)**

**This is the WORST logo consistency issue across all TLDs!**

---

## ✅ TASK: UPDATE LOGO CSS TO 58PX

### Step 1: Verify Current State

Run this command to confirm which files need updating:
```bash
cd /home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.ru
echo "=== Files with 40px logos ==="
grep -l "height: 40px" *.html | grep -v yandex | grep -v css_base
echo ""
echo "=== Files with 35px logos ==="
grep -l "height: 35px" *.html | grep -v yandex | grep -v css_base
```

### Step 2: Update Files with 40px Logos (12 files)

For files with 40px logos, use the Edit tool:

**Find this (old CSS - 40px variant):**
```css
        .logo img {
            height: 40px;
            width: auto;
            transition: opacity 0.3s ease;
        }
```

**Replace with (new CSS):**
```css
        .logo img {
            height: 58px;
            width: auto;
            transition: transform 0.3s ease;
        }
```

### Step 3: Update Files with 35px Logos (2 files)

For resonance-method.html and strategic-intelligence.html:

**Find this (old CSS - 35px variant):**
```css
        .logo img {
            height: 35px;
            width: auto;
        }
```

**Replace with (new CSS):**
```css
        .logo img {
            height: 58px;
            width: auto;
            transition: transform 0.3s ease;
        }
```

### Step 4: Files to Update

Update ALL 14 files in order:

```bash
FILES=(
    "about.html"
    "ai-adoption-research.html"
    "ai-strategy-framework.html"
    "contact.html"
    "cultural-adaptation-guide.html"
    "digital-transformation-roi.html"
    "index.html"
    "insights.html"
    "leading-ai-transformation.html"
    "organizational-design-ai.html"
    "pricing-psychology.html"
    "resonance-method.html"
    "strategic-intelligence.html"
    "thank-you.html"
)
```

**For each file:**
1. Read the file first to see the current CSS
2. Use Edit tool to update logo img height to 58px
3. Add `transition: transform 0.3s ease;` if missing
4. Match exact indentation

---

## ✅ VALIDATION

### Step 1: Verify All 14 Files Have 58px

```bash
echo "=== Checking for 58px logos ==="
for file in about.html ai-adoption-research.html ai-strategy-framework.html contact.html cultural-adaptation-guide.html digital-transformation-roi.html index.html insights.html leading-ai-transformation.html organizational-design-ai.html pricing-psychology.html resonance-method.html strategic-intelligence.html thank-you.html; do
    count=$(grep -c "height: 58px" "$file" 2>/dev/null || echo "0")
    if [ $count -ge 1 ]; then
        echo "✓ $file"
    else
        echo "✗ $file - MISSING 58px"
    fi
done
```

**Expected:** All 14 files show ✓

### Step 2: Verify No Small Logos Remain

```bash
echo "=== Checking for remaining small logos (should find NONE) ==="
echo "40px logos remaining:"
grep -l "height: 40px" *.html 2>/dev/null | grep -v yandex | grep -v css_base || echo "None ✓"
echo ""
echo "35px logos remaining:"
grep -l "height: 35px" *.html 2>/dev/null | grep -v yandex | grep -v css_base || echo "None ✓"
```

**Expected:** "None ✓" for both

### Step 3: Count Total 58px Logos

```bash
# Should return 14 (all files)
grep -l "height: 58px" *.html 2>/dev/null | grep -v yandex | grep -v css_base | wc -l
```

**Expected:** 14

---

## ✅ COMMIT CHANGES

```bash
cd /home/user/contraco-net

git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/about.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/ai-adoption-research.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/ai-strategy-framework.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/contact.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/cultural-adaptation-guide.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/digital-transformation-roi.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/index.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/insights.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/leading-ai-transformation.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/organizational-design-ai.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/pricing-psychology.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/resonance-method.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/strategic-intelligence.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.ru/thank-you.html

git commit -m "CRITICAL: Increase logo size to 58px across ALL contraco.ru files

Updated logo height in ALL 14 files (100% of site!) to match
contraco.net standard (58px). This was the worst logo consistency
issue across all international TLDs.

Files updated (12 from 40px, 2 from 35px):
- about.html (40px → 58px)
- ai-adoption-research.html (40px → 58px)
- ai-strategy-framework.html (40px → 58px)
- contact.html (40px → 58px)
- cultural-adaptation-guide.html (40px → 58px)
- digital-transformation-roi.html (40px → 58px)
- index.html (40px → 58px) - HOMEPAGE!
- insights.html (40px → 58px)
- leading-ai-transformation.html (40px → 58px)
- organizational-design-ai.html (40px → 58px)
- pricing-psychology.html (40px → 58px)
- resonance-method.html (35px → 58px)
- strategic-intelligence.html (35px → 58px)
- thank-you.html (40px → 58px)

Change: .logo img height: 35/40px → 58px

Result: All contraco.ru files now have uniform 58px logo
Impact: CRITICAL - Brand consistency restored on Russian site"
```

---

## 📋 EXECUTION CHECKLIST

- [ ] Verify current state (12 files at 40px, 2 files at 35px)
- [ ] Update about.html: 40px → 58px
- [ ] Update ai-adoption-research.html: 40px → 58px
- [ ] Update ai-strategy-framework.html: 40px → 58px
- [ ] Update contact.html: 40px → 58px
- [ ] Update cultural-adaptation-guide.html: 40px → 58px
- [ ] Update digital-transformation-roi.html: 40px → 58px
- [ ] Update index.html: 40px → 58px ⚠️ HOMEPAGE
- [ ] Update insights.html: 40px → 58px
- [ ] Update leading-ai-transformation.html: 40px → 58px
- [ ] Update organizational-design-ai.html: 40px → 58px
- [ ] Update pricing-psychology.html: 40px → 58px
- [ ] Update resonance-method.html: 35px → 58px
- [ ] Update strategic-intelligence.html: 35px → 58px
- [ ] Update thank-you.html: 40px → 58px
- [ ] Run validation (all 14 files have 58px)
- [ ] Commit and push changes

---

## 🚨 IMPORTANT NOTES

1. **This affects 100% of contraco.ru** - Every single HTML file needs updating!
2. **Even the homepage (index.html) has a small logo** - Maximum visibility issue
3. **Preserve Russian (Cyrillic) text** in navigation and content - НЕ ИЗМЕНЯЙТЕ!
4. **Match exact indentation** from each file (usually 8 or 12 spaces)
5. **Two different sizes:** 12 files at 40px, 2 files at 35px
6. **Do NOT modify** yandex verification files or css_base_styles.html
7. **This is the WORST logo issue** across all TLDs - contraco.ru needs immediate attention!

---

## 🎯 QUICK START FOR CLAUDE

```
CRITICAL TASK: Increase logo size to 58px on contraco.ru

Read: BRAND-UPDATES-INTERNATIONAL/contraco.ru/INCREASE-LOGO-SIZE.md

ALL 14 FILES need logo CSS updated (100% of site!):
- 12 files: height: 40px → 58px
- 2 files: height: 35px → 58px
- Location: .logo img CSS block

Files include HOMEPAGE (index.html)!

Preserve Russian (Cyrillic) text!
Use Edit tool for each file.
Validate all 14 show 58px.
Commit.
```

---

**Priority:** CRITICAL - Execute IMMEDIATELY - 100% of Russian site affected!
**Estimated Time:** 25-35 minutes (all 14 files)
**Complexity:** MEDIUM (14 files, 2 different source sizes)

**This is the most critical logo issue across all international TLDs!**

**END OF INSTRUCTIONS**
