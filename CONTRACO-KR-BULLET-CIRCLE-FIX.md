# CONTRACO.CO.KR: CRITICAL CSS FIXES
## Fix Bullets (Arrows) and Circles on organizational-design-ai.html

**Status:** 🔴 URGENT - User reported visual issues
**File:** `/home/user/contraco-net/BRAND-UPDATES-INTERNATIONAL/contraco.kr/organizational-design-ai.html`

---

## ISSUE 1: Bullets Showing as ARROWS ➔ Instead of Bullets ▸

**Current (WRONG):** Line 422-427
```css
.industry-card li:before {
    content: "→";
    color: var(--primary-red);
    position: absolute;
    left: 0;
}
```

**Fix Required:**
```css
.industry-card li:before {
    content: "▸";
    color: var(--primary-red);
    position: absolute;
    left: 0;
}
```

**Change:** `content: "→";` → `content: "▸";`

---

## ISSUE 2: Numbered Circles - Prevention Fix

**Current (POTENTIALLY PROBLEMATIC):** Lines 316-327
```css
.principle-number {
    display: inline-block;
    width: 40px;
    height: 40px;
    background: var(--primary-red);
    color: white;
    border-radius: 50%;
    text-align: center;
    line-height: 40px;
    font-weight: 600;
    margin-bottom: 20px;
}
```

**Fix Required (Match contraco.net standard):**
```css
.principle-number {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    background: var(--primary-red);
    color: white;
    border-radius: 50%;
    font-weight: 600;
    margin-bottom: 20px;
    flex-shrink: 0;
}
```

**Changes:**
1. `display: inline-block;` → `display: flex;`
2. Remove `text-align: center;`
3. Remove `line-height: 40px;`
4. Add `align-items: center;`
5. Add `justify-content: center;`
6. Add `flex-shrink: 0;` (CRITICAL - prevents distortion in flex containers!)

---

## ISSUE 3: Broken Links (Wrong Filename Prefix)

**Location 1:** Line 13 (hreflang tag)
```html
<!-- WRONG -->
<link rel="alternate" hreflang="en" href="https://contraco.net/contraco-organizational-design-ai.html">

<!-- CORRECT -->
<link rel="alternate" hreflang="en" href="https://contraco.net/organizational-design-ai.html">
```

**Location 2:** Line 17 (x-default hreflang tag)
```html
<!-- WRONG -->
<link rel="alternate" hreflang="x-default" href="https://contraco.net/contraco-organizational-design-ai.html">

<!-- CORRECT -->
<link rel="alternate" hreflang="x-default" href="https://contraco.net/organizational-design-ai.html">
```

**Location 3:** Line 765 (language switcher EN link)
```html
<!-- WRONG -->
<a href="https://contraco.net/contraco-organizational-design-ai.html" class="lang-link">EN</a>

<!-- CORRECT -->
<a href="https://contraco.net/organizational-design-ai.html" class="lang-link">EN</a>
```

**Change:** Remove `contraco-` prefix from `contraco-organizational-design-ai.html` → `organizational-design-ai.html`

---

## EXACT EDIT COMMANDS

### Edit 1: Fix Bullet Style
**Find (line 423):**
```css
            content: "→";
```

**Replace with:**
```css
            content: "▸";
```

---

### Edit 2: Fix Circle CSS (Replace entire .principle-number block)
**Find (lines 316-327):**
```css
        .principle-number {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: var(--primary-red);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            font-weight: 600;
            margin-bottom: 20px;
        }
```

**Replace with:**
```css
        .principle-number {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: var(--primary-red);
            color: white;
            border-radius: 50%;
            font-weight: 600;
            margin-bottom: 20px;
            flex-shrink: 0;
        }
```

---

### Edit 3: Fix hreflang link (line 13)
**Find:**
```html
    <link rel="alternate" hreflang="en" href="https://contraco.net/contraco-organizational-design-ai.html">
```

**Replace with:**
```html
    <link rel="alternate" hreflang="en" href="https://contraco.net/organizational-design-ai.html">
```

---

### Edit 4: Fix x-default hreflang link (line 17)
**Find:**
```html
    <link rel="alternate" hreflang="x-default" href="https://contraco.net/contraco-organizational-design-ai.html">
```

**Replace with:**
```html
    <link rel="alternate" hreflang="x-default" href="https://contraco.net/organizational-design-ai.html">
```

---

### Edit 5: Fix language switcher EN link (line 765)
**Find:**
```html
                    <a href="https://contraco.net/contraco-organizational-design-ai.html" class="lang-link">EN</a>
```

**Replace with:**
```html
                    <a href="https://contraco.net/organizational-design-ai.html" class="lang-link">EN</a>
```

---

## VERIFICATION CHECKLIST

After making changes:
- [ ] Bullets show as ▸ (triangular pointer) not → (arrow)
- [ ] Numbered circles are perfect circles, not ellipses
- [ ] All links to organizational-design-ai.html work (no 404 errors)
- [ ] Language switcher EN link works correctly

---

## ROOT CAUSE SUMMARY

1. **Arrows:** Used `"→"` character instead of `"▸"`
2. **Potential Ellipses:** Missing `flex-shrink: 0` could allow flex containers to distort circles
3. **404 Errors:** Used wrong prefix `contraco-organizational-design-ai` instead of `organizational-design-ai`

**Total Changes Required:** 5 precise edits
