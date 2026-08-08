# shanshi-coding

[English](README.md)

`shanshi-coding` 是一个面向 AI 编码代理的 skill，用于当前轮次已经明确授权修改软件行为或工程控制面的任务。

它关注协作纪律、验证诚实和风险控制。这个 skill 刻意保持精简：高能力编码模型通常已经具备通用编程能力，`SKILL.md` 只保留容易在实际编码中被忽略的边界和规则。

提示设计不依赖特定提供方的工具或推理机制，使这个 skill 能够在不同的高能力编码代理之间保持可移植性。

## 何时使用

当前请求已经明确授权实施工程变更时使用，包括：

- 实现功能
- 修复缺陷或重构
- 修改接口或数据契约
- 更新运行、构建或 CI 配置和脚本
- 新增或调整测试并处理相关故障
- 执行明确点名的版本控制操作

文档仅在工程变更确实需要时纳入。只读分析以及独立的内容或元数据维护不触发这个 skill。

## 它会约束什么

- 区分只读工作和已经授权本地修改的请求。
- 将目标明确的“继续实施”或“按既定方案完成”视为当前轮次授权；其他情况不得沿用上一轮授权。
- 实现前先对齐目标、范围、约束和完成标准。
- 编辑前先阅读相关代码。
- 保护用户已有改动，不做无关清理。
- 对范围内的安全本地工作，不重复请求批准。
- 未经授权，不执行破坏性、不可逆、高成本、扩大范围或改变外部系统状态的操作。
- 按任务类型做验证。
- 没有实际运行或检查过，就不能说测试或验证通过。
- Bug 修复要追根因，不只补症状。
- 前端变更在必要时检查真实渲染，并立即检查本次改变的主路径、运行时错误，以及直接受影响的加载、错误或焦点状态。
- 每次修改都要说明改了什么、实际验证了什么、还有什么未验证；默认使用统一标题，用户或仓库要求其他格式时保留同样的信息类别。

## 安装

方式 A：把仓库 clone 到任意位置，然后安装到本机各工具目录：

```bash
git clone https://github.com/hishanshi/shanshi-coding.git
cd shanshi-coding
./publish.sh -n install all
./publish.sh install all
```

默认情况下，`publish.sh` 会跳过已有但不受它管理的 `SKILL.md`。只有在明确需要替换该文件时才使用 `--force`。

方式 B：直接 clone 到某个工具的 skills 目录。

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

如果从直接 clone 的工具目录运行 `publish.sh`，脚本会因为源文件和目标文件相同而跳过该工具，但仍可为其他工具安装。

## 更新

如果通过 `publish.sh` 安装：

```bash
git pull
./publish.sh install all
```

如果直接 clone 到工具目录：

```bash
git -C ~/.agents/skills/shanshi-coding pull
```

如果安装在 Claude Code 或 opencode 目录，请替换成对应路径。

## 卸载

如果通过 `publish.sh` 安装：

```bash
./publish.sh -n uninstall all
./publish.sh uninstall all
```

卸载命令只删除带有本脚本管理标记的 `SKILL.md`。如果是直接 clone 到工具目录，请手动删除那个 clone 目录。

## 文件

- `SKILL.md`：编码代理实际加载的 skill。
- `README.md`：英文使用说明。
- `README.zh-CN.md`：中文使用说明。
- `publish.sh`：安装/卸载到 Claude Code、Codex 和 opencode 的本地脚本。
