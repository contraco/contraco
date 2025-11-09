# CONTRACO Bullet Styles Inventory

**Generated:** 2025-11-09
**Purpose:** Complete inventory of all bullet/list styles across CONTRACO domains

---

## Bullet Styles Summary

Based on analysis of all HTML files across all domains:

### Arrow Bullets: `→`

**Used in:**
- **contraco.net:** index.html, resonance-method.html, leading-ai-transformation.html
- **contraco.de:** index.html
- **contraco.kr:** index.html
- **contraco.ru:** insights.html

**Example CSS:**
```css
.service-features li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

**Visual:** → (right arrow)

---

### Dot Bullets: `•`

**Used in:**
- **contraco.net:** organizational-design-ai.html, cultural-adaptation-guide.html, digital-transformation-roi.html
- **contraco.de:** cultural-guide.html
- **contraco.kr:** cultural-adaptation-guide.html
- **contraco.ru:** (none found)

**Example CSS:**
```css
.list-item li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

**Visual:** • (bullet point)

---

## Files Using Arrow Bullets (→)

### contraco.net

**index.html (line 421)**
```css
.service-features li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

**resonance-method.html (line 492)**
```css
.difference-list li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

**leading-ai-transformation.html (line 740)**
```css
.roadmap-objectives li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

---

### contraco.de

**index.html (line 437)**
```css
.service-features li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

---

### contraco.kr

**index.html (line 437)**
```css
.service-features li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

---

### contraco.ru

**insights.html (line 353)**
```css
li::before {
    content: ' →';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

---

## Files Using Dot Bullets (•)

### contraco.net

**organizational-design-ai.html (line 608)**
```css
li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

**cultural-adaptation-guide.html (line 385)**
```css
li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

**digital-transformation-roi.html (line 576)**
```css
li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

---

### contraco.de

**cultural-guide.html (line 391)**
```css
li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

---

### contraco.kr

**cultural-adaptation-guide.html (line 408)**
```css
li::before {
    content: '•';
    position: absolute;
    left: 0;
    color: var(--primary-red);
}
```

---

## User Preferences

**✅ LIKED:** Triangle version on contraco.net
- *Note: Current implementation uses arrows (→), which may appear triangular in certain fonts*

**❌ DISLIKED:** Arrows in contraco.de and contraco.kr
- Both use `content: '→'` arrows in index.html

---

## Proposed Changes

### Option 1: Replace Arrows with Right-Pointing Triangle
Replace all `content: '→'` with `content: '▸'` (Unicode U+25B8)

```css
li::before {
    content: '▸';  /* Right-pointing triangle */
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

Visual: ▸

---

### Option 2: Replace Arrows with Filled Triangle
Replace all `content: '→'` with `content: '▶'` (Unicode U+25B6)

```css
li::before {
    content: '▶';  /* Filled right-pointing triangle */
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}
```

Visual: ▶

---

### Option 3: Use SVG Triangle Icon
Replace CSS content with inline SVG

```html
<style>
.custom-list li {
    padding-left: 24px;
    position: relative;
}

.custom-list li::before {
    content: '';
    position: absolute;
    left: 0;
    top: 8px;
    width: 0;
    height: 0;
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
    border-left: 8px solid var(--primary-red);
}
</style>
```

Visual: ▶ (CSS triangle)

---

## Summary Table

| Domain | Arrow Bullets (→) | Dot Bullets (•) | Total Bullet Styles |
|--------|-------------------|-----------------|---------------------|
| contraco.net | 3 files | 3 files | 6 files |
| contraco.de | 1 file | 1 file | 2 files |
| contraco.ru | 1 file | 0 files | 1 file |
| contraco.kr | 1 file | 1 file | 2 files |
| **TOTAL** | **6 files** | **5 files** | **11 files** |

---

## Next Steps

1. **Confirm preferred bullet style** (▸, ▶, or CSS triangle)
2. **Replace arrows in disliked locations** (contraco.de, contraco.kr)
3. **Standardize across all domains** (optional)
4. **Test rendering across browsers** (ensure Unicode characters display correctly)
5. **Deploy changes**

---

**Contact:** transformation@contraco.net
**Project:** CONTRACO Brand Implementation
**Session:** claude/contraco-brand-implementation-011CUxxA1S7LmM1k6vg8JR2q
