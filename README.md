# hjs-skills

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
git clone https://github.com/YOUR_USERNAME/hjs-skills.git ~/.claude/plugins/hjs-skills

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
