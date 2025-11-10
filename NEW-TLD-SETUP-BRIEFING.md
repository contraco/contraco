# New TLD Setup Briefing Document
## contraco Website Adaptation Checklist

**Version:** 1.0
**Date:** 2025-11-10
**Purpose:** Complete checklist for adapting contraco website to a new Top-Level Domain

---

## 1. DOMAIN & DNS CONFIGURATION

### 1.1 Domain Registration
- [ ] Register new TLD domain
- [ ] Configure DNS settings
- [ ] Set up SSL/TLS certificates
- [ ] Update CNAME file with new domain

**Current CNAME:** `www.contraco.net`
**Action:** Replace with new domain (e.g., `www.contraco.com`, `www.contraco.eu`)

---

## 2. URL REFERENCES (CRITICAL)

### 2.1 HTML Files - Find & Replace
**Pattern to search:** `contraco.net` → `[NEW-TLD]`
**Locations:**

#### Canonical URLs
- [ ] `<link rel="canonical" href="https://contraco.net/...">`
- [ ] Update in ALL HTML files (25+ files)

#### Hreflang Tags (International SEO)
- [ ] `<link rel="alternate" href="https://contraco.net/..." hreflang="x-default">`
- [ ] `<link rel="alternate" hreflang="en" href="https://contraco.net/...">`
- [ ] Consider adding new TLD to hreflang matrix
- [ ] Update references to .de, .ru, .co.kr if needed

#### Navigation Links
- [ ] Logo link: `<a href="https://www.contraco.net/" class="logo">`
- [ ] Menu items (Home, Services, Methodology, Insights, About, Contact)
- [ ] Footer links (6 main links)
- [ ] CTA buttons: `<a href="https://www.contraco.net/#contact">`

#### Logo Image Source
- [ ] `<img src="https://contraco.net/Logo_rectangle.svg">`
- [ ] JavaScript fallback: `logoImg.src = 'https://contraco.net/Logo_rectangle.svg'`

#### Language Switcher Links
- [ ] EN: `https://contraco.net/[page].html`
- [ ] DE: `https://contraco.de/[page].html`
- [ ] RU: `https://contraco.ru/[page].html`
- [ ] KO: `https://contraco.co.kr/[page].html`
- [ ] **NEW TLD:** Add to language switcher array

#### Open Graph URLs
- [ ] `<meta property="og:url" content="https://www.contraco.net/...">`

---

## 3. SEO & META TAGS

### 3.1 Google Analytics
**Current ID:** `G-868WGCC45D`
- [ ] Decide: Keep same GA ID or create new property for new TLD
- [ ] Update tracking code if using separate property
- [ ] Configure cross-domain tracking if needed

### 3.2 Meta Descriptions
- [ ] Review and localize if targeting different market
- [ ] Verify keywords are appropriate for target region
- [ ] Check author meta tag

### 3.3 Robots & Indexing
- [ ] `<meta name="robots" content="index, follow">`
- [ ] Create/update robots.txt for new domain
- [ ] Submit new sitemap to Google Search Console

### 3.4 Structured Data (Schema.org)
```json
{
  "@type": "LocalBusiness",
  "name": "contraco",
  "url": "https://www.contraco.net/",  ← UPDATE
  "email": "mailto:transformation@contraco.net",
  "telephone": "+1-312-940-0326",
  "address": {
    "streetAddress": "1209 10th Ln.",
    "addressLocality": "Ava",
    "addressRegion": "MO",
    "postalCode": "65608",
    "addressCountry": "US"
  },
  "foundingDate": "1998"
}
```
- [ ] Update URL in structured data
- [ ] Consider if address/phone should change for regional TLD

---

## 4. BRAND ASSETS & STYLING

### 4.1 Logo Specifications
**Current Standard:** Logo height = **58px** (recently updated)
- [ ] Verify logo displays at 58px in header
- [ ] Check responsive breakpoints
- [ ] Test on mobile (should be consistent)

### 4.2 Logo Files
**Primary Assets:**
- `Logo_rectangle.svg` (vector, preferred)
- `Logo_rectangle.png` (fallback)

**Action:**
- [ ] Verify logo CDN URLs point correctly
- [ ] Consider if logo needs regional variation
- [ ] Test logo fallback mechanism

### 4.3 Brand Colors (CSS Variables)
**Current Color Palette:**
```css
--primary-red: #C00000;
--deep-charcoal: #404040;
--warm-white: #F8F6F3;
--warm-gray-light: #E5E2DD;
--warm-gray-medium: #A8A5A0;
--warm-gray-dark: #6B6B6B;
```

- [ ] **Confirm:** Keep same colors or rebrand?
- [ ] **If rebranding:** Update all CSS variables across 25+ HTML files
- [ ] Update theme-color meta tag: `<meta name="theme-color" content="#C00000">`
- [ ] Update msapplication-TileColor: `<meta name="msapplication-TileColor" content="#C00000">`

---

## 5. FAVICON & APP ICONS

### 5.1 Complete Favicon Set (29 files)
**Files to update if rebranding:**
- [ ] `favicon.ico`
- [ ] `favicon-16x16.png`
- [ ] `favicon-32x32.png`
- [ ] `favicon-96x96.png`
- [ ] Apple Touch Icons (9 sizes: 57, 60, 72, 76, 114, 120, 144, 152, 180)
- [ ] Android Icons (5 sizes: 36, 48, 72, 96, 144, 192)
- [ ] MS Tile Icons

**Action:**
- [ ] If keeping brand: Copy all favicon files to new domain
- [ ] If rebranding: Generate new favicon set with new colors
- [ ] Update `site.webmanifest` with correct paths/colors

---

## 6. FONTS & TYPOGRAPHY

### 6.1 Google Fonts
**Current Fonts:**
- Crimson Text (serif): 400, 600, italic
- Inter (sans-serif): 300, 400, 500, 600, 700

**CSS Variables:**
```css
--font-serif: 'Crimson Text', Georgia, 'Times New Roman', serif;
--font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

- [ ] Confirm: Keep same fonts or change?
- [ ] Verify Google Fonts CDN loads properly
- [ ] Test fallback fonts

---

## 7. CONTACT INFORMATION

### 7.1 Email Addresses
**Current:** `transformation@contraco.net`
- [ ] **Decision:** Keep .net email or create @[NEW-TLD] email?
- [ ] Update email in footer (appears on all pages)
- [ ] Update email in structured data
- [ ] Update contact form submission endpoint

### 7.2 Phone Number
**Current:** `+1 (312) 940-0326`
- [ ] Verify: Keep same number or add regional number?
- [ ] Update in footer
- [ ] Update in structured data

### 7.3 Physical Address
**Current:**
```
1209 10th Ln.
Ava, MO 65608
United States
```
- [ ] Verify: Keep USA address or add regional office?
- [ ] Update footer on all pages
- [ ] Update structured data

---

## 8. CONTENT LOCALIZATION

### 8.1 Language & Market Fit
- [ ] **Determine target market** for new TLD
- [ ] Review content for cultural appropriateness
- [ ] Check currency references (if any)
- [ ] Verify date/time formats
- [ ] Review idioms and expressions

### 8.2 Legal & Compliance
- [ ] Update copyright notice: `© 2025 contraco. All rights reserved.`
- [ ] Review trademark notices: `The Resonance Method™`
- [ ] Check GDPR compliance (if EU TLD)
- [ ] Add privacy policy link if required
- [ ] Add cookie consent if required
- [ ] Review terms of service

---

## 9. PAGE-SPECIFIC ELEMENTS

### 9.1 HTML Files Requiring Updates (25+ files)

**Main Directory:**
- [ ] index.html
- [ ] about.html
- [ ] insights.html
- [ ] contact.html
- [ ] thank-you.html
- [ ] ai-strategy-framework.html
- [ ] ai-adoption-research.html
- [ ] leading-ai-transformation.html
- [ ] organizational-design-ai.html
- [ ] pricing-psychology.html
- [ ] digital-transformation-roi.html
- [ ] cultural-adaptation-guide.html
- [ ] resonance-method.html
- [ ] strategic-intelligence.html
- [ ] copyright.html

**International Directories (if applicable):**
- [ ] BRAND-UPDATES-INTERNATIONAL/contraco.com/ (1 file)
- [ ] BRAND-UPDATES-INTERNATIONAL/contraco.de/ (8 files)
- [ ] BRAND-UPDATES-INTERNATIONAL/contraco.kr/ (7 files)
- [ ] BRAND-UPDATES-INTERNATIONAL/contraco.ru/ (7 files)

### 9.2 Navigation Template
- [ ] Update main navigation_template.html
- [ ] Propagate to all international versions

---

## 10. JAVASCRIPT & INTERACTIVITY

### 10.1 Analytics Tracking
```javascript
gtag('config', 'G-868WGCC45D', {
    page_title: 'contraco - Digital Transformation Veterans Since 1998',
    page_location: window.location.href
});
```
- [ ] Update GA ID if needed
- [ ] Verify page_location captures correct URL
- [ ] Test event tracking (CTA clicks, form submissions)

### 10.2 Logo Error Handling
```javascript
logoImg.src = 'https://contraco.net/Logo_rectangle.svg';
```
- [ ] Update fallback URL to new TLD
- [ ] Test retry mechanism

### 10.3 Smooth Scrolling & Navigation
- [ ] Test anchor links with new domain
- [ ] Verify navbar scroll effects
- [ ] Test language switcher functionality

---

## 11. TESTING CHECKLIST

### 11.1 Pre-Launch Testing
- [ ] Test all internal links (automated link checker)
- [ ] Verify all external resources load (fonts, images, scripts)
- [ ] Test logo at 58px across all pages
- [ ] Verify brand colors display consistently
- [ ] Test responsive design (mobile, tablet, desktop)
- [ ] Check page load speed (GTmetrix, PageSpeed Insights)
- [ ] Validate HTML (W3C Validator)
- [ ] Test contact form submissions
- [ ] Verify SSL certificate installation
- [ ] Test cross-browser compatibility (Chrome, Firefox, Safari, Edge)

### 11.2 SEO Testing
- [ ] Verify meta tags with Meta Tags Inspector
- [ ] Test structured data with Google Rich Results Test
- [ ] Check canonical URLs resolve correctly
- [ ] Verify hreflang implementation
- [ ] Test robots.txt accessibility
- [ ] Submit sitemap to search engines

### 11.3 Analytics Testing
- [ ] Verify Google Analytics tracking
- [ ] Test event tracking (button clicks)
- [ ] Check real-time reports
- [ ] Set up goals/conversions

---

## 12. CONTENT CHANGES TO CONSIDER

### 12.1 Elements to REMOVE (if not applicable)
- [ ] References to ".net" in body content
- [ ] USA-specific language (if targeting non-US market)
- [ ] Incompatible payment methods or currencies
- [ ] Region-specific case studies or testimonials

### 12.2 Elements to ADD
- [ ] Regional testimonials or case studies
- [ ] Local market references
- [ ] Regional certifications or partnerships
- [ ] Local payment methods
- [ ] Regional customer support information
- [ ] Translated resources (if multilingual)

### 12.3 Elements to RECOLOR (if rebranding)
- [ ] Primary CTA buttons (current: #C00000)
- [ ] Hover effects and transitions
- [ ] Border accents and dividers
- [ ] Badge backgrounds (executive badges, duration tags)
- [ ] Card borders and highlights
- [ ] Footer background
- [ ] Navigation active states

### 12.4 Elements to RESIZE (beyond logo)
- [ ] Hero section text (verify for new market)
- [ ] Button padding (cultural preferences)
- [ ] Card spacing (regional design trends)
- [ ] Mobile breakpoints (device usage patterns)

---

## 13. DEPLOYMENT CHECKLIST

### 13.1 Pre-Deployment
- [ ] Backup current site
- [ ] Set up staging environment
- [ ] Complete all URL updates
- [ ] Test staging thoroughly
- [ ] Set up monitoring (uptime, errors)

### 13.2 Deployment
- [ ] Update CNAME file
- [ ] Deploy to production
- [ ] Verify DNS propagation
- [ ] Test SSL certificate
- [ ] Submit to search engines

### 13.3 Post-Deployment
- [ ] Monitor traffic and errors
- [ ] Check analytics are tracking
- [ ] Verify forms are working
- [ ] Test from multiple locations
- [ ] Set up 301 redirects (if migrating from old domain)

---

## 14. MAINTENANCE & ONGOING

### 14.1 Regular Updates
- [ ] Monitor broken links monthly
- [ ] Update copyright year annually
- [ ] Review and update content quarterly
- [ ] Check SSL certificate expiration
- [ ] Monitor site performance
- [ ] Update dependencies (fonts, scripts)

### 14.2 Cross-TLD Coordination
- [ ] Keep hreflang tags synchronized across all TLDs
- [ ] Maintain consistent branding
- [ ] Coordinate content updates
- [ ] Monitor for duplicate content issues

---

## 15. QUICK REFERENCE: FIND & REPLACE PATTERNS

### 15.1 Required Find & Replace Operations

| Find | Replace | Files Affected | Priority |
|------|---------|----------------|----------|
| `contraco.net` | `[NEW-TLD]` | All HTML | CRITICAL |
| `www.contraco.net` | `www.[NEW-TLD]` | All HTML | CRITICAL |
| `https://contraco.net/` | `https://[NEW-TLD]/` | All HTML | CRITICAL |
| `transformation@contraco.net` | `transformation@[NEW-TLD]` | All HTML | HIGH |
| `G-868WGCC45D` | `[NEW-GA-ID]` | All HTML | MEDIUM |
| `height: 36px` | `height: 58px` | N/A | ✓ DONE |

### 15.2 Optional Find & Replace (if rebranding)

| Find | Replace | Files Affected | Priority |
|------|---------|----------------|----------|
| `#C00000` | `[NEW-PRIMARY-COLOR]` | All HTML | HIGH |
| `#404040` | `[NEW-CHARCOAL]` | All HTML | MEDIUM |
| `#F8F6F3` | `[NEW-WARM-WHITE]` | All HTML | MEDIUM |

---

## 16. AUTOMATION RECOMMENDATIONS

### 16.1 Scripted Updates
Consider creating bash scripts for:
```bash
# Update all domain references
find . -name "*.html" -exec sed -i 's/contraco\.net/NEW-TLD/g' {} \;

# Update email addresses
find . -name "*.html" -exec sed -i 's/transformation@contraco\.net/transformation@NEW-TLD/g' {} \;
```

### 16.2 Validation Scripts
- Create automated link checker
- Set up HTML validation pipeline
- Implement visual regression testing

---

## 17. RISK ASSESSMENT

### HIGH RISK (Must Verify)
- ⚠️ Broken internal links
- ⚠️ Missing canonical tags
- ⚠️ Incorrect hreflang configuration
- ⚠️ SSL certificate errors
- ⚠️ Analytics not tracking

### MEDIUM RISK (Should Verify)
- ⚠️ Mixed content warnings (HTTP/HTTPS)
- ⚠️ Favicon not loading
- ⚠️ Logo display issues
- ⚠️ Contact form errors

### LOW RISK (Nice to Have)
- ⚠️ Minor styling inconsistencies
- ⚠️ Font loading delays
- ⚠️ Animation performance

---

## 18. CONTACT & SUPPORT

### Key Stakeholders
- **Technical Lead:** [Name]
- **Content Manager:** [Name]
- **SEO Specialist:** [Name]
- **Brand Manager:** [Name]

### External Services
- Domain Registrar: [Provider]
- DNS Provider: [Provider]
- Hosting: GitHub Pages / [Provider]
- SSL Certificate: Let's Encrypt / [Provider]
- Analytics: Google Analytics
- CDN: [If applicable]

---

## 19. TIMELINE ESTIMATE

| Phase | Duration | Dependencies |
|-------|----------|--------------|
| Planning & Requirements | 1-2 days | Business decision on TLD |
| Domain Registration & DNS | 1-3 days | Registrar processing |
| Content Updates | 2-3 days | Decision on rebranding |
| Asset Creation (if rebrand) | 3-5 days | Design approval |
| Development & Testing | 3-5 days | Staging environment |
| QA & Bug Fixes | 2-3 days | Test completion |
| Deployment | 1 day | All approvals |
| Post-launch Monitoring | Ongoing | - |

**Total Estimated Timeline:** 2-4 weeks

---

## 20. APPENDIX: FILE LOCATIONS

### Key Files
```
/CNAME                           ← Domain configuration
/index.html                      ← Homepage (main reference)
/Logo_rectangle.svg              ← Primary logo
/Logo_rectangle.png              ← Logo fallback
/site.webmanifest               ← PWA manifest
/favicon.ico                     ← Main favicon

/BRAND-UPDATES-INTERNATIONAL/    ← International versions
  ├── contraco.com/
  ├── contraco.de/
  ├── contraco.kr/
  └── contraco.ru/
```

### Configuration Files to Review
- CNAME
- site.webmanifest
- robots.txt (if exists)
- sitemap.xml (if exists)

---

## SIGN-OFF

- [ ] Technical review completed
- [ ] Content review completed
- [ ] Legal review completed (if required)
- [ ] Brand review completed (if rebrand)
- [ ] Stakeholder approval obtained
- [ ] Ready for deployment

---

**Document Version:** 1.0
**Last Updated:** 2025-11-10
**Next Review:** Before deployment

---

## NOTES & DECISIONS LOG

| Date | Decision | Made By | Impact |
|------|----------|---------|--------|
| 2025-11-10 | Logo size standardized to 58px | Technical | All pages |
| | | | |
| | | | |

---

**END OF BRIEFING DOCUMENT**
