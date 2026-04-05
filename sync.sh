#!/bin/bash
# Sync skills from ~/.claude/skills/ to hjs-skills repository
# ⚠️  WARNING: Only sync skills that don't need sanitization!
#    Skills with personal data (paths, tokens, etc.) should be manually reviewed.

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Paths
SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$HOME/.claude/plugins/hjs-skills"

# Skills that are SAFE to auto-sync (no personal data)
# These skills use relative paths and have no hardcoded sensitive info
SAFE_SKILLS="dev-pitfall-logger"

# Skills that NEED MANUAL REVIEW before syncing
# These contain personal paths, tokens, or user-specific data
# insight-daily-notes → daily-notes-template (needs sanitization!)

echo -e "${BLUE}=== hjs-skills Sync Script ===${NC}"
echo ""
echo -e "${YELLOW}⚠️  This script only syncs safe skills.${NC}"
echo -e "${YELLOW}   Skills needing sanitization must be manually updated.${NC}"
echo ""
echo "Safe to auto-sync:"
echo "  ✅ dev-pitfall-logger"
echo ""
echo "Requires manual review:"
echo "  ⚠️  insight-daily-notes → daily-notes-template"
echo "     (contains: personal paths, Feishu tokens, user-specific config)"
echo ""

cd "$REPO_DIR"

# Only sync safe skills
for skill in $SAFE_SKILLS; do
    if [ -d "$SKILLS_DIR/$skill" ]; then
        echo -e "${GREEN}Syncing: $skill${NC}"
        rsync -av --delete \
            "$SKILLS_DIR/$skill/" \
            "$REPO_DIR/skills/$skill/" \
            --exclude='.DS_Store' \
            --exclude='*.log' \
            --exclude='references/logs/' \
            2>/dev/null || true
    fi
done

# Check for changes
if git diff --quiet; then
    echo -e "${BLUE}No changes detected. Nothing to commit.${NC}"
    exit 0
fi

# Show what changed
echo -e "${BLUE}=== Changes detected ===${NC}"
git status --short

# Ask for commit message
echo ""
read -p "Enter commit message (or press Enter for auto-generated): " msg

if [ -z "$msg" ]; then
    msg="chore: sync safe skills $(date +%Y-%m-%d)"
fi

# Commit and push
git add .
git commit -m "$msg"
git push

echo -e "${GREEN}✅ Synced and pushed to GitHub!${NC}"
echo ""
echo -e "${YELLOW}📌 Reminder: daily-notes-template needs manual updates!${NC}"
