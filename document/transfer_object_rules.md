# 传输对象（Request / Command / Query / Model / Response）统一规范

> 目标：稳定契约、分层清晰、以简驭繁。

## 1. 总体原则

- 分层边界：`API(interfaces) → application/domain → infrastructure`
- 对外稳定：对外只暴露 `Request/Response`，不泄漏 `Domain` 与 `Persistence` 细节
- 职责单一：
  - `Request/Response` 只表达协议层数据
  - `Command/Query` 只表达用例输入
  - `Application Model` 只表达用例输出（业务可用结果）
- 转换集中：转换由 `assembler` 承载；能自动映射就自动映射（如 MapStruct），避免重复样板代码

## 2. 对象类型定义

| 类型 | 所在层 | 方向 | 用途 | 典型后缀/命名 |
|---|---|---|---|---|
| `*Request` | `interfaces` | 入站 | HTTP/gRPC/消息入参 | `<Verb><Noun>Request` / `<Noun>CreateRequest` |
| `*Command` | `application` | 入站 | 写用例输入（意图 + 必要字段） | `<Verb><Noun>Command` |
| `*Query` | `application` | 入站 | 读用例输入（筛选、分页、排序） | `Get*Query` / `List*Query` |
| `*Info/*Summary/*Profile` | `application` | 出站 | 用例输出（业务结果对象） | `<Noun>Info` / `<Noun>Summary` |
| `*Response` | `interfaces` | 出站 | 对外返回对象（可版本化） | `<Noun>Response` / `<Noun>DetailResponse` |

补充：领域层对象（Entity/VO/Aggregate）不参与对外契约，禁止直接出现在 Controller 返回值中。

## 3. 包结构与归档位置

- `interfaces.rest.dto.<resource>`：资源维度的 `Request/Response`
  - 例：`interfaces.rest.dto.user.UserCreateRequest`、`interfaces.rest.dto.user.UserResponse`
- `interfaces.rest.dto.request|response`：跨资源、偏“会话/认证/通用协议”的对象
  - 例：`interfaces.rest.dto.request.LoginRequest`、`interfaces.rest.dto.response.LoginResponse`
- `application.command`：用例命令（写）
- `application.query`：用例查询（读）（建议新增，保持语义清晰）
- `application.model`：用例输出模型（`Info/Summary/Profile`）
- `interfaces.rest.assembler`：对象转换（`Request ↔ Command/Query`、`Model ↔ Response`）

## 4. 转换规则（强约束）

- 允许的调用链：
  - `Request → Command/Query → Domain → Application Model → Response`
- 禁止跨层直接传递：
  - Controller 禁止直接返回 `Domain Entity/VO`、禁止直接返回 `Persistence Entity`
  - `application` 禁止依赖 `interfaces.rest.dto.*`（避免协议耦合）

### 4.1 当前代码的兼容说明（渐进治理）

当前 `summer-iam` 部分 `application.service` 直接返回 `*Response`（例如 `UserService#create` 返回 `UserResponse`，`RoleService` 返回 `RoleDetailResponse`）。这属于“用例服务同时承担接口层投影”的快捷实现：

- 小规模单协议项目可以继续运行
- 若需要：多协议适配（REST + 消息）、接口版本化、或复用用例服务，则应迁移为 `application.model` 输出，并在 `assembler` 中完成 `Model → Response`

## 5. 命名规范（统一口径）

- Request
  - 写：`<Noun>CreateRequest` / `<Noun>UpdateRequest` / `<Noun>EnabledRequest`
  - 读：`<Noun>ListRequest`（如确需表达复杂筛选；否则使用 `@RequestParam` + `Pageable`）
- Command / Query
  - 写：`Create<Noun>Command` / `Update<Noun>Command` / `Enable<Noun>Command`
  - 读：`Get<Noun>Query` / `List<Noun>Query`
- Application Model
  - 单体详情：`<Noun>Info`
  - 列表投影：`<Noun>Summary`
  - 权限/画像类：`<Noun>Profile`
- Response
  - 列表：`<Noun>Response`
  - 详情：`<Noun>DetailResponse`

约束：避免 `DTO/VO/Result` 作为对外类型后缀；用语义化后缀表达用途与范围。

## 6. 字段规范

- `id`：对外统一 `String`（若未来引入雪花/UUID/数字 ID，接口层保持兼容）
- 时间：统一 `OffsetDateTime`/`Instant`（如项目已约定 `LocalDateTime` 则保持一致），对外序列化保持 ISO-8601
- 集合：空集合优先返回 `[]`，避免 `null`
- 布尔：命名使用 `enabled/enable` 风格保持一致（同一资源内不可混用）

## 7. 校验与幂等

- 入口校验：Controller 的 `@RequestBody` 配合 `@Valid`；字段约束放在 `*Request`
- 用例校验：业务不变量在领域模型/领域服务中兜底校验
- 幂等建议：写接口如存在重复提交风险，使用业务幂等键（由调用方提供或服务端生成）

## 8. Assembler 约定

- 命名：统一 `*Assembler`
- 职责边界：
  - `toCreateCommand/toUpdateCommand/toQuery`
  - `toResponse`（从 `application.model` 映射到 `*Response`）
- 实现方式：
  - 简单字段映射可手写（保持最少依赖）
  - 映射样板多时可引入 MapStruct，将 `Assembler` 设计为 `@Mapper(componentModel = "spring")`

## 9. 示例（与现有代码对齐）

- `Position` 走完整链路：
  - `PositionController`：`Request → Command` 与 `Model → Response`
  - `PositionService`：输出 `application.model.PositionInfo/PositionSummary`
- `User/Role` 当前为兼容实现：
  - `UserService`/`RoleService` 直接输出 `*Response`
  - 建议逐步迁移：新增 `application.model.UserInfo/UserSummary`、`RoleInfo/RoleSummary`，并将 `*Response.from(domain)` 移到 `assembler`

## 10. Checklist

- [ ] Controller 只接收 `*Request`，只返回 `*Response` 或统一包装（如 `ApiResponse`）
- [ ] `application` 不依赖 `interfaces.rest.dto.*`
- [ ] 领域对象不出现在接口层签名中
- [ ] `Assembler` 承担所有跨层转换
- [ ] 命名语义化，避免 `DTO/Result`
