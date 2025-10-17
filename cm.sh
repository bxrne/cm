#!/bin/sh

# Fancy Conventional Commit Helper
# Requires gum (installs automatically on Arch if missing).

set -e

# --- Ensure gum is installed ---
if ! command -v gum >/dev/null 2>&1; then
  echo "❌ Gum not found. Install: https://github.com/charmbracelet/gum"
  exit 1
fi


# --- Choose type ---
TYPE=$(gum choose \
    "feat" \
    "fix" \
    "docs" \
    "style" \
    "refactor" \
    "test" \
    "chore" \
    "revert")

TYPE=$(echo "$TYPE" | awk '{print $1}') # strip emoji for the actual commit type

# --- Scope ---
SCOPE=$(gum input --placeholder "server")
test -n "$SCOPE" && SCOPE="($SCOPE)"

# --- Summary ---
SUMMARY=$(gum input \
    --value "$TYPE$SCOPE: " \
    --placeholder "Added prometheus recorder as route middleware")

# --- Description ---
DESCRIPTION=$(gum write --placeholder "Tracking latency and req/res bytes")

# --- Confirm ---
section() {
    gum style --border normal --margin "1 2" --padding "1 3" \
        --border-foreground 212 "$1"
}

printf "\n"
section "Review Commit"
echo "Sum:     $SUMMARY"
echo "Desc: $DESCRIPTION"
gum confirm "Commit?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

printf "\n"
section "Push Commit"
gum confirm "Push to remote?" && git push 
