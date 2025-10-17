#!/bin/bash
# Minimal Conventional Commit Helper
set -e

# Minimal styling that works with any theme
B='\033[1m'    # Bold
D='\033[2m'    # Dim
R='\033[0m'    # Reset

# theme color 

# Compact prompt helper
ask() {
    printf "${B}$1${R} ${D}$2${R} " >&2
    read -r val
    echo "$val"
}

# Type selection - single line
printf "${B}Change:${R} ${D}1:${R}feat ${D}2:${R}fix ${D}3:${R}docs ${D}4:${R}style ${D}5:${R}refactor ${D}6:${R}test ${D}7:${R}chore ${D}8:${R}revert "
TYPE=$(ask ">" "")
case "$TYPE" in
    1|feat) TYPE="feat" ;;
    2|fix) TYPE="fix" ;;
    3|docs) TYPE="docs" ;;
    4|style) TYPE="style" ;;
    5|refactor) TYPE="refactor" ;;
    6|test) TYPE="test" ;;
    7|chore) TYPE="chore" ;;
    8|revert) TYPE="revert" ;;
    *) echo "Invalid type"; exit 1 ;;
esac

# Scope
SCOPE=$(ask "${B}Scope:${R}" "")
[ -n "$SCOPE" ] && SCOPE="($SCOPE)"

# Summary
SUMMARY=$(ask "${B}Summary:${R}" "")
SUMMARY="$TYPE$SCOPE: $SUMMARY"

# Description
DESC=$(ask "${D}Details:${R}" "")

# Confirm and commit
printf "\n${B}Commit?${R} ${D}(y/n)${R} "
read -r confirm
if [[ ! "$confirm" =~ ^[Yy] ]]; then
    echo "Cancelled"
    exit 1
fi

[ -n "$DESC" ] && git commit -m "$SUMMARY" -m "$DESC" || git commit -m "$SUMMARY"
echo "✓ Committed"

# Push
printf "${B}Push?${R} ${D}(y/n)${R} "
read -r push
[[ "$push" =~ ^[Yy] ]] && git push && echo "✓ Pushed"

printf "\n"
