# CPU Steal Monitor：Emerald 生态集成

## 插件的两个模式

- **独立数据模式**：[CPU Steal Monitor](https://github.com/Chen017/komari-plugin-cpu-steal-monitor) 自行通过 Komari Agent 远程命令读取 /proc/stat，每两分钟生成 CPU Steal 样本，保存历史，并提供 REST API：/v1/history、/v1/summary、/v1/health（管理员）。不依赖 Emerald Insights。
- **主题可视化模式**：[Emerald Insights](https://github.com/Chen017/komari-theme-emerald-insights) 将样本作为第三条曲线叠加进节点详情的 CPU/Load Average 图。插件仍是唯一采集与存储服务，主题只是可选消费者。

这套关系参照 [Availability History](https://github.com/Chen017/komari-plugin-availability-history) 的“插件独立、推荐前端主题”的架构，避免维护一个难升级的 Komari 核心 Fork。

## 依赖与安装

| 目标 | 必需组件 |
| --- | --- |
| 单独采集与 API 读数 | Komari 服务端 + Linux Agent + CPU Steal Monitor 插件 |
| 原生 CPU/负载图新增 Steal 线 | 上述组件 + Emerald Insights 主题 |
| 独立在线率历史 | Availability History 插件 |
| IP 风险/解锁档案 | IPQA Alert Report 插件 + VPS 上的 IP-Quality-Archive |

**注意**：Agent 必须启用远程命令执行；禁用 Agent 的 Web SSH/远程控制会让 CPU Steal 采集不可用。插件不安装额外的采集器进程。
插件 ZIP 和主题 ZIP 分别导入 Komari 的插件管理、主题管理；不要把 GitHub Actions 外层 Artifact ZIP 直接上传到 Komari。

## 数据和权限边界

- 两分钟间隔、实际 UTC Unix 毫秒，计数器差值计算 Steal%。
- 重启/超时/掉线产生无数据的空缺，不能把缺失冒充 0%。
- 公开站点访客只能访问非隐藏节点；私有站点数据必须要求管理员身份。
- `GET /api/plugin/cpu-steal-monitor/v1/summary` 供其他客户端独立读取最新、平均、最大值和历史覆盖率；`/health` 仅管理员访问。
- 主题仅消费已有 `/history`，与插件分开版本、分开安装；插件失效时原生 CPU/负载图仍可用。

## 长期维护

- 插件自身仓库维护采样、持久化、API、Node 测试与 ZIP CI。
- 主题仓库维护时间轴算法、ECharts 组件、API 契约回归与主题 ZIP CI。
- 本生态仓库维护依赖图、推荐组合和两个模式的说明，**不复制插件源码**。
- 紧急回滚：停用插件即可恢复只有原生 CPU/负载的主题；不影响 Availability History 或 IPQA。
