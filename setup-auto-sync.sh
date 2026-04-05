#!/bin/bash
# Setup auto-sync hook for skills
# This creates a post-commit hook that auto-syncs to hjs-skills repo

set -e

SKILLS_DIR="$HOME/.claude/skills"
HOOK_DIR="$SKILLS_DIR/.git/hooks"  # 如果 skills 是 git 仓库
HOOK_FILE="$HOOK_DIR/post-commit"

# 如果 skills 不是 git 仓库，提示用户
if [ ! -d "$SKILLS_DIR/.git" ]; then
    echo "⚠️  ~/.claude/skills is not a git repository"
    echo "Auto-sync hook requires the skills directory to be under git version control."
    echo ""
    echo "Alternative: Use the manual sync script:"
    echo "  ~/.claude/plugins/hjs-skills/sync.sh"
    exit 1
fi

# 创建 hook
cat > "$HOOK_FILE" << 'EOF'
#!/bin/bash
# Auto-sync to hjs-skills after commit

echo "🔄 Syncing to hjs-skills..."

~/.claude/plugins/hjs-skills/sync.sh --auto

EOF

chmod +x "$HOOK_FILE"

echo "✅ Auto-sync hook installed!"
echo "Now every time you commit in ~/.claude/skills, it will auto-sync to hjs-skills."
