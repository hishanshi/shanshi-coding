# shanshi-coding

`shanshi-coding` 用于结合代码理解业务、澄清需求、设计与实现方案、分析修复缺陷，以及维护项目文档和知识库，适用于代码仓库和独立管理仓库。

规则正文统一维护在 [SKILL.md](SKILL.md)。本页提供使用示例、评估方法和安装说明；规则调整时，只需按需修订受影响的示例与用法。

## 如何使用

用自然语言说明希望解决的问题和本次交付物，可以从尚未想清楚的问题开始：

| 场景 | 请求示例 |
| --- | --- |
| 理解业务 | “读代码解释退款规则和例外，先别改代码。” |
| 需求与实现 | “审批流程不太好用，帮我结合现状梳理问题，再设计方案。” |
| 缺陷修复 | “偶发重复创建工单，我怀疑是缓存，帮我分析并修复。” |
| 知识管理 | “整理这个项目知识库，处理重复内容和过期说明。” |

具体约定见 [对齐意图](SKILL.md#对齐意图)、[定义验收](SKILL.md#定义验收)、[产物偏好](SKILL.md#产物偏好) 和 [工作边界](SKILL.md#工作边界)。指令不依赖具体模型或工具提供方。

## 验收示例

场景模板以 [SKILL.md 的定义验收](SKILL.md#定义验收) 为准。下面演示如何把一条约定展开为有区分力的场景。

假设已约定“按事件 ID 去重，重复成功通知返回已有工单”：

| 场景 | 可观察的预期结果与验证方式 |
| --- | --- |
| 首次处理有效事件 | 创建一张工单，核对返回结果与持久化记录一致。 |
| 再次处理同一事件 | 返回同一张工单，检查持久化记录不增加。 |
| 处理不同事件 | 分别创建工单，检查正常请求没有被误判为重复。 |
| 并发处理同一事件（若约定支持并发） | 最终只有一张工单，通过真实持久化与并发机制验证。 |

这些场景分别保护创建、去重、去重范围和并发约束。只检查新增函数被调用几次，无法完整证明这些结果。

这个例子也暴露了一个待定问题：“写入失败后应该返回什么，能否重试？”可以结合现有契约给出建议，确定预期后补充对应场景。

## 如何评估效果

格式校验通过只能证明 skill 可加载。可从上述四类请求中选择真实任务，将事前预期与最终产物对照，并用以下情况检查模型是否出现偏差：

| 试用条件 | 观察重点 |
| --- | --- |
| 新测试通过，既有套件失败 | 是否识别历史失败与本次回归，是否准确报告验证范围。 |
| 断言放宽或用例被跳过后通过 | 是否有业务依据或等价覆盖，是否只是让检查变绿。 |
| 测试通过后又修改共享逻辑 | 交付证据是否仍对应最终变更。 |
| 临时调试输出与原有诊断日志共存 | 是否清理本次临时内容并保护已有内容。 |
| 文档描述与实际产物不一致 | 是否发现规则、示例、引用或任务状态的偏差。 |

记录导致误解、遗漏或错误完成声明的具体请求和产物，再据此修订 [SKILL.md](SKILL.md)。区分缺陷引起的返工与新增需求、正常探索，不按提问数、测试数或输出篇幅打分。这些试用条件不代表已经完成了模型行为测试。

## 设计依据

用具体例子讨论规则和未决问题，参考 [Cucumber Example Mapping](https://cucumber.io/docs/bdd/example-mapping/)。面向可观察行为编写测试，参考 [Google Testing Blog](https://testing.googleblog.com/2013/08/testing-on-toilet-test-behavior-not.html)。

将完成质量明确表达出来，参考 [Scrum Guide 的 Definition of Done](https://scrumguides.org/scrum-guide.html#commitment-definition-of-done)；测试分析、设计与风险管理参考 [ISTQB CTFL](https://istqb.org/certifications/certified-tester-foundation-level-ctfl-v4-0/)。本 skill 将这些思想用于个人与模型的协作，不要求采用完整方法论或新增工具。

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
- `README.md`：中文使用说明、示例与安装指南。
- `publish.sh`：安装/卸载到 Claude Code、Codex 和 opencode 的本地脚本。
