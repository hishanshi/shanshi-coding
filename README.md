# shanshi-coding

让模型理解目标、承接约定，在授权内自主推进，权衡收益与代价，用证据交付。

## 规则归属

| 文件 | 职责 |
| --- | --- |
| [common/AGENTS.md](common/AGENTS.md) | 各类任务的协作、[上下文承接](common/AGENTS.md#上下文承接)、核验、授权与收尾。 |
| [SKILL.md](SKILL.md) | 软件开发的分析、设计、实现、[验证](SKILL.md#验证要求)与[交付核对](SKILL.md#交付核对)。 |
| 项目自身的 `AGENTS.md` | 项目结构、业务约束、命令、回归基线、环境与代码规范，以及现有工具用法和校验职责。 |

两份通用规则各维护一处，成组发布到 agent 的用户级配置；`common/AGENTS.md` 是发布源，不是本仓库专属指令。项目指令补充本地约定，不复制通用正文。

## 使用与评估

说明目标、必要上下文和交付要求，例如：“读代码解释退款规则，先别修改”“偶发重复创建工单，帮我分析并修复”；目标未明时可先探索，按[目标与执行](common/AGENTS.md#目标与执行)形成共同理解再推进。

skill 按当前任务选择并应用相关条款，不固定绑定整个会话。代码分析、SQL 和构建排障适用，混合任务仅用于开发部分；一般资料研究、软件推荐和非开发任务不适用。使用 skill 不意味着展开完整开发流程。

用真实任务的原始要求对照最终产物，观察模型是否：

- 正确选择并适度应用 skill；先查依据，仅分析时不自行修改，必要澄清等待答复，独立工作继续推进。
- 局部纠正和实现方式调整保留其他已确认行为、范围与验收预期，不随实现改写测试标准。
- 沿用原有流程与职责，防御有具体依据，抽象降低理解成本，同一业务规则由负责层统一保证；交付前主动清理多余实现，保留必要处理。
- 验证实际使用入口、核心业务、迁移及跨服务的最终结果，依赖变化核对消费者实际版本与产物；完成必要回归，说明未验证项、整体剩余范围并清理资源。
- 提交内容与验证证据一致，按差异补验；推送前核对远端、分支和全部待推送提交均在授权范围内。
- 遵守[前端约定](SKILL.md#前端约定)中的模型与人工分工，以及新增测试、浏览器验证的授权边界。

例如，约定“按事件 ID 去重，重复成功通知返回已有工单”，就核对首次创建、同 ID 返回同一工单且记录不增加、不同 ID 不误去重；约定支持并发时再验证并发约束。只检查函数调用次数不足以证明结果。

也可复查这些场景：仅要求查字段时不改代码；观察规则改为注解后仍不拦截；取消流水日期限制仍保留单据筛选；简单分流不新增中转层；简化时保留已证实故障所需的异常隔离；配置变化验证真实初始化。

格式校验不证明行为正确。交付后可用原始需求和变更在独立对话中复审，再按风险人工复测；不按提问数、测试数、类数量或篇幅评分。上述场景不代表已完成模型行为测试。

复盘先区分原因，避免每次返工都追加规则：

| 原因 | 处理 |
| --- | --- |
| 通用规则缺失或含糊 | 定向调整公共约定或 skill，合并重复内容。 |
| 规则明确但未遵守 | 作为模型执行问题评估，不自动加长规则。 |
| 项目约定缺失 | 补充项目自身的 `AGENTS.md` 或已有文档。 |
| 用户变更需求或环境变化 | 更新上下文与验证，不直接归为原实现错误。 |

设计参考：[Example Mapping](https://cucumber.io/docs/bdd/example-mapping/)、[按行为测试](https://testing.googleblog.com/2013/08/testing-on-toilet-test-behavior-not.html)、[Definition of Done](https://scrumguides.org/scrum-guide.html#commitment-definition-of-done) 与 [ISTQB CTFL](https://istqb.org/certifications/certified-tester-foundation-level-ctfl-v4-0/)，不要求引入完整方法论或新工具。

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
