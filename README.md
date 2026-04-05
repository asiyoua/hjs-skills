# hjs-skills

[English](#english) | [简体中文](#简体中文)

---

## English

My [Claude Code](https://docs.anthropic.com/en/docs/claude-code) custom skill collection.

## Skills

| Skill | Description |
|-------|-------------|
| **dev-pitfall-logger** | Development pitfall recorder — Record and retrieve development pitfalls, solutions, and lessons learned. Features searchable database with smart keyword matching, categorized records (frontend/backend/database/devops/tooling), severity tracking, automatic proactive logging after solving complex problems, and periodic reviews with pattern analysis. |
| **daily-notes-template** | Daily notes template — Personal daily notes management with business insight reports and Feishu Base todo sync. Generates structured daily notes with business insights, automatically extracts todos to Feishu Base for unified management. Requires configuration before use. |

## Workflows

| Workflow | Skill Chain | Description |
|----------|-------------|-------------|
| (coming soon) | — | — |

## Installation

```bash
git clone https://github.com/asiyoua/hjs-skills.git ~/.claude/plugins/hjs-skills
```

Then restart Claude Code.

### daily-notes-template Dependencies

The `daily-notes-template` skill requires Feishu Base configuration:

```bash
cd ~/.claude/plugins/hjs-skills/skills/daily-notes-template
cp config.example.yml config.yml
# Edit config.yml with your settings
```

See `daily-notes-template/README.md` for detailed setup instructions.

## About

Open source skills for Claude Code.

---

## 简体中文

我的 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 自定义技能集。

## 技能

| 技能 | 说明 |
|------|------|
| **dev-pitfall-logger** | 开发踩坑记录器 — 记录和检索开发过程中的问题、解决方案和经验教训。支持可搜索的坑点数据库与智能关键词匹配，分类记录（前端/后端/数据库/运维/工具），严重程度追踪，解决复杂问题后自动主动记录，以及定期回顾与模式分析。 |
| **daily-notes-template** | 日报模板 — 个人日报管理，支持商业洞察报告生成和飞书 Base 待办同步。生成结构化日报并自动提取待办到飞书 Base 统一管理。使用前需配置。 |

## 工作流

| 工作流 | 技能链 | 说明 |
|--------|--------|------|
| (即将推出) | — | — |

## 安装

```bash
git clone https://github.com/asiyoua/hjs-skills.git ~/.claude/plugins/hjs-skills
```

然后重启 Claude Code。

### daily-notes-template 依赖

`daily-notes-template` 技能需要配置飞书 Base：

```bash
cd ~/.claude/plugins/hjs-skills/skills/daily-notes-template
cp config.example.yml config.yml
# 编辑 config.yml 填入你的配置
```

详细设置说明见 `daily-notes-template/README.md`。

## 关于

Claude Code 开源技能集。
