---
name: daily-notes-template
description: Personal daily notes with business insight reports and todo sync to Feishu Base. A template skill for daily note management with configurable paths and Feishu integration.

dependencies:
  - lark-base  # Feishu Base operations for todo management
---

# Daily Notes Template Skill v2.0

A template skill for personal daily notes management with business insight reports and Feishu Base todo sync. **Configure the paths and Feishu settings before use.**

## Configuration

Create a `config.yml` file in this skill directory with your settings:

```yaml
# Daily Notes Configuration
daily_notes:
  # Directory for daily note files
  output_dir: "~/MyWorkspace/Knowledge/Obsidian/DailyNotes"
  # File name pattern (supports date variables)
  file_pattern: "daily_note_{date}.md"
  # Date format for file names
  date_format: "%Y%m%d"
  # Editor to open daily notes
  editor: "Zed"  # or "code", "vim", etc.

# Feishu Base Configuration
feishu:
  # Your Feishu Base token
  base_token: "YOUR_BASE_TOKEN"
  # Table ID for todos
  table_id: "YOUR_TABLE_ID"
  # Table name (for reference)
  table_name: "待办任务"
  # Full URL to your Base table
  base_url: "https://my.feishu.cn/base/YOUR_BASE_TOKEN?table=YOUR_TABLE_ID"

# Todo Field Mapping
fields:
  title: "标题"      # text, required
  type: "类型"       # select: 待办/任务/行动/里程碑
  status: "状态"     # select: 待处理/进行中/已完成/已搁置
  priority: "优先级" # select: 高/中/低
  category: "分类"   # select: 工作/学习/生活/健康/内容创作/职业发展
  deadline: "截止日期" # datetime, optional
  notes: "备注"      # text, optional
```

## 🌅 Startup Behavior

**Triggered when user says**:
- "我的日报", "日报笔记", "Daily Note"
- "昨天的日报笔记", "昨天笔记", "看看我的日报"
- "生成我的日报", "今天的日报笔记"
- "打开我的日报笔记"
- "放到表格", "同步待办", "提取待办"

**⚠️ Note: Distinguish from "Tech News Daily"**
- User says "技术日报", "资讯日报" → use daily-news-report skill
- User says "日报笔记", "我的日报" → use this skill

**Action**:
```bash
# Open yesterday's daily note with configured editor
open -a "{{EDITOR}}" {{OUTPUT_DIR}}/daily_note_$(date -v-1d +%Y%m%d).md
```

---

## 📅 Daily Workflow

### Evening 22:00 - Generate Daily Report
```
You: 生成今天的日报

Me: [Ask what you did today]
    [Extract new todos]
    [Generate deep business insight report]
    ✅ Generated: {{OUTPUT_DIR}}/daily_note_20260402.md

    💡 Todos extracted to Feishu Base:
    {{BASE_URL}}
```

### User Says "放到表格" - Detailed Flow

**Step 1: Locate Daily Note File**
```bash
# Get today's daily note path
TODAY=$(date +%Y%m%d)
FILE_PATH="{{OUTPUT_DIR}}/daily_note_${TODAY}.md"

# If today's file doesn't exist, try the latest one
if [ ! -f "$FILE_PATH" ]; then
  FILE_PATH=$(ls -t {{OUTPUT_DIR}}/daily_note_*.md | head -1)
fi
```

**Step 2: Parse Todo Tasks**

Identify todos from daily notes by these patterns:
- **待办清单处理** section
- **明天3个行动** section
- **本周新增** / **近期重点** / **历史遗留** sections
- Time keywords: 明天, 本周, 下周, 4.X
- Action keywords: 做, 写, 准备, 搞定, 完成, 联系
- Importance markers: 🔥, 紧急, 重要

**Step 3: Field Mapping Rules**

| Daily Note Pattern | Base Field Value |
|-------------------|-----------------|
| 🔥 / 紧急 / 重要 | 优先级: 高 |
| 明天 / 本周内 | 状态: 待处理 |
| 正在做 / 进行中 | 状态: 进行中 |
| Contains "工作", "本职", "公司" | 分类: 工作 |
| Contains "学", "课程", "训练营" | 分类: 学习 |
| Contains "健康", "医院", "复查" | 分类: 健康 |
| Contains "发帖", "内容", "公众号", "小红书" | 分类: 内容创作 |
| Contains "大会", "AIFUT", "职业" | 分类: 职业发展 |
| 4.X / 明天 / 本周 | Convert to deadline timestamp (ms) |

**Step 4: Write to Feishu Base**

Use `lark-cli base +record-upsert`:
```bash
# Example: write one todo
lark-cli base +record-upsert \
  --base-token "{{BASE_TOKEN}}" \
  --table-id "{{TABLE_ID}}" \
  --json '{
    "标题": "Task name",
    "类型": "待办",
    "状态": "待处理",
    "优先级": "高",
    "分类": "工作",
    "截止日期": 1743484800000,
    "备注": "Detailed description"
  }'
```

**Step 5: Confirm Result**
```
Me: ✅ Extracted X todos to Feishu Base
   - High priority: X
   - Medium priority: X
   - Low priority: X

   📊 View details: {{BASE_URL}}
```

### Todo Management Changes
- ✅ **Feishu Base unified management**: All todos tracked in one table
- ✅ **Daily notes simplified**: No need to list all todos, just "see Feishu Base"
- ✅ **No auto-carryover**: Incomplete todos don't auto-appear in next day's note
- ✅ **Focus on recording**: Daily notes focus on "what was done", "insights", "review"

---

## ⚠️ Error Handling

**Scenario 1: Daily note file doesn't exist**
```
Error: Cannot find today's daily note file
Action: Prompt user to generate daily note first, or specify file path
```

**Scenario 2: No todos detected**
```
Result: No clear todo tasks found in daily note
Action: Ask if user wants to add manually, or check note format
```

**Scenario 3: Base write failed**
```
Error: Feishu Base write failed
Action:
  1. Check if Base Token is valid
  2. Check if Table ID is correct
  3. Check if field values are in correct format
  4. Return todos as text to user
```

---

## 📋 Base Schema

**Feishu Base Todo Table**:

| Field | Type | Required | Options |
|-------|------|----------|---------|
| 标题 | text | ✅ | - |
| 类型 | select | - | 待办/任务/行动/里程碑 |
| 状态 | select | - | 待处理/进行中/已完成/已搁置 |
| 优先级 | select | - | 高/中/低 |
| 分类 | select | - | 工作/学习/生活/健康/内容创作/职业发展 |
| 截止日期 | datetime | - | - |
| 备注 | text | - | - |

---

## 🎯 Daily Note Structure

```markdown
# 📊 YYYY年MM月DD日 周* HH:MM

**今日重点**: [一句话概括]

---

## 💰 今天的时间价值
[工作时长、状态]

## 🎉 今天实际做了什么
[已完成的内容]

## 🔥 今天的洞察
[商业洞察、决策、认知升级]

## 📌 飞书待办
💡 **具体待办任务已提取到飞书表格**
- 🔴 高优先待办：X个
- 🟡 中优先待办：X个
- 🟢 低优先待办：X个

📊 **查看详情**：{{BASE_URL}}
```

---

## ⚡ Status Updates

When user says a task is complete:
1. Confirm it's a task in Feishu Base
2. Prompt user to update status directly in the table
3. Or ask if help is needed to mark complete in the table

---

## 🔄 v2.0 Changes

**Changes**:
- ❌ No longer use `todo_db.json` for todo management
- ✅ Switch to Feishu Base for unified todo management
- ✅ Daily notes focus on recording and review, simplified todo section
- ✅ Support "放到表格" command to auto-extract todos

**Compatibility**:
- v1.0 `todo_db.json` file no longer used
- Historical daily notes remain unchanged
- New workflow starts from v2.0

---

## Output Paths

- Daily notes: `{{OUTPUT_DIR}}/daily_note_YYYYMMDD.md`
- Todos: Feishu Base `{{BASE_URL}}`

## Related Files

- Habit tracker: `{{OUTPUT_DIR}}/habit_tracker.md`
