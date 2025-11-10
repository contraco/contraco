# CONTRACO.CO.KR: COMPLETE FIX INSTRUCTIONS
## All Critical Issues - 4 Files Requiring Fixes

**Status:** 🔴 URGENT - Based on comprehensive 68-file audit
**Repository:** BRAND-UPDATES-INTERNATIONAL/contraco.kr/

---

## OVERVIEW

**Total Files with Issues:** 4 out of 16
**Issue Types:** Wrong Google Analytics ID (2 files), Arrow bullets (3 files), Broken links (1 file)

---

## FILE 1: organizational-design-ai.html

### Issues Found:
1. ❌ **Google Analytics: WRONG ID** (G-JC5PMW72PK instead of G-868WGCC45D)
2. ❌ **Bullets: Using arrows →** instead of triangles ▸
3. ❌ **Broken Links: Wrong filename prefix**

### Fix 1: Google Analytics ID (Line 52-60)

**Find:**
```html
    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-JC5PMW72PK"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-JC5PMW72PK', {
```

**Replace with:**
```html
    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-868WGCC45D', {
```

**Changes:** Replace **G-JC5PMW72PK** with **G-868WGCC45D** (2 instances)

---

### Fix 2: Bullet Style (Line 422-427)

**Find:**
```css
        .industry-card li:before {
            content: "→";
            color: var(--primary-red);
            position: absolute;
            left: 0;
        }
```

**Replace with:**
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

### Fix 3: Broken Links (3 instances)

**Location 1 - Line 13:**
```html
<!-- WRONG -->
<link rel="alternate" hreflang="en" href="https://contraco.net/contraco-organizational-design-ai.html">

<!-- CORRECT -->
<link rel="alternate" hreflang="en" href="https://contraco.net/organizational-design-ai.html">
```

**Location 2 - Line 17:**
```html
<!-- WRONG -->
<link rel="alternate" hreflang="x-default" href="https://contraco.net/contraco-organizational-design-ai.html">

<!-- CORRECT -->
<link rel="alternate" hreflang="x-default" href="https://contraco.net/organizational-design-ai.html">
```

**Location 3 - Line 765:**
```html
<!-- WRONG -->
<a href="https://contraco.net/contraco-organizational-design-ai.html" class="lang-link">EN</a>

<!-- CORRECT -->
<a href="https://contraco.net/organizational-design-ai.html" class="lang-link">EN</a>
```

**Change:** Remove `contraco-` prefix from `contraco-organizational-design-ai.html` → `organizational-design-ai.html`

---

## FILE 2: leading-ai-transformation.html

### Issues Found:
1. ❌ **Google Analytics: WRONG ID** (G-JC5PMW72PK instead of G-868WGCC45D)

### Fix: Google Analytics ID

**Find in <head> section:**
```javascript
gtag('config', 'G-JC5PMW72PK'
```

**Replace with:**
```javascript
gtag('config', 'G-868WGCC45D'
```

**Also find:**
```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-JC5PMW72PK"></script>
```

**Replace with:**
```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
```

---

## FILE 3: strategic-intelligence.html

### Issues Found:
1. ❌ **Bullets: Using arrows →** instead of triangles ▸

### Fix: Bullet Style

**Find in <style> section:**
```css
content: "→";
```

**Replace with:**
```css
content: "▸";
```

**Note:** Look for this in the CSS rule for list items (likely `.insight-list li:before` or similar)

---

## FILE 4: digital-transformation-roi.html

### Issues Found:
1. ❌ **Bullets: Using arrows →** instead of triangles ▸

### Fix: Bullet Style

**Find in <style> section:**
```css
content: "→";
```

**Replace with:**
```css
content: "▸";
```

**Note:** Look for this in the CSS rule for list items

---

## VERIFICATION CHECKLIST

After making all fixes:

### organizational-design-ai.html:
- [ ] Google Analytics shows G-868WGCC45D (check both script src and config)
- [ ] Bullets display as ▸ (triangular pointer) not → (arrow)
- [ ] All EN language links use `organizational-design-ai.html` (no contraco- prefix)
- [ ] No 404 errors when clicking language switcher

### leading-ai-transformation.html:
- [ ] Google Analytics shows G-868WGCC45D

### strategic-intelligence.html:
- [ ] Bullets display as ▸ (triangular pointer) not → (arrow)

### digital-transformation-roi.html:
- [ ] Bullets display as ▸ (triangular pointer) not → (arrow)

---

## SUMMARY

**Total Edits Required:** 9 precise changes across 4 files
- 4 Google Analytics ID changes (2 files × 2 instances each)
- 3 Bullet character changes
- 3 Link URL fixes (remove contraco- prefix)

**Priority:** HIGH - Affects analytics tracking and user experience

**Estimated Time:** 10-15 minutes for all fixes
