#!/bin/bash
# CONTRACO.CO.KR DEPLOYMENT VERIFICATION SCRIPT
# Run this in the contraco.kr Claude session to verify all fixes are deployed
# Expected: 100% PASS on all checks

echo "==================================="
echo "CONTRACO.CO.KR VERIFICATION SCRIPT"
echo "==================================="
echo ""

PASS=0
FAIL=0

# Check 1: Logo Sources (ALL files should use contraco.co.kr, not contraco.net)
echo "CHECK 1: Logo Source Domain"
echo "----------------------------"
WRONG_LOGO=$(grep -r "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)
CORRECT_LOGO=$(grep -r "contraco\.co\.kr/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)

if [ "$WRONG_LOGO" -eq 0 ] && [ "$CORRECT_LOGO" -ge 15 ]; then
    echo "✅ PASS: All logos load from contraco.co.kr ($CORRECT_LOGO files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $WRONG_LOGO files loading from contraco.net (should be 0)"
    echo "❌ FAIL: Found $CORRECT_LOGO files loading from contraco.co.kr (should be 15+)"
    ((FAIL++))
    grep -l "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | head -5
fi
echo ""

# Check 2: Logo Size (should be 58px)
echo "CHECK 2: Logo Size"
echo "------------------"
LOGO_58=$(grep -h "\.logo img" *.html 2>/dev/null | grep -c "height: 58px")

if [ "$LOGO_58" -ge 15 ]; then
    echo "✅ PASS: Logo height is 58px in $LOGO_58 files"
    ((PASS++))
else
    echo "❌ FAIL: Only $LOGO_58 files have 58px logo (should be 15+)"
    ((FAIL++))
fi
echo ""

# Check 3: Language Switcher Styling (active should use var(--warm-white), not var(--primary-red))
echo "CHECK 3: Language Switcher Styling"
echo "-----------------------------------"
WRONG_STYLE=$(grep -A3 "\.lang-link\.active" *.html 2>/dev/null | grep "background-color: var(--primary-red)" | wc -l)
CORRECT_STYLE=$(grep -A3 "\.lang-link\.active" *.html 2>/dev/null | grep "background-color: var(--warm-white)" | wc -l)

if [ "$WRONG_STYLE" -eq 0 ] && [ "$CORRECT_STYLE" -ge 15 ]; then
    echo "✅ PASS: Language switcher uses correct styling ($CORRECT_STYLE files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $WRONG_STYLE files with wrong styling (should be 0)"
    echo "❌ FAIL: Found $CORRECT_STYLE files with correct styling (should be 15+)"
    ((FAIL++))
    grep -l "background-color: var(--primary-red)" *.html 2>/dev/null | grep -A3 "lang-link.active" | head -5
fi
echo ""

# Check 4: Google Analytics ID (should be G-868WGCC45D, not G-JC5PMW72PK)
echo "CHECK 4: Google Analytics ID"
echo "----------------------------"
WRONG_GA=$(grep -l "G-JC5PMW72PK" *.html 2>/dev/null | wc -l)
CORRECT_GA=$(grep -l "G-868WGCC45D" *.html 2>/dev/null | wc -l)

if [ "$WRONG_GA" -eq 0 ] && [ "$CORRECT_GA" -ge 15 ]; then
    echo "✅ PASS: Correct GA ID (G-868WGCC45D) in $CORRECT_GA files"
    ((PASS++))
else
    echo "❌ FAIL: Found wrong GA ID in $WRONG_GA files:"
    ((FAIL++))
    grep -l "G-JC5PMW72PK" *.html 2>/dev/null
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

# Check 6: Broken Links (wrong prefix "contraco-organizational-design-ai.html")
echo "CHECK 6: Broken Links"
echo "---------------------"
BROKEN_LINKS=$(grep -r "contraco-organizational-design-ai" *.html 2>/dev/null | wc -l)

if [ "$BROKEN_LINKS" -eq 0 ]; then
    echo "✅ PASS: No broken links with wrong prefix (0 instances)"
    ((PASS++))
else
    echo "❌ FAIL: Found $BROKEN_LINKS instances of broken links (wrong prefix)"
    ((FAIL++))
    grep -n "contraco-organizational-design-ai" organizational-design-ai.html 2>/dev/null | head -5
fi
echo ""

# Check 7: Thank You Page Consistency
echo "CHECK 7: Thank You Page"
echo "-----------------------"
if [ -f "thank-you.html" ]; then
    REDIRECT_MATCH=$(grep -c "thank-you.html" index.html 2>/dev/null)
    if [ "$REDIRECT_MATCH" -gt 0 ]; then
        echo "✅ PASS: thank-you.html exists and redirect matches"
        ((PASS++))
    else
        echo "⚠️  WARNING: thank-you.html exists but redirect might point to thankyou.html"
        ((PASS++))
    fi
elif [ -f "thankyou.html" ]; then
    REDIRECT_MATCH=$(grep -c "thankyou.html" index.html 2>/dev/null)
    if [ "$REDIRECT_MATCH" -gt 0 ]; then
        echo "✅ PASS: thankyou.html exists and redirect matches"
        ((PASS++))
    else
        echo "❌ FAIL: thankyou.html exists but redirect points to thank-you.html"
        ((FAIL++))
    fi
else
    echo "❌ FAIL: Neither thank-you.html nor thankyou.html found"
    ((FAIL++))
fi
echo ""

# Final Summary
echo "==============================="
echo "VERIFICATION SUMMARY"
echo "==============================="
echo "Checks Passed: $PASS / 7"
echo "Checks Failed: $FAIL / 7"
echo ""

if [ "$FAIL" -eq 0 ]; then
    echo "🎉 100% COMPLIANCE ACHIEVED!"
    echo "All fixes have been successfully deployed."
    exit 0
else
    COMPLIANCE=$((PASS * 100 / 7))
    echo "⚠️  $COMPLIANCE% COMPLIANCE"
    echo "Please review failed checks above and apply fixes."
    exit 1
fi
