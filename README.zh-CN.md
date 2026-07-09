# shanshi-coding

[English](README.md)

`shanshi-coding` 是一个面向 AI 编码代理的 skill，用于用户已经要求或允许修改工程文件的任务。

它关注协作纪律、验证诚实和风险控制。这个 skill 刻意保持精简：高能力编码模型通常已经具备通用编程能力，`SKILL.md` 只保留容易在实际编码中被忽略的边界和规则。

## 何时使用

当任务最终可能修改工程文件时使用，包括：

- 实现功能
- 修改代码、配置、脚本或文档
- 重构
- 调试和修复缺陷
- 新增或调整测试
- 处理测试、CI 或构建失败

如果只是审阅、解释、查询、查路径或方案讨论，且没有授权修改文件，不使用这个 skill。

## 它会约束什么

- 实现前先对齐目标、范围、约束和完成标准。
- 编辑前先阅读相关代码。
- 保护用户已有改动，不做无关清理。
- 小步、可回退地修改。
- 按任务类型做验证。
- 没有实际运行或检查过，就不能说测试或验证通过。
- Bug 修复要追根因，不只补症状。

## 安装

把这个仓库 clone 到对应工具的 skills 目录。

### Codex

```bash
mkdir -p ~/.agents/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.agents/skills/shanshi-coding
```

### Claude Code

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.claude/skills/shanshi-coding
```

### opencode

```bash
mkdir -p ~/.config/opencode/skills
git clone https://github.com/hishanshi/shanshi-coding.git ~/.config/opencode/skills/shanshi-coding
```

## 更新

```bash
git -C ~/.agents/skills/shanshi-coding pull
```

如果安装在 Claude Code 或 opencode 目录，请替换成对应路径。

## 文件

- `SKILL.md`：编码代理实际加载的 skill。
- `README.md`：英文使用说明。
- `README.zh-CN.md`：中文使用说明。
