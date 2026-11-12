# shanshi-coding

用明确的触发条件、执行动作和证据边界约束协作与开发，保留个人偏好，合并重复和空泛要求。

## 规则归属

| 文件 | 职责 |
| --- | --- |
| [common/AGENTS.md](common/AGENTS.md) | 目标与上下文承接、核验交付、授权和版本管理。 |
| [SKILL.md](SKILL.md) | 开发中的契约、变更影响、实现、迁移和验证要求。 |
| 项目自身的 `AGENTS.md` | 项目业务约束、命令、验证基线、环境和工程规范。 |

两份通用规则各维护一处，成组发布到 agent 的用户级配置；`common/AGENTS.md` 是发布源，不是本仓库专属指令。项目文件维护具体约定，不复制通用正文；影响行为与验收的冲突须核实依据。

## 使用与评估

说明任务目标、必要上下文和交付要求，例如“读代码解释退款规则，先别修改”或“修复重复创建工单的问题”。skill 的适用范围见 [SKILL.md](SKILL.md)，按当前任务及影响选择相关条款，不要求每次展开完整开发流程。

规则是否保留，取决于能否明确执行条件、动作、证据或行为边界，而不取决于模型是否自称默认会做。用原始任务、实际变更和检查结果评估，例如：

- 局部取消日期限制后，是否仍保留其他已确认筛选条件。
- 修改共享逻辑后，是否核对实际调用方及必要保留行为。
- 修改配置或初始化后，是否验证真实注册、加载和启动路径。
- 依赖变化后，是否验证消费者实际解析的版本与产物，而非仅验证联编。
- 修复时，测试预期是否仍依据需求；替身成功是否被误报为真实集成成功。
- 授权推送时，目标分支和全部新增提交是否均在授权范围内。

已报告的使用问题优先检查，但不把笼统反馈当作某条规则的具体失败记录。格式校验、文本复核和模型自评均不证明执行效果；必要时用代表性任务验证行为，再据结果调整。

复盘时区分规则含糊、执行遗漏、项目约定缺失和需求变化。有明确约束作用的通用规则可以保留；对重复违反的问题，检查触发位置、规则冲突和验证方式，不只追加更长的要求。评估不以规则条数、篇幅或测试数量为目标。

## 安装与更新

需要 Bash 与 Python 3.8 及以上版本，无第三方依赖。克隆后先预览再安装：

```bash
git clone https://github.com/hishanshi/shanshi-coding.git
cd shanshi-coding
./publish.sh -n install
./publish.sh install
./publish.sh status
```

更新时先 `git pull`（本地维护则直接修改源文件），再执行预览与安装。不要直接修改已发布内容，也不要只复制 `SKILL.md`。

默认检测本机 `PATH` 中的 `codex`、`claude`、`opencode`；macOS 另检查 `/Applications` 与 `~/Applications` 下可运行的 Codex、OpenCode。已有配置目录和 Claude 桌面聊天应用不算安装证据，不检查项目配置。`install all`、`install auto` 与默认检测相同；可显式指定工具：

```bash
./publish.sh -n install codex claude
./publish.sh install codex claude
```

### 加载位置

| Agent | 公共规则 | coding skill |
| --- | --- | --- |
| Codex | `~/.codex/AGENTS.md` | `~/.agents/skills/shanshi-coding/SKILL.md` |
| Claude Code | `~/.claude/CLAUDE.md` | `~/.claude/skills/shanshi-coding/SKILL.md` |
| OpenCode | `~/.config/opencode/AGENTS.md` | `~/.config/opencode/skills/shanshi-coding/SKILL.md` |

遵循 `CODEX_HOME`、`CLAUDE_CONFIG_DIR`、`XDG_CONFIG_HOME` 与 `OPENCODE_CONFIG_DIR`，实际目标以预览为准。Codex 有非空 `AGENTS.override.md` 时使用它，并迁移普通文件中的原受管理区块，避免规则被遮蔽。

路径依据：[Codex 指令](https://learn.chatgpt.com/docs/agent-configuration/agents-md)与[技能](https://learn.chatgpt.com/docs/build-skills)、[Claude Code 指令](https://code.claude.com/docs/en/memory)与[技能](https://code.claude.com/docs/en/skills)、[OpenCode 指令](https://opencode.ai/v2/docs/instructions)与[技能](https://opencode.ai/docs/skills/)。各工具使用原生入口；安装后建议新开会话，磁盘更新不会替换已有会话上下文。

### 发布保护

- 公共文件只更新受管理区块，保留其他内容；标记损坏或重复时停止，`--force` 也不覆盖。非受管理 skill 默认整组跳过并报失败，显式 `--force` 才可替换。
- 每个工具先检查两个目标，再暂存、写入并核对；失败时恢复该工具本轮改动，其他工具继续。异常中止后运行 `status`，恢复失败会报告备份位置。
- 两份文件的版本（Git 版本加内容摘要）与实际内容均一致才成功；保护源文件和文件符号链接，兼容旧版 skill 管理标记。
- 仓库直接位于工具的 skills 目录时，仍需 `install <工具名>` 补齐公共规则；同源 skill 不加尾注，卸载保留源仓库。

`status` 列出检测依据、目标路径与状态，可指定 `status codex`；安装不一致不改变其退出码，`install` 遇到冲突或写入、核对失败则返回非零。

## 卸载

```bash
./publish.sh -n uninstall
./publish.sh uninstall
```

按受管理内容选择目标，agent 已移除也可清理；可指定 `uninstall codex`。只移除受管理内容，公共文件清空后删除，保留其他配置；非受管理 skill 须显式 `--force` 才移除，源文件始终保留。

## 脚本验证

```bash
bash -n publish.sh
python3 -B -m unittest discover -s tests -v
```

入口为 `publish.sh`，实现在 `scripts/publish.py`，回归在 `tests/test_publish.py`。测试使用临时目录，覆盖检测、成组更新、配置保留、内容核对、故障恢复、override 迁移、预览、卸载与源文件保护，不修改本机安装。
