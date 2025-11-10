#!/bin/bash
# CONTRACO.DE DEPLOYMENT VERIFICATION SCRIPT
# Run this in the contraco.de Claude session to verify all fixes are deployed
# Expected: 100% PASS on all checks

echo "================================"
echo "CONTRACO.DE VERIFICATION SCRIPT"
echo "================================"
echo ""

PASS=0
FAIL=0

# Check 1: Logo Sources (ALL 16 files should use contraco.de, not contraco.net)
echo "CHECK 1: Logo Source Domain"
echo "----------------------------"
WRONG_LOGO=$(grep -r "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)
CORRECT_LOGO=$(grep -r "contraco\.de/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)

if [ "$WRONG_LOGO" -eq 0 ] && [ "$CORRECT_LOGO" -ge 15 ]; then
    echo "✅ PASS: All logos load from contraco.de ($CORRECT_LOGO files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $WRONG_LOGO files loading from contraco.net (should be 0)"
    echo "❌ FAIL: Found $CORRECT_LOGO files loading from contraco.de (should be 15+)"
    ((FAIL++))
    grep -l "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | head -5
fi
echo ""

# Check 2: Logo Size (should be 58px, not 40px or other)
echo "CHECK 2: Logo Size"
echo "------------------"
LOGO_58=$(grep -h "\.logo img" *.html 2>/dev/null | grep -c "height: 58px")

if [ "$LOGO_58" -ge 15 ]; then
    echo "✅ PASS: Logo height is 58px in $LOGO_58 files"
    ((PASS++))
else
    echo "❌ FAIL: Only $LOGO_58 files have 58px logo (should be 15+)"
    ((FAIL++))
    # Show which files have wrong size
    for f in *.html; do
        SIZE=$(grep -A2 "\.logo img" "$f" 2>/dev/null | grep "height:" | grep -o "[0-9]*px" | head -1)
        if [ -n "$SIZE" ] && [ "$SIZE" != "58px" ]; then
            echo "  - $f: $SIZE ❌"
        fi
    done
fi
echo ""

# Check 3: Google Analytics ID (should be G-868WGCC45D, not G-JC5PMW72PK)
echo "CHECK 3: Google Analytics ID"
echo "----------------------------"
WRONG_GA=$(grep -l "G-JC5PMW72PK" *.html 2>/dev/null | wc -l)
CORRECT_GA=$(grep -l "G-868WGCC45D" *.html 2>/dev/null | wc -l)

if [ "$WRONG_GA" -eq 0 ] && [ "$CORRECT_GA" -ge 15 ]; then
    echo "✅ PASS: Correct GA ID (G-868WGCC45D) in $CORRECT_GA files"
    ((PASS++))
else
    echo "❌ FAIL: Found wrong GA ID in $WRONG_GA files:"
    ((FAIL++))
    grep -l "G-JC5PMW72PK" *.html 2>/dev/null | head -5
fi
echo ""

# Check 4: Contact Form Integration (should use FormSubmit, not action="#")
echo "CHECK 4: Contact Form"
echo "---------------------"
BROKEN_FORM=$(grep -l 'action="#"' *.html 2>/dev/null | wc -l)
WORKING_FORM=$(grep -l "formsubmit.co" *.html 2>/dev/null | wc -l)

if [ "$BROKEN_FORM" -eq 0 ] && [ "$WORKING_FORM" -ge 1 ]; then
    echo "✅ PASS: Contact forms use FormSubmit ($WORKING_FORM files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $BROKEN_FORM files with broken forms (action=\"#\")"
    ((FAIL++))
    grep -l 'action="#"' *.html 2>/dev/null
fi
echo ""

# Check 5: Bullet Styles (should be ▸ not →)
echo "CHECK 5: Bullet Styles"
echo "----------------------"
WRONG_BULLETS=$(grep -r 'content: "→"' *.html 2>/dev/null | wc -l)

if [ "$WRONG_BULLETS" -eq 0 ]; then
    echo "✅ PASS: No arrow bullets found (0 files)"
    ((PASS++))
else
    echo "❌ FAIL: Found arrow bullets in files:"
    ((FAIL++))
    grep -l 'content: "→"' *.html 2>/dev/null
fi
echo ""

# Check 6: Broken Links (underscores should be hyphens)
echo "CHECK 6: Broken Links"
echo "---------------------"
BROKEN_LINKS=$(grep -r "organizational_design_ai" *.html 2>/dev/null | wc -l)

if [ "$BROKEN_LINKS" -eq 0 ]; then
    echo "✅ PASS: No broken links with underscores (0 files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $BROKEN_LINKS instances of broken links (underscores)"
    ((FAIL++))
    grep -l "organizational_design_ai" *.html 2>/dev/null
fi
echo ""

# Final Summary
echo "==============================="
echo "VERIFICATION SUMMARY"
echo "==============================="
echo "Checks Passed: $PASS / 6"
echo "Checks Failed: $FAIL / 6"
echo ""

if [ "$FAIL" -eq 0 ]; then
    echo "🎉 100% COMPLIANCE ACHIEVED!"
    echo "All fixes have been successfully deployed."
    exit 0
else
    COMPLIANCE=$((PASS * 100 / 6))
    echo "⚠️  $COMPLIANCE% COMPLIANCE"
    echo "Please review failed checks above and apply fixes."
    exit 1
fi
