# Pitfall Logger - Main Index

This index provides high-level access to all pitfall records by category and severity.

## By Category

- [Frontend](logs/by-category/frontend.md) - UI components, frameworks, styling, browsers
- [Backend](logs/by-category/backend.md) - APIs, server logic, middleware, authentication
- [Database](logs/by-category/database.md) - Queries, migrations, connections, ORMs
- [DevOps](logs/by-category/devops.md) - Deployment, CI/CD, Docker, Kubernetes, monitoring
- [Tooling](logs/by-category/tooling.md) - Build tools, package managers, IDEs, git workflows
- [Other](logs/by-category/other.md) - Project management, documentation, processes

## By Pattern

- [External Dependency](logs/by-pattern/external-dependency.md) - External API/platform dependency instability
- [Environment Difference](logs/by-pattern/environment-diff.md) - Development vs production environment gaps
- [Over-Engineering](logs/by-pattern/over-engineering.md) - Over-complexity when simpler solutions suffice
- [Platform Constraints](logs/by-pattern/platform-constraints.md) - Insufficient awareness of platform limitations
- [Data Architecture](logs/by-pattern/data-architecture.md) - Data storage design issues
- [User Perspective](logs/by-pattern/user-perspective.md) - Missing user-centered design thinking

## By Severity

### Critical (production-blocking issues)
- **[pit-20260309-001](logs/2026/2026-03.md#pit-20260309-001):** 文件整理误用 rm -rf 导致数据丢失 (tooling)

### High (significant impact)
- **[pit-20260116-001](logs/2026/2026-01.md#pit-20260116-001):** 小程序方向选择 - 从"我喜欢什么"到"别人需要什么" (frontend)
- **[pit-20260117-001](logs/2026/2026-01.md#pit-20260117-001):** 小程序备案 - 地区怎么填？隐私问题 (devops)
- **[pit-20260117-003](logs/2026/2026-01.md#pit-20260117-003):** 方向调整 - 及时止损比坚持更重要 (frontend)
- **[pit-20260118-001](logs/2026/2026-01.md#pit-20260118-001):** 备案被驳回 - 身份证照片/人脸认证/小程序备注问题 (devops)
- **[pit-20260125-001](logs/2026/2026-01.md#pit-20260125-001):** 云开发部署配置 - 云函数和存储权限 (devops)
- **[pit-20260224-002](logs/2026/2026-02.md#pit-20260224-002):** 违反单一数据源原则 - 索引包含完整数据 (other)
- **[pit-20260224-003](logs/2026/2026-02.md#pit-20260224-003):** 数据丢失风险 - 主文件为空但索引有内容 (devops)
- **[pit-20260224-012](logs/2026/2026-02.md#pit-20260224-012):** 本地存储限制 - 数据无法迁移 (devops)
- **[pit-20260224-017](logs/2026/2026-02.md#pit-20260224-017):** 代码质量问题 - 递归栈溢出、内存泄漏、缺少错误处理 (backend)
- **[pit-20260224-018](logs/2026/2026-02.md#pit-20260224-018):** 教育类产品设计 - 不能只靠随机题目，教材体系是大坑 (other)

### Medium (notable issues)
- **[pit-20260118-002](logs/2026/2026-01.md#pit-20260118-002):** 微信开发者工具疯狂弹窗 - 旧的配置数据导致 (devops)
- **[pit-20260119-001](logs/2026/2026-01.md#pit-20260119-001):** setData 异步问题 - 统计数据不准确 (frontend)
- **[pit-20260120-001](logs/2026/2026-01.md#pit-20260120-001):** 文件同步问题 - 软链接不稳定，改错了文件夹 (devops)
- **[pit-20260120-002](logs/2026/2026-01.md#pit-20260120-002):** 上传代码按钮灰色 - 测试号不能上传 (devops)
- **[pit-20260120-003](logs/2026/2026-01.md#pit-20260120-003):** Fraction 类导出问题 - 除法题目无法答题 (backend)
- **[pit-20260127-001](logs/2026/2026-01.md#pit-20260127-001):** 分享功能总被关掉 - 页面JSON开关和JS回调缺一不可 (frontend)
- **[pit-20260224-001](logs/2026/2026-02.md#pit-20260224-001):** Bash 脚本 heredoc 语法陷阱 - 变量替换和引号冲突 (tooling)
- **[pit-20260224-005](logs/2026/2026-02.md#pit-20260224-005):** 搜索文档遗漏 - WeChatProjects 有大量记录未索引 (other)
- **[pit-20260224-006](logs/2026/2026-02.md#pit-20260224-006):** MCP vs Skill 选择困境 - 过度复杂化工具选型 (other)
- **[pit-20260224-007](logs/2026/2026-02.md#pit-20260224-007):** Skill数据不完整 - 缺少原始数据支撑 (other)
- **[pit-20260224-010](logs/2026/2026-02.md#pit-20260224-010):** 素材加工缺少原创性 - 直接翻译导致同质化 (other)
- **[pit-20260224-011](logs/2026/2026-02.md#pit-20260224-011):** 小红书内容缺少策略 - 忽略大纲导致效果差 (other)
- **[pit-20260224-013](logs/2026/2026-02.md#pit-20260224-013):** 微信头像昵称获取规则变更 - 自动获取失效 (frontend)
- **[pit-20260224-014](logs/2026/2026-02.md#pit-20260224-014):** 分享卡片体积限制 - 2MB 超限报错 (frontend)

### Low (minor issues)
- **[pit-20260117-002](logs/2026/2026-01.md#pit-20260117-002):** 小程序命名 - 想名字比写代码还难 (frontend)
- **[pit-20260121-001](logs/2026/2026-01.md#pit-20260121-001):** 图标路径配置问题 - 底部导航栏图标找不到 (frontend)
- **[pit-20260122-001](logs/2026/2026-01.md#pit-20260122-001):** 题目序号显示问题 - 点号像小数点 (frontend)
- **[pit-20260224-004](logs/2026/2026-02.md#pit-20260224-004):** 过度设计版本快照功能 - Git 已足够 (other)
- **[pit-20260224-008](logs/2026/2026-02.md#pit-20260224-008):** 工具收集癖 - 下载但不使用 (other)
- **[pit-20260224-009](logs/2026/2026-02.md#pit-20260224-009):** 公众号封面图自动生成失败 - 必须使用封面库 (other)
- **[pit-20260224-015](logs/2026/2026-02.md#pit-20260224-015):** SVG 真机兼容性 - 某些真机不显示 (frontend)
- **[pit-20260224-016](logs/2026/2026-02.md#pit-20260224-016):** 音效本地化策略 - 云端加载体验差 (frontend)
- **[pit-20260305-001](logs/2026/2026-03.md#pit-20260305-001):** OpenClaw 飞书插件重复 ID 警告 (tooling)
- **[pit-20260305-002](logs/2026/2026-03.md#pit-20260305-002):** 飞书机器人不能直接私聊 (other)
- **[pit-20260305-003](logs/2026/2026-03.md#pit-20260305-003):** OpenClaw 常用命令速查 (tooling)
- **[pit-20260305-004](logs/2026/2026-03.md#pit-20260305-004):** 群聊策略配置建议 (other)

---
*Last updated: 2026-03-09*
*Total records: 37*
