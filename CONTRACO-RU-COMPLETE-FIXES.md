# CONTRACO.RU: COMPLETE FIX INSTRUCTIONS
## All Critical Issues - 2 Files Requiring Fixes

**Status:** 🔴 CRITICAL BRANDING ISSUE - Based on comprehensive 68-file audit
**Repository:** BRAND-UPDATES-INTERNATIONAL/contraco.ru/

---

## OVERVIEW

**Total Files with Issues:** 2 out of 16
**Issue Types:** Logo size wrong (1 file - CRITICAL), Arrow bullets (1 file)

---

## FILE 1: index.html ⚠️ CRITICAL BRANDING ISSUE

### Issues Found:
1. ❌ **Logo: 40px instead of 58px** - CRITICAL BRANDING CONSISTENCY ISSUE

### Fix: Logo Size (In <style> section)

**Find:**
```css
.logo img {
    height: 40px;
    width: auto;
}
```

**Replace with:**
```css
.logo img {
    height: 58px;
    width: auto;
}
```

**Change:** `height: 40px;` → `height: 58px;`

**Priority:** IMMEDIATE - This is a brand consistency violation across all contraco domains

---

## FILE 2: strategic-intelligence.html

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

**Note:** Look for this in the CSS rule for list items (likely in a rule like `.insight-list li:before`, `.key-points li:before`, or similar)

**Tip:** To find the exact location, search for:
- `content: "→"`
- `li:before` or `li::before`

The bullet style will be defined in a CSS rule that applies to list items.

---

## VERIFICATION CHECKLIST

After making all fixes:

### index.html:
- [ ] Logo renders at 58px height (not 40px)
- [ ] Logo maintains aspect ratio (should be approximately 144x58px when rendered)
- [ ] Logo matches size on contraco.net, contraco.de, contraco.kr, contraco.com
- [ ] Visual inspection: Logo should not appear smaller than other domains

### strategic-intelligence.html:
- [ ] Bullets display as ▸ (triangular pointer) not → (arrow)
- [ ] Bullet style matches contraco.net reference site

---

## ADDITIONAL NOTES

### Logo Size Standard
The **58px** logo height is the contraco brand standard across ALL domains:
- ✅ contraco.net: 58px
- ✅ contraco.com: 58px
- ✅ contraco.de: 58px
- ✅ contraco.kr: 58px
- ❌ contraco.ru: 40px (NEEDS FIX)

### Why This Matters
- **Brand consistency:** All contraco properties must have identical visual branding
- **User experience:** Logo size affects site hierarchy and professional appearance
- **Design system:** 58px is the canonical size in the contraco design system

---

## SUMMARY

**Total Edits Required:** 2 precise changes across 2 files
- 1 Logo size change (40px → 58px) - CRITICAL
- 1 Bullet character change (→ → ▸)

**Priority:** IMMEDIATE (Logo) + HIGH (Bullets)

**Estimated Time:** 5 minutes for all fixes

**Impact:**
- Logo fix: Ensures brand consistency with 4 other domains
- Bullet fix: Improves visual consistency and user experience
