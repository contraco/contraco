# CRITICAL ISSUES REPORT - Live Site Verification
## User-Reported Issues from Live Websites

**Date:** 2025-11-10
**Source:** Live website inspection by user
**Status:** 🔴 CRITICAL - Multiple branding issues

---

## 🔴 ISSUE 1: 404 Error on contraco.net

**URL:** https://www.contraco.net/organizational_design_ai.html
**Error:** 404 Not Found
**Problem:** URL uses UNDERSCORE `organizational_design_ai.html`
**Correct filename:** `organizational-design-ai.html` (with HYPHENS)

### Root Cause:
Link somewhere is using wrong filename format (underscores instead of hyphens)

### Impact:
- Broken link on contraco.net
- User cannot access organizational design AI content
- SEO impact - 404 error

### Fix Required:
1. Find all links pointing to `organizational_design_ai.html`
2. Update to `organizational-design-ai.html` (with hyphens)
3. Check for other files with same issue

**Search command:**
```bash
grep -r "organizational_design_ai" /home/user/contraco-net/*.html
grep -r "_ai\.html\|_psychology\.html\|_transformation\.html" /home/user/contraco-net/*.html
```

---

## 🔴 ISSUE 2: Wrong Logo Files on International TLDs

**Affected Domains:** contraco.ru, contraco.de, contraco.kr

### User Report:
> "logos for RU, De, KR in the right size but the 'old contraco logo'"

### Analysis:
- ✓ Logo **SIZE** is correct (displayed properly)
- ✗ Logo **FILE** is wrong - showing "old contraco logo" design
- All three TLDs reference: `https://contraco.net/Logo_rectangle.svg`

### Possible Causes:
1. **Logo_rectangle.svg is the old version**
   - Need to replace with new logo design
   - Current file: /home/user/contraco-net/Logo_rectangle.svg (2.4K, viewBox="0 0 268 108")

2. **New logo file has different name**
   - Need to identify correct new logo filename
   - Update all international TLD references

3. **Live site has different logo than repository**
   - Repository may be out of sync with deployed logo
   - Need to verify actual logo file on live server

### Impact:
- Brand inconsistency across 3 international markets
- Outdated branding visible to international customers
- Professional image compromised

### Fix Required:
1. **Identify correct "new" logo file**
   - What is the filename of the new/correct logo?
   - Where is it located?

2. **Update all international TLD references:**
   - contraco.ru: 14 files
   - contraco.de: 12+ files
   - contraco.kr: 11 files

3. **Ensure logo files are deployed:**
   - Deploy new logo to each domain if using local paths
   - OR update to correct contraco.net URL if centralized

---

## 🔴 ISSUE 3: Wrong Logo Size on contraco.net

**Affected Domain:** contraco.net

### User Report:
> "contraco.net 'right logo' but wrong size"

### Analysis:
**Repository shows:**
```css
.logo img {
    height: 58px;  /* Line 137 in index.html */
    width: auto;
    transition: transform 0.3s ease;
}
```

**But user reports:** Logo displays at wrong size on LIVE site

### Discrepancy:
**Option A:** Live site code ≠ Repository code
- Repository has 58px
- Live deployment has different value (likely 40px, 36px, or 50px)
- Code not yet deployed

**Option B:** Visual rendering issue
- CSS is 58px but something else affecting display
- Transform/scale CSS affecting visual size
- Container constraints

**Option C:** Different logo file
- New logo has different intrinsic dimensions
- 58px height renders differently with new logo aspect ratio

### Impact:
- Brand inconsistency on main English site
- Logo appears smaller than intended
- Visual hierarchy compromised

### Fix Required:
1. **Verify actual live site CSS**
   - Inspect element on live https://contraco.net
   - Check computed height value

2. **If code mismatch:**
   - Deploy repository code (58px) to live site

3. **If logo file issue:**
   - Verify correct logo SVG is being used
   - Adjust height if needed for new logo proportions

---

## 🔴 ISSUE 4: Wrong Favicon on DE and KR

**Affected Domains:** contraco.de, contraco.kr
**Working Domains:** contraco.ru, contraco.net (favicons OK)

### User Report:
> "favicon for RU and .net ok but for KR and DE the old favicon"

### Analysis:
**Current favicon references in code:**
```html
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
```

**Repository status:**
- ✓ contraco.net: Has favicon files in root directory
- ✗ contraco.de: NO favicon files in TLD directory
- ✗ contraco.kr: NO favicon files in TLD directory
- ? contraco.ru: Status unknown but user reports it's OK

**Problem:**
DE and KR are using root-relative paths `/favicon.ico` which load from their own domains, but those domains have OLD favicon files deployed.

### Impact:
- Outdated favicon shown in browser tabs for German and Korean sites
- Brand inconsistency
- User confusion (old branding)

### Fix Required:

**Option A: Deploy new favicons to each domain**
1. Copy new favicon files to contraco.de server root
2. Copy new favicon files to contraco.kr server root
3. Ensure all sizes deployed:
   - favicon.ico
   - favicon-16x16.png
   - favicon-32x32.png
   - favicon-96x96.png
   - apple-touch-icon (various sizes)
   - mstile-144x144.png

**Option B: Use absolute URLs to contraco.net**
```html
<link rel="icon" href="https://contraco.net/favicon.ico">
<link rel="icon" sizes="16x16" href="https://contraco.net/favicon-16x16.png">
```

---

## 📋 SUMMARY OF LIVE SITE ISSUES

| Issue | Domains Affected | Severity | Type |
|-------|-----------------|----------|------|
| 404 Error (organizational_design_ai.html) | contraco.net | 🔴 HIGH | Broken Link |
| Wrong logo file (old design) | contraco.ru, .de, .kr | 🔴 CRITICAL | Branding |
| Wrong logo size | contraco.net | 🔴 HIGH | Visual |
| Old favicon | contraco.de, .kr | 🔴 HIGH | Branding |

---

## 🎯 IMMEDIATE ACTION REQUIRED

### Priority 1 - Fix 404 Error (5 minutes)
- [ ] Search all files for `organizational_design_ai` links
- [ ] Update to `organizational-design-ai` (with hyphens)
- [ ] Verify no other files have underscore/hyphen mismatches
- [ ] Deploy fix
- [ ] Test URL: https://www.contraco.net/organizational-design-ai.html

### Priority 2 - Identify Correct Logo & Favicon Files (10 minutes)
- [ ] **User to provide:**
  - What is the correct "new" logo filename?
  - What is the correct "new" favicon filename?
  - Where are these files located?
- [ ] Verify files exist in repository or on server
- [ ] Compare old vs new logo visually
- [ ] Compare old vs new favicon visually

### Priority 3 - Update Logo References (30 minutes)
Once correct logo identified:
- [ ] Update contraco.ru: 14 files → new logo
- [ ] Update contraco.de: 12 files → new logo
- [ ] Update contraco.kr: 11 files → new logo
- [ ] Fix contraco.net logo size if needed
- [ ] Deploy all changes

### Priority 4 - Update Favicons (20 minutes)
Once correct favicon identified:
- [ ] Deploy new favicon files to contraco.de
- [ ] Deploy new favicon files to contraco.kr
- [ ] Verify all sizes (16x16, 32x32, 96x96, apple-touch-icon, etc.)
- [ ] Clear browser cache and test

---

## ❓ QUESTIONS FOR USER

To proceed with fixes, please provide:

1. **Logo Files:**
   - What is the filename of the correct/new logo? (e.g., Logo_new.svg, Logo_2025.svg?)
   - Where is this file located?
   - Can you send/show the new logo design?

2. **Logo Size on contraco.net:**
   - When you inspect the logo on live https://contraco.net, what height does it show in DevTools?
   - Does it look noticeably smaller than the logos on RU/DE/KR?

3. **Favicon Files:**
   - What is the filename of the correct/new favicon?
   - Can you access the favicon files to send/show them?
   - Are the "old" favicons significantly different from new ones?

4. **Deployment Access:**
   - Do you have access to deploy files to the live servers?
   - OR should these fixes be committed to repository for CI/CD deployment?

---

## 📝 NOTES

### Repository vs Live Site Discrepancy

**Key Finding:** Repository code shows correct values (58px, proper filenames), but user reports live site has issues. This indicates:

1. **Code in repository ≠ Code on live servers**
   - Recent commits may not be deployed
   - OR live site has manual changes not in repo

2. **Asset files may be outdated**
   - Logo SVG might need updating
   - Favicon files need deployment to international domains

3. **Need synchronization**
   - Either deploy repository code to live
   - OR update repository to match live + fix issues

---

**AWAITING USER INPUT TO PROCEED WITH FIXES**

---

## 🔍 DIAGNOSTIC COMMANDS

### To find filename mismatches:
```bash
# Find links with underscores that should be hyphens
grep -rn "_ai\.html\|_psychology\.html\|_research\.html" *.html

# Find all links to organizational file
grep -rn "organizational" *.html | grep "href"
```

### To check logo files:
```bash
# List all SVG files
find . -name "*.svg" -type f

# Check logo dimensions
grep "viewBox" Logo*.svg
```

### To verify favicon deployment:
```bash
# Check which domains have favicon files
for domain in contraco.de contraco.kr contraco.ru; do
  echo "=== $domain ==="
  ls BRAND-UPDATES-INTERNATIONAL/$domain/favicon* 2>/dev/null || echo "No favicon files"
done
```

---

**END OF CRITICAL ISSUES REPORT**
**Status:** Awaiting user input on logo/favicon files before implementing fixes
