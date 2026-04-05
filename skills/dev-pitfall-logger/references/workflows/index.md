# 索引维护 - 详细工作流

## 核心原则

**索引只包含链接，不包含数据。所有数据存储在按时间组织的月文件中。**

---

## 何时更新索引

### 自动触发（必须执行）
- ✅ 创建新记录后
- ✅ 更新现有记录后

### 手动触发（按需执行）
- 用户请求"重新生成索引"
- 发现索引损坏或不一致

---

## 索引文件结构

```
references/
├── index.md                          # 主索引（仅high/critical）
└── logs/
    ├── by-category/                   # 分类索引
    │   ├── frontend.md
    │   ├── backend.md
    │   ├── database.md
    │   ├── devops.md
    │   ├── tooling.md
    │   └── other.md
    └── by-project/                    # 项目索引
        ├── miniprogram.md
        ├── caie.md
        └── ...
```

---

## 索引格式规范

### 分类索引格式

```markdown
# {Category} Pitfalls

## 2026-02
- **[pit-20260224-001](../../2026/2026-02.md#pit-20260224-001):** [简短标题]
  - Severity: {severity}

- **[pit-20260215-003](../../2026/2026-02.md#pit-20260215-003):** [简短标题]
  - Severity: {severity}

## 2026-01
- **[pit-20260120-002](../../2026/2026-01.md#pit-20260120-002):** [简短标题]
  - Severity: {severity}
```

### 项目索引格式

```markdown
# {Project} Pitfalls

## 2026-02
- **[pit-20260224-001](../../2026/2026-02.md#pit-20260224-001):** [简短标题]
  - Date: 2026-02-24 | Severity: {severity}

- **[pit-20260215-002](../../2026/2026-02.md#pit-20260215-002):** [简短标题]
  - Date: 2026-02-15 | Severity: {severity}
```

### 主索引格式（仅high/critical）

```markdown
# Pitfall Logger - Main Index

## Critical Issues
*No entries*

## High Severity

### 2026-02
- **[pit-20260217-003](logs/2026/2026-02.md#pit-20260217-003):** 备案被驳回
  - Category: devops | Project: miniprogram

## Medium Severity
(链接到分类索引)
```

---

## 索引更新步骤

### 步骤1：定位主记录

从创建/更新的记录中获取：
- ID: pit-YYYYMMDD-NNN
- 日期: YYYY-MM-DD
- 分类: category
- 项目: project（从上下文提取）
- 严重程度: severity

### 步骤2：更新分类索引

**文件**: `references/logs/by-category/{category}.md`

**操作**:
1. 检查是否已有 YYYY-MM 月度分组
2. 如果没有，创建月度分组
3. 在月度分组内添加记录链接

**添加格式**:
```markdown
- **[pit-YYYYMMDD-NNN](../../YYYY/YYYY-MM.md#pit-YYYYMMDD-NNN):** [标题]
  - Severity: {severity}
```

### 步骤3：更新项目索引

**文件**: `references/logs/by-project/{project}.md`

**操作**: 同分类索引

### 步骤4：更新主索引（如果需要）

**条件**: severity = high OR critical

**文件**: `references/index.md`

**操作**: 添加到对应严重程度分组

---

## 索引一致性检查

### 检查规则

**创建新记录时**:
1. ✅ 分类索引包含链接 → 通过
2. ❌ 分类索引包含完整内容 → 违反单一数据源原则
3. ✅ 项目索引包含链接 → 通过
4. ❌ 项目索引不包含 → 缺失索引

**修复方法**:
- 如果发现索引包含完整内容 → 删除内容，只保留链接
- 如果发现索引缺失 → 补充链接

---

## 批量重建索引

### 触发条件

- 用户请求"重新生成索引"
- 发现索引大面积损坏
- 更新了索引格式

### 重建步骤

1. **读取所有月文件**
   ```bash
   find references/logs -name "*.md" -path "*/2026/*" | grep -E "2026-[0-9]{2}.md"
   ```

2. **解析每条记录**
   - 提取 ID、分类、项目、严重程度
   - 提取简短标题（从记录标题的第一行）

3. **按分类分组**
   - 创建/更新 `by-category/{category}.md`
   - 按时间倒序排列

4. **按项目分组**
   - 创建/更新 `by-project/{project}.md`
   - 按时间倒序排列

5. **生成主索引**
   - 只包含 high/critical 记录
   - 按严重程度和时间倒序

6. **验证结果**
   - 检查所有索引只包含链接
   - 检查链接数量与记录数量一致

---

## 索引维护最佳实践

### 性能优化

- **增量更新**: 创建记录时只更新相关索引，不重建全部
- **延迟重建**: 批量操作时收集变更，最后一次性重建索引

### 数据完整性

- **链接验证**: 定期检查索引链接是否有效
- **格式一致**: 确保所有索引使用相同格式

### 版本控制

- 索引文件加入版本控制
- 重建索引前创建备份
