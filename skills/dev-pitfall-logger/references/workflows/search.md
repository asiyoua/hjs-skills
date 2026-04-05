# 搜索记录 - 详细工作流

## 触发条件
用户说以下任一内容时触发：
- "上次/之前/查一下/怎么解决的"
- "遇到过XXX吗"
- "有没有相关记录"
- 提到回忆、查找、搜索相关的意图

---

## 第一步：提取搜索标准

从用户请求中提取：

### 1. 关键词（必须）
- 错误信息中的技术术语
- 问题描述的关键词
- 可能的变体（中英文）

**示例**:
- 用户说："Promise race condition 怎么解决的？"
- 关键词: ["Promise", "race", "condition", "并发", "竞态"]

### 2. 分类（可选）
如果用户提到，提取分类：
- frontend|backend|database|devops|tooling|other

### 3. 时间范围（可选）
- "最近" → 最近30天
- "本月/本周" → 对应时间范围
- 具体日期 → 使用指定范围

---

## 第二步：执行搜索

### 搜索顺序（必须遵守）

**1. 先查分类索引**（如果指定了分类）
```bash
# 搜索文件：references/logs/by-category/{category}.md
# 优势：快速定位，结果少而精
```

**2. 再查项目索引**（如果提到了项目名）
```bash
# 搜索文件：references/logs/by-project/{project}.md
# 优势：同一项目的相关经验
```

**3. 最后全文搜索**（补充查找）
```bash
grep -r "关键词1\|关键词2" references/logs/
```

### 搜索策略

| 场景 | 策略 | 原因 |
|------|------|------|
| 指定分类 | 只查分类索引 | 结果最精准 |
| 提到项目名 | 查项目索引 + 分类索引 | 上下文最相关 |
| 只有关键词 | 先分类索引后全文 | 平衡精度和召回 |

---

## 第三步：结果处理

### 结果数量判断
- **0条**: 提示"未找到相关记录"，询问是否创建新记录
- **1-5条**: 直接展示
- **6+条**: 按相关度排序，展示前5条 + "还有X条"

### 相关度排序标准
1. 关键词匹配数量
2. 严重程度（critical > high > medium > low）
3. 时间（最近的优先）

---

## 第四步：智能摘要输出

**必须使用 ⚡💡📌 格式**：

```
Found 3 relevant pitfall records:

[1] Promise race condition in API handlers (2026-02-15)
    Category: backend | Tech: Node.js, TypeScript | Severity: medium

    ⚡ 问题：并发请求时 Promise.all 导致部分请求失败
   💡 解决：改用 Promise.allSettled() 处理所有结果
   📌 关键：部分失败不应影响整体

    → 查看详情: references/logs/2026/2026-02.md#pit-20260215-001

---

[2] Async/await error handling missing (2026-01-20)
    Category: backend | Tech: Node.js

    ⚡ 问题：未捕获的 async 错误导致进程崩溃
   💡 解决：全局错误处理 + try-catch 包裹
   📌 关键：process.on('unhandledRejection')

    → 查看详情: references/logs/2026/2026-01.md#pit-20260120-003
```

### 摘要编写规则
- ⚡ 问题：1句话，不超过20字
- 💡 解决：1-2句话，说明关键步骤
- 📌 关键：最重要的1个要点，不超过15字

---

## 第五步：后续操作

### 必须提供以下选项

1. **查看详情**: "Do you want me to read the full details of any of these?"
2. **创建新记录**: "Should I create a new record for your current issue?"
3. **继续搜索**: 如果结果不满意，询问是否调整关键词

---

## 特殊情况处理

### 搜索结果为空
```
未找到相关记录。

💡 建议：
1. 尝试其他关键词（技术术语变体、中英文）
2. 查看相关分类的索引
3. 创建新记录，避免未来再遇到

要创建新记录吗？
```

### 找到大量相关记录
```
找到 15 条相关记录，按相关性展示前 5 条：

[展示前5条]

...还有 10 条记录
💡 要查看更多或按特定条件筛选吗？
```
