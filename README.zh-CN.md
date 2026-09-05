# shanshi-coding

[English](README.md)

`shanshi-coding` 面向日常软件开发，覆盖需求对齐、技术方案设计、工程文档、编码实现、技术排障、代码评审与交付。

它帮助模型理解需求、作出合理的工程决策并提高结果可靠性。按任务需要使用相关原则，普通工作不要求独立设计文档或固定步骤。指令不依赖具体模型或工具提供方。

## 何时使用

软件项目中的以下工作适用：

- 为工程任务对齐需求、比较技术方案、整理工程文档。
- 实现功能、重构，修改接口、数据契约、配置、脚本或测试。
- 排查故障、修复缺陷。
- 代码 Review，以及明确要求的版本控制或发布操作。

仅讨论业务或解释现有业务逻辑时不触发，即使需要读取代码。作为工程任务一部分的业务理解仍然适用。一般写作、个人记录及与软件工程无关的工作也不在适用范围内。

加载 skill 不等于授权改代码。技术分析和 Review 保持只读；文档请求只授权相关文档；实施以用户要求和已确认上下文为准。

## 工作原则

- 用项目证据和具体预期行为消除重要歧义；未明确的业务决策由用户决定，低风险细节由模型自主处理。
- 详细设计前明确职责与契约，选择合理、可维护的方案，复用已有能力，并说明新增复杂度的必要性。
- 实施前确定验收标准与代表性场景，预期结果独立于具体实现。
- 连贯修改后按风险验证，证据应覆盖目标环境；复用有效结果，遵循用户指定的测试时机。
- 按业务行为和回归风险补测试；注释说明场景、关键准备数据、预期结果和断言目的，不强制固定模板。
- 根据需求和证据评审，如实交付结果与局限，保护用户改动，提交和发布由用户审阅后明确要求。
- 提交信息先用一句话概括，再用编号说明核心改动及必要原因；条目数按实际内容，遵循仓库提交格式。

## 如何评估效果

读取 skill 只能证明指令被加载，不能证明已有效执行。应检查重要歧义是否消除、方案是否合理复用、验收是否先于实施确定，以及验证是否覆盖预期业务结果。区分误解或缺陷引起的返工与新增需求、正常探索，不单凭加载次数或测试次数评价效果。

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
