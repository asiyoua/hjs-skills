# Daily Notes Template

A template skill for personal daily notes management with business insight reports and Feishu Base todo sync.

## Features

- **Daily Note Generation**: Create structured daily notes with business insights
- **Todo Extraction**: Automatically extract todos from daily notes
- **Feishu Base Sync**: Sync todos to Feishu Base for unified management
- **Customizable**: Configure paths, editor, and field mappings to your needs

## Installation

1. Copy this skill to your Claude Code skills directory:
   ```bash
   cp -r daily-notes-template ~/.claude/skills/
   ```

2. Copy the config example and customize it:
   ```bash
   cd ~/.claude/skills/daily-notes-template
   cp config.example.yml config.yml
   ```

3. Edit `config.yml` with your settings:
   - Set your daily notes output directory
   - Configure your Feishu Base token and table ID
   - Customize field mappings if needed

## Configuration

### Feishu Base Setup

1. Create a Base in Feishu with a todo table
2. Get your Base Token from the URL: `https://my.feishu.cn/base/{BASE_TOKEN}?table={TABLE_ID}`
3. Add these fields to your table:
   - 标题 (text)
   - 类型 (select): 待办/任务/行动/里程碑
   - 状态 (select): 待处理/进行中/已完成/已搁置
   - 优先级 (select): 高/中/低
   - 分类 (select): 工作/学习/生活/健康/内容创作/职业发展
   - 截止日期 (datetime, optional)
   - 备注 (text, optional)

4. Update `config.yml` with your Base Token and Table ID

### Daily Notes Directory

Set your preferred output directory in `config.yml`:
```yaml
daily_notes:
  output_dir: "~/MyWorkspace/Knowledge/Obsidian/DailyNotes"
  editor: "Zed"  # or "code", "vim", etc.
```

## Usage

### Generate Daily Note

Say to Claude Code:
```
生成今天的日报
```

Claude will:
1. Ask what you did today
2. Extract new todos
3. Generate business insight report
4. Save to your configured directory

### Sync Todos to Feishu

Say to Claude Code:
```
放到表格
```

Claude will:
1. Parse todos from your daily note
2. Extract task details (title, priority, category, deadline)
3. Upsert records to your Feishu Base table
4. Report the sync result

## Daily Note Structure

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
```

## Todo Detection

The skill automatically detects todos by these patterns:

- **Sections**: 待办清单处理, 明天3个行动, 本周新增, 近期重点, 历史遗留
- **Time keywords**: 明天, 本周, 下周, 4.X
- **Action keywords**: 做, 写, 准备, 搞定, 完成, 联系
- **Importance markers**: 🔥, 紧急, 重要

## Field Mapping

| Daily Note Pattern | Feishu Field Value |
|-------------------|-------------------|
| 🔥 / 紧急 / 重要 | 优先级: 高 |
| 明天 / 本周内 | 状态: 待处理 |
| 正在做 / 进行中 | 状态: 进行中 |
| Contains "工作" | 分类: 工作 |
| Contains "学" | 分类: 学习 |
| Contains "健康" | 分类: 健康 |
| Contains "发帖" | 分类: 内容创作 |

## Dependencies

- **lark-base**: Required for Feishu Base operations
  - Install: `claude skill install lark-base`

## License

MIT License - Feel free to modify and customize for your needs.
