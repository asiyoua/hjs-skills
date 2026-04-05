# hjs-skills

[English](#english) | [简体中文](#简体中文)

---

## English

My collection of custom skills for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Skills

### dev-pitfall-logger

Record and retrieve development pitfalls, solutions, and lessons learned.

- **Trigger**: User asks to record pitfalls, search previous solutions, or query by category/tech/keywords
- **Features**:
  - Searchable pitfall database with smart keyword matching
  - Categorized records (frontend, backend, database, devops, tooling)
  - Severity tracking (critical, high, medium, low)
  - Automatic proactive logging after solving complex problems
  - Periodic reviews with pattern analysis

### daily-notes-template

A template for personal daily notes management with business insight reports and Feishu Base todo sync.

- **Trigger**: User mentions daily notes, daily reports, or todo sync
- **Features**:
  - Structured daily note generation with business insights
  - Automatic todo extraction from daily notes
  - Feishu Base integration for unified todo management
  - Customizable paths and field mappings
- **Note**: Requires configuration before use (see `daily-notes-template/README.md`)

## Installation

```bash
# Clone this repository
git clone https://github.com/asiyoua/hjs-skills.git ~/.claude/plugins/hjs-skills

# Restart Claude Code
```

## Configuration

### daily-notes-template

This skill requires configuration before use:

```bash
cd ~/.claude/plugins/hjs-skills/skills/daily-notes-template
cp config.example.yml config.yml
# Edit config.yml with your settings
```

See [`daily-notes-template/README.md`](daily-notes-template/README.md) for detailed setup instructions.

### dev-pitfall-logger

No configuration required. Records are stored in:
```
~/.claude/plugins/hjs-skills/skills/dev-pitfall-logger/references/logs/
```

## Usage

Once installed, the skills are automatically available in Claude Code. Use them by speaking naturally:

- "记录这个坑，下次别再踩了"
- "上次那个数据库连接问题是怎么解决的？"
- "生成今天的日报"
- "把待办放到表格里"

## Development

Each skill is self-contained with its own documentation and workflow definitions. See individual skill directories for details.

## License

MIT License - See [LICENSE](LICENSE) for details.

## Inspired By

This collection is inspired by [lijigang/ljg-skills](https://github.com/lijigang/ljg-skills).

---

## 简体中文

我的 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 自定义技能集。

## 技能

### dev-pitfall-logger

开发踩坑记录器 — 记录和检索开发过程中的问题、解决方案和经验教训。

- **触发时机**：用户要求记录坑点、搜索之前的解决方案，或按分类/技术/关键词查询
- **功能**：
  - 可搜索的坑点数据库，支持智能关键词匹配
  - 分类记录（前端、后端、数据库、运维、工具）
  - 严重程度追踪（严重、高、中、低）
  - 解决复杂问题后自动主动记录
  - 定期回顾与模式分析

### daily-notes-template

个人日报模板，支持商业洞察报告生成和飞书 Base 待办同步。

- **触发时机**：用户提到日报、日报笔记或待办同步
- **功能**：
  - 结构化日报生成，包含商业洞察
  - 从日报中自动提取待办任务
  - 飞书 Base 集成，统一管理待办
  - 可自定义路径和字段映射
- **注意**：使用前需要配置（参见 `daily-notes-template/README.md`）

## 安装

```bash
# 克隆此仓库
git clone https://github.com/asiyoua/hjs-skills.git ~/.claude/plugins/hjs-skills

# 重启 Claude Code
```

## 配置

### daily-notes-template

此技能需要先配置：

```bash
cd ~/.claude/plugins/hjs-skills/skills/daily-notes-template
cp config.example.yml config.yml
# 编辑 config.yml 填入你的配置
```

详细设置说明参见 [`daily-notes-template/README.md`](daily-notes-template/README.md)。

### dev-pitfall-logger

无需配置。记录存储在：
```
~/.claude/plugins/hjs-skills/skills/dev-pitfall-logger/references/logs/
```

## 使用

安装后，技能在 Claude Code 中自动可用。自然对话即可使用：

- "记录这个坑，下次别再踩了"
- "上次那个数据库连接问题是怎么解决的？"
- "生成今天的日报"
- "把待办放到表格里"

## 开发

每个技能都是独立的，包含自己的文档和工作流定义。详见各技能目录。

## 许可证

MIT License - 详见 [LICENSE](LICENSE)。

## 灵感来源

本技能集受 [lijigang/ljg-skills](https://github.com/lijigang/ljg-skills) 启发。
