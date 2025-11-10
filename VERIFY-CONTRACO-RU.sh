#!/bin/bash
# CONTRACO.RU DEPLOYMENT VERIFICATION SCRIPT
# Run this in the contraco.ru Claude session to verify all fixes are deployed
# Expected: 100% PASS on all checks

echo "=================================="
echo "CONTRACO.RU VERIFICATION SCRIPT"
echo "=================================="
echo ""

PASS=0
FAIL=0

# Check 1: Logo Sources (ALL files should use contraco.ru, not contraco.net)
echo "CHECK 1: Logo Source Domain"
echo "----------------------------"
WRONG_LOGO=$(grep -r "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)
CORRECT_LOGO=$(grep -r "contraco\.ru/Logo_rectangle\.svg" *.html 2>/dev/null | wc -l)

if [ "$WRONG_LOGO" -eq 0 ] && [ "$CORRECT_LOGO" -ge 14 ]; then
    echo "✅ PASS: All logos load from contraco.ru ($CORRECT_LOGO files)"
    ((PASS++))
else
    echo "❌ FAIL: Found $WRONG_LOGO files loading from contraco.net (should be 0)"
    echo "❌ FAIL: Found $CORRECT_LOGO files loading from contraco.ru (should be 14+)"
    ((FAIL++))
    grep -l "contraco\.net/Logo_rectangle\.svg" *.html 2>/dev/null | head -5
fi
echo ""

# Check 2: Logo Size (should be 58px, not 40px)
echo "CHECK 2: Logo Size"
echo "------------------"
LOGO_58=$(grep -h "\.logo img" *.html 2>/dev/null | grep -c "height: 58px")
LOGO_40=$(grep -h "\.logo img" *.html 2>/dev/null | grep -c "height: 40px")

if [ "$LOGO_58" -ge 14 ] && [ "$LOGO_40" -eq 0 ]; then
    echo "✅ PASS: Logo height is 58px in $LOGO_58 files"
    ((PASS++))
else
    echo "❌ FAIL: Found $LOGO_40 files with 40px logo (should be 0)"
    echo "❌ FAIL: Found $LOGO_58 files with 58px logo (should be 14+)"
    ((FAIL++))
    # Show files with wrong size
    grep -l "height: 40px" *.html 2>/dev/null | head -5
fi
echo ""

# Check 3: Trademark Notice (should exist in all footers)
echo "CHECK 3: Trademark Notice"
echo "-------------------------"
TRADEMARK=$(grep -r "Resonance Method.*trademark" *.html 2>/dev/null | wc -l)

if [ "$TRADEMARK" -ge 14 ]; then
    echo "✅ PASS: Trademark notice present in $TRADEMARK files"
    ((PASS++))
else
    echo "❌ FAIL: Trademark notice found in only $TRADEMARK files (should be 14+)"
    ((FAIL++))
    echo "Missing trademark notice in:"
    for f in index.html about.html insights.html; do
        if ! grep -q "Resonance Method.*trademark" "$f" 2>/dev/null; then
            echo "  - $f"
        fi
    done
fi
echo ""

# Check 4: Bullet Styles (should be ▸ not →)
echo "CHECK 4: Bullet Styles"
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

# Check 5: Google Analytics ID (should be G-868WGCC45D)
echo "CHECK 5: Google Analytics ID"
echo "----------------------------"
WRONG_GA=$(grep -l "G-JC5PMW72PK" *.html 2>/dev/null | wc -l)
CORRECT_GA=$(grep -l "G-868WGCC45D" *.html 2>/dev/null | wc -l)

if [ "$WRONG_GA" -eq 0 ] && [ "$CORRECT_GA" -ge 14 ]; then
    echo "✅ PASS: Correct GA ID (G-868WGCC45D) in $CORRECT_GA files"
    ((PASS++))
else
    echo "❌ FAIL: Found wrong GA ID in $WRONG_GA files"
    ((FAIL++))
    grep -l "G-JC5PMW72PK" *.html 2>/dev/null
fi
echo ""

# Final Summary
echo "==============================="
echo "VERIFICATION SUMMARY"
echo "==============================="
echo "Checks Passed: $PASS / 5"
echo "Checks Failed: $FAIL / 5"
echo ""

if [ "$FAIL" -eq 0 ]; then
    echo "🎉 100% COMPLIANCE ACHIEVED!"
    echo "All fixes have been successfully deployed."
    exit 0
else
    COMPLIANCE=$((PASS * 100 / 5))
    echo "⚠️  $COMPLIANCE% COMPLIANCE"
    echo "Please review failed checks above and apply fixes."
    exit 1
fi
