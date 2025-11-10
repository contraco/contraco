# TASK: Increase Logo Size from 40px to 58px - contraco.de
## Quick Fix Instructions for Claude Session

**Issue:** Logo images are too small (40px) compared to contraco.net (58px)
**Impact:** Inconsistent branding across domains
**Priority:** HIGH

---

## 🎯 OBJECTIVE

Increase logo size from **40px to 58px** across all contraco.de HTML files to match contraco.net standard.

---

## 📊 STATUS CHECK

### Files with CORRECT 58px logos (already done):
- about.html ✓
- contact.html ✓
- digital-transformation-roi.html ✓
- index.html ✓
- insights.html ✓
- navigation_template.html ✓
- thankyou.html ✓

### Files needing logo size increase (40px → 58px):
1. ai-adoption-research.html
2. ai-strategy-framework.html
3. cultural-guide.html
4. leading-ai-transformation.html
5. organizational-design-ai.html
6. pricing-psychology.html
7. resonance-method.html
8. strategic-intelligence.html

**Total files to update: 8**

---

## ✅ TASK: UPDATE LOGO CSS FROM 40PX TO 58PX

### Step 1: Verify Current State

Run this command to confirm which files need updating:
```bash
cd /home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.de
for file in *.html; do
    if grep -q "height: 40px" "$file" && grep -q "logo img" "$file"; then
        echo "✗ $file - has 40px logo"
    fi
done
```

### Step 2: Update Each File

For each of the 8 files listed above, use the Edit tool:

**Find this (old CSS):**
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

**Note:** Some files may have slight variations - match the exact indentation and surrounding code.

### Step 3: Files to Update

Update these files in order:

```bash
FILES=(
    "ai-adoption-research.html"
    "ai-strategy-framework.html"
    "cultural-guide.html"
    "leading-ai-transformation.html"
    "organizational-design-ai.html"
    "pricing-psychology.html"
    "resonance-method.html"
    "strategic-intelligence.html"
)
```

**For each file:**
1. Read the file first to see the current CSS
2. Use Edit tool to replace `height: 40px;` with `height: 58px;` in the `.logo img` CSS block
3. Optionally update `transition: opacity` to `transition: transform` for consistency

---

## ✅ VALIDATION

### Step 1: Verify All Files Have 58px

```bash
echo "=== Checking for 58px logos ==="
for file in ai-adoption-research.html ai-strategy-framework.html cultural-guide.html leading-ai-transformation.html organizational-design-ai.html pricing-psychology.html resonance-method.html strategic-intelligence.html; do
    count=$(grep -c "height: 58px" "$file" 2>/dev/null || echo "0")
    if [ $count -ge 1 ]; then
        echo "✓ $file"
    else
        echo "✗ $file - MISSING 58px"
    fi
done
```

**Expected:** All 8 files show ✓

### Step 2: Verify No 40px Logos Remain

```bash
echo "=== Checking for remaining 40px logos (should find NONE) ==="
for file in *.html; do
    if grep -q "height: 40px" "$file" && grep -q "\.logo img" "$file"; then
        echo "⚠ STILL 40PX: $file"
    fi
done
echo "If no warnings above, all logos are 58px ✓"
```

**Expected:** No output (no files with 40px logos)

### Step 3: Count Total 58px Logos

```bash
# Should return 15 (7 already correct + 8 newly fixed)
grep -l "height: 58px" *.html 2>/dev/null | wc -l
```

**Expected:** 15

---

## ✅ COMMIT CHANGES

```bash
cd /home/user/contraco-net

git add BRAND-UPDATES-INTERNATIONAL/contraco.de/ai-adoption-research.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/ai-strategy-framework.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/cultural-guide.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/leading-ai-transformation.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/organizational-design-ai.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/pricing-psychology.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/resonance-method.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.de/strategic-intelligence.html

git commit -m "Increase logo size from 40px to 58px across contraco.de

Updated logo height in 8 files to match contraco.net standard (58px).
This ensures consistent brand presentation across all domains.

Files updated:
- ai-adoption-research.html
- ai-strategy-framework.html
- cultural-guide.html
- leading-ai-transformation.html
- organizational-design-ai.html
- pricing-psychology.html
- resonance-method.html
- strategic-intelligence.html

Change: .logo img { height: 40px } → .logo img { height: 58px }

Result: All 15 contraco.de HTML files now have uniform 58px logo"
```

---

## 📋 EXECUTION CHECKLIST

- [ ] Verify current state (identify 8 files with 40px logos)
- [ ] Update ai-adoption-research.html: 40px → 58px
- [ ] Update ai-strategy-framework.html: 40px → 58px
- [ ] Update cultural-guide.html: 40px → 58px
- [ ] Update leading-ai-transformation.html: 40px → 58px
- [ ] Update organizational-design-ai.html: 40px → 58px
- [ ] Update pricing-psychology.html: 40px → 58px
- [ ] Update resonance-method.html: 40px → 58px
- [ ] Update strategic-intelligence.html: 40px → 58px
- [ ] Run validation (all 15 files have 58px)
- [ ] Commit and push changes

---

## 🎯 QUICK START FOR CLAUDE

```
Task: Increase logo size from 40px to 58px on contraco.de

Read: BRAND-UPDATES-INTERNATIONAL/contraco.de/INCREASE-LOGO-SIZE.md

8 files need logo CSS updated:
- Find: height: 40px
- Replace: height: 58px
- Location: .logo img CSS block

Files: ai-adoption-research.html, ai-strategy-framework.html,
cultural-guide.html, leading-ai-transformation.html,
organizational-design-ai.html, pricing-psychology.html,
resonance-method.html, strategic-intelligence.html

Use Edit tool for each file. Validate all 15 files show 58px. Commit.
```

---

**Priority:** HIGH - Execute immediately for brand consistency
**Estimated Time:** 15-20 minutes
**Complexity:** LOW (simple CSS value update across 8 files)

**END OF INSTRUCTIONS**
