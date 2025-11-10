# URGENT FIX: contraco.kr Logo Missing in 8 Files
## Quick Fix Instructions for Claude.ai Session

**Issue:** 8 HTML files in contraco.kr show text "contraco" instead of logo image
**Impact:** Poor branding, inconsistent user experience
**Priority:** CRITICAL

---

## 📊 AFFECTED FILES

**Missing Logo Image (8 files):**
1. ai-adoption-research.html
2. ai-strategy-framework.html
3. cultural-adaptation-guide.html
4. leading-ai-transformation.html
5. organizational-design-ai.html
6. pricing-psychology.html
7. resonance-method.html
8. strategic-intelligence.html

**Already Correct (7 files):**
- ✓ about.html
- ✓ contact.html
- ✓ digital-transformation-roi.html
- ✓ index.html
- ✓ insights.html
- ✓ navigation_template.html
- ✓ thankyou.html

---

## 🔍 PROBLEM ANALYSIS

### Current State (BROKEN):
```html
<a href="https://contraco.co.kr/" class="logo">contraco</a>
```

```css
.logo {
    font-family: 'Crimson Text', serif;
    font-size: 28px;
    font-weight: 600;
    color: var(--deep-charcoal);
    text-decoration: none;
}
```

**Result:** Shows text "contraco" (no image)

### Required State (WORKING):
```html
<a href="https://contraco.co.kr/" class="logo" id="site-logo">
    <img src="https://contraco.net/Logo_rectangle.svg"
         alt="contraco"
         onerror="this.parentElement.classList.add('logo-failed');">
    <span class="logo-fallback">contraco</span>
</a>
```

```css
.logo {
    margin-left: 60px;
    display: flex;
    align-items: center;
    text-decoration: none;
}

.logo img {
    height: 58px;
    width: auto;
    transition: transform 0.3s ease;
}

.logo:hover img {
    transform: scale(1.05);
}

.logo-fallback {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--primary-red);
    letter-spacing: -0.02em;
    font-family: var(--font-serif);
    transition: all 0.3s ease;
    display: none;
}

.logo:hover .logo-fallback {
    transform: scale(1.05);
}

.logo.logo-failed img {
    display: none;
}

.logo.logo-failed .logo-fallback {
    display: block;
}
```

**Result:** Shows 58px logo image with fallback

---

## ✅ TASK 1: FIX HTML LOGO STRUCTURE

### Step 1: Read a Working File for Reference
```bash
grep -A 5 '<a.*logo' BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
```

### Step 2: Update Each Broken File

**For each of the 8 files, use the Edit tool:**

**Find this (old HTML):**
```html
<a href="https://contraco.co.kr/" class="logo">contraco</a>
```

**Replace with (new HTML):**
```html
<a href="https://contraco.co.kr/" class="logo" id="site-logo">
    <img src="https://contraco.net/Logo_rectangle.svg"
         alt="contraco"
         onerror="this.parentElement.classList.add('logo-failed');">
    <span class="logo-fallback">contraco</span>
</a>
```

**Note:** The exact structure may vary slightly - match the working files exactly.

### Step 3: Automated Update (All 8 Files)

**List the files to update:**
```bash
FILES=(
    "ai-adoption-research.html"
    "ai-strategy-framework.html"
    "cultural-adaptation-guide.html"
    "leading-ai-transformation.html"
    "organizational-design-ai.html"
    "pricing-psychology.html"
    "resonance-method.html"
    "strategic-intelligence.html"
)
```

**For each file, you MUST use Read tool first, then Edit tool to update the logo HTML.**

---

## ✅ TASK 2: FIX CSS LOGO STYLING

### Step 1: Identify Current CSS Pattern

Check what CSS exists:
```bash
grep -A 10 "\.logo {" BRAND-UPDATES-INTERNATIONAL/contraco.kr/ai-adoption-research.html
```

### Step 2: Replace Logo CSS

**Find this (old CSS):**
```css
.logo {
    font-family: 'Crimson Text', serif;
    font-size: 28px;
    font-weight: 600;
    color: var(--deep-charcoal);
    text-decoration: none;
}
```

**Replace with (new CSS):**
```css
.logo {
    margin-left: 60px;
    display: flex;
    align-items: center;
    text-decoration: none;
}

.logo img {
    height: 58px;
    width: auto;
    transition: transform 0.3s ease;
}

.logo:hover img {
    transform: scale(1.05);
}

/* Logo Fallback Styling */
.logo-fallback {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--primary-red);
    letter-spacing: -0.02em;
    font-family: var(--font-serif);
    transition: all 0.3s ease;
    display: none;
}

.logo:hover .logo-fallback {
    transform: scale(1.05);
}

.logo.logo-failed img {
    display: none;
}

.logo.logo-failed .logo-fallback {
    display: block;
}
```

### Step 3: Use Edit Tool for Each File

**For each of the 8 files:**
1. Read the file first
2. Find the `.logo {` CSS block
3. Use Edit tool to replace with complete logo CSS from working files

---

## ✅ TASK 3: ADD LOGO ERROR HANDLING JAVASCRIPT

Some files may be missing the JavaScript that handles logo loading errors.

### Check if JavaScript exists:
```bash
grep -A 20 "// Enhanced logo fallback" BRAND-UPDATES-INTERNATIONAL/contraco.kr/ai-adoption-research.html
```

### If missing, add this before `</body>`:

```javascript
<script>
    // Enhanced logo fallback with retry mechanism
    (function() {
        const logo = document.getElementById('site-logo');
        if (!logo) return;

        const logoImg = logo.querySelector('img');
        if (!logoImg) return;

        let retryCount = 0;
        const maxRetries = 2;

        function handleLogoError() {
            if (retryCount < maxRetries) {
                retryCount++;
                setTimeout(() => {
                    logoImg.src = 'https://contraco.net/Logo_rectangle.svg';
                }, 1000 * retryCount);
            } else {
                logo.classList.add('logo-failed');
            }
        }

        if (logoImg.complete && logoImg.naturalHeight === 0) {
            handleLogoError();
        }

        logoImg.addEventListener('error', handleLogoError);

        logoImg.addEventListener('load', function() {
            logo.classList.remove('logo-failed');
        });
    })();
</script>
```

---

## ✅ TASK 4: VALIDATION

### Step 1: Verify HTML Structure
```bash
for file in ai-adoption-research.html ai-strategy-framework.html cultural-adaptation-guide.html leading-ai-transformation.html organizational-design-ai.html pricing-psychology.html resonance-method.html strategic-intelligence.html; do
    echo "=== Checking $file ==="
    grep -c '<img src="https://contraco.net/Logo_rectangle.svg"' "BRAND-UPDATES-INTERNATIONAL/contraco.kr/$file"
done
```

**Expected:** Each file should return "1"

### Step 2: Verify CSS
```bash
for file in ai-adoption-research.html ai-strategy-framework.html cultural-adaptation-guide.html leading-ai-transformation.html organizational-design-ai.html pricing-psychology.html resonance-method.html strategic-intelligence.html; do
    echo "=== Checking $file ==="
    grep -c 'height: 58px' "BRAND-UPDATES-INTERNATIONAL/contraco.kr/$file"
done
```

**Expected:** Each file should return "1"

### Step 3: Final Verification
```bash
# Should show 15 (all files)
grep -c "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | grep -v ":0" | wc -l

# Should show 0 (no text-only logos)
for file in BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html; do
    if [[ ! "$file" =~ yandex ]]; then
        if ! grep -q "Logo_rectangle.svg" "$file"; then
            echo "⚠ Missing logo image: $(basename $file)"
        fi
    fi
done
```

---

## ✅ TASK 5: COMMIT CHANGES

```bash
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/ai-adoption-research.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/ai-strategy-framework.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/cultural-adaptation-guide.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/leading-ai-transformation.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/organizational-design-ai.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/pricing-psychology.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/resonance-method.html
git add BRAND-UPDATES-INTERNATIONAL/contraco.kr/strategic-intelligence.html

git commit -m "Fix missing logo images in 8 contraco.kr files

URGENT FIX: 8 files were showing text 'contraco' instead of logo image

Fixed files:
- ai-adoption-research.html
- ai-strategy-framework.html
- cultural-adaptation-guide.html
- leading-ai-transformation.html
- organizational-design-ai.html
- pricing-psychology.html
- resonance-method.html
- strategic-intelligence.html

Changes:
✓ Replaced text-only logo with image logo structure
✓ Updated HTML to include <img> tag with Logo_rectangle.svg
✓ Updated CSS to display logo at 58px height
✓ Added logo fallback styling
✓ Added logo error handling JavaScript (if missing)

Result: All 15 contraco.kr files now show proper logo at 58px"
```

---

## 📋 EXECUTION CHECKLIST

- [ ] Task 1: Update HTML logo structure in 8 files
- [ ] Task 2: Update CSS logo styling in 8 files
- [ ] Task 3: Add JavaScript error handling (if missing)
- [ ] Task 4: Run all validation commands
- [ ] Task 5: Commit changes with provided message
- [ ] Verify: `grep -c "height: 58px" BRAND-UPDATES-INTERNATIONAL/contraco.kr/*.html | wc -l` returns 15

---

## 🚨 IMPORTANT NOTES

1. **MUST use Read tool before Edit tool** for each file
2. **Match the exact structure** from working files (index.html, about.html, etc.)
3. **Preserve Korean text** in navigation (집, 서비스, etc.)
4. **Do NOT modify** files that already have correct logos (the 7 working files)
5. **Maintain responsive design** - logo should work on mobile too

---

## 🎯 QUICK START FOR CLAUDE

```
Please fix the missing logo images in contraco.kr. Read the file
BRAND-UPDATES-INTERNATIONAL/contraco.kr/URGENT-LOGO-FIX.md and execute
all tasks.

Focus: 8 files are missing the logo image and showing text "contraco" instead.
Files: ai-adoption-research.html, ai-strategy-framework.html, cultural-adaptation-guide.html,
leading-ai-transformation.html, organizational-design-ai.html, pricing-psychology.html,
resonance-method.html, strategic-intelligence.html

Reference working file: BRAND-UPDATES-INTERNATIONAL/contraco.kr/index.html
```

---

**Priority:** CRITICAL - Execute immediately
**Estimated Time:** 30-45 minutes
**Complexity:** Medium (8 files, HTML + CSS updates)

**END OF FIX INSTRUCTIONS**
