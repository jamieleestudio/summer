# DDD 分层返回对象与转换规范（单体 / 微服务通用）

## 1. 总体原则
- **领域层纯净**：仅包含实体、值对象、聚合根、领域服务。不得返回数据承载对象或依赖外部框架。
  - **理由**：保证业务逻辑与持久化或外部框架解耦，领域层只关注业务规则，易于测试与维护。
- **应用层职责**：处理用例编排，输入 Command / Query，输出 Application Data Model（业务结果对象），负责领域对象与外部模型转换。
  - **理由**：集中处理业务流程和对象转换，保持领域模型纯净，同时为接口层提供一致的数据结构。
- **接口层职责**：负责协议适配（HTTP / gRPC / 消息），输入 Request Object，输出 Response Object。不可直接操作领域对象。
  - **理由**：保证 API 输出稳定，避免前端或其他系统依赖领域层内部结构。
- **转换规则**：Persistence Entity → Domain Object → Application Data Model → Response Object。禁止跨层直接返回或传递对象。
  - **理由**：确保层之间职责清晰，避免领域逻辑污染外部表示，便于维护和演进。

## 2. 层级对象规范

| 层级 | 输入 | 输出 | 允许领域对象 | 输出模型命名建议 | 理由 |
|------|------|------|--------------|----------------|------|
| 接口层 | Request Object | Response Object | ❌ | <Noun>Response / <Noun>ViewModel / <Noun>Representation | 保证接口层稳定，对外接口不泄漏内部领域模型。类不使用 DTO 后缀，但可放在 dto 文件夹。 |
| 应用层 | Command / Query | Application Model | ✔（内部） | <Noun>Info / <Noun>Summary / <Noun>Profile | 将领域对象转换为业务可用模型，保持领域纯净且可复用。 |
| 领域层 | Entity / VO | Entity / VO | ✔ | 无需后缀 | 专注业务逻辑，维持不依赖持久化或框架的纯净模型。 |

### 2.1 写操作返回对象（Command）
- 命名必须语义化，避免使用 Result
- 推荐后缀：Receipt / Confirmation / Outcome / Snapshot
- 示例：TransferCommand → TransferReceipt，PlaceOrderCommand → OrderConfirmation
- **理由**：提供明确业务意图和操作结果语义，避免模糊的 Result 后缀。

### 2.2 读操作返回对象（Query，微服务适用）
- 避免使用 DTO / View 后缀，使用 Info / Summary / Snapshot / Profile 等语义化命名
- 单项查询：GetUserDetailQuery → UserDetailInfo
- 列表查询：ListOrdersQuery → OrderSummary
- **理由**：清晰表达数据用途和范围，便于微服务或前端消费，保持层间解耦。

## 3. 转换规范
- **Persistence Entity → Domain Object**：由仓储层负责，保持领域层纯净
  - **理由**：分离数据库存储逻辑和业务逻辑，防止 ORM 细节渗入领域层。
- **Domain Object → Application Model**：由应用层负责，保证业务逻辑与表现分离
  - **理由**：应用层将领域对象转换为业务可用模型，便于接口层和前端使用。
- **Application Model → Response Object**：由接口层负责，确保 API 稳定
  - **理由**：保护领域层和应用层内部结构，提供一致、可版本化的接口。
- **转换工具**：可使用 MapStruct（Java）或 AutoMapper（.NET）进行自动映射，也可手工转换
  - **理由**：减少重复代码，提高可维护性和一致性。

## 4. 转换示例
```
Persistence Entity: UserPO
      ↓ 仓储层转换
Domain Object: User (实体)
      ↓ 应用层转换
Application Model: UserDetailInfo
      ↓ 接口层转换
Response Object: UserResponse
```
- **理由**：展示完整的层级转换，保持职责清晰和数据一致性。

## 5. 命名模板
- 写操作（Command）：<Verb><Noun>Command → <Noun>Receipt / Confirmation / Snapshot
- 读操作（Query）：Get<List|Single><Noun>Query → <Noun>Info / Summary / Profile
- 接口层返回：<Noun>Response / <Noun>Representation
- **理由**：语义化命名提高可读性，便于团队理解和维护。

## 6. 文件夹结构模板
```
/project-root
├── docs/                      # 文档、架构图、规范说明
├── config/                    # 配置（YAML/Properties）
├── src/main/java/com/example/project/
│   ├── application/           # 应用层
│   │     ├── command/
│   │     ├── query/
│   │     ├── model/           # Application Data Model（Info / Summary / Profile）
│   │     └── service/
│   ├── domain/                # 领域层
│   │     ├── model/
│   │     │     ├── aggregate/
│   │     │     ├── entity/
│   │     │     ├── vo/
│   │     │     └── event/
│   │     ├── service/         # 领域服务
│   │     └── repository/      # 仓储接口
│   ├── infrastructure/        # 基础设施层
│   │     ├── persistence/
│   │     │     ├── mapper/    # PO ↔ Domain Object 转换
│   │     │     └── po/        # Persistence Entity
│   │     ├── repository/      # 仓储实现
│   │     ├── config/          # 框架、第三方库配置
│   │     └── client/          # 外部服务调用
│   └── interfaces/            # 接口层
│         ├── rest/
│         ├── dto/             # 文件夹可称 dto，用于存放接口层对象（Request/Response等）
│         └── assembler/       # Application Model ↔ Response Object 转换
├── src/test/java/             # 单元测试 / 领域层测试
└── build.gradle / pom.xml     # 构建文件
```
- **理由**：清晰分层目录，便于开发团队理解责任边界和模块管理。

## 7. 最佳实践 Checklist
- ☐ 领域层不返回 Application Model / Response Object / Request Object
- ☐ 应用层负责 Domain Object → Application Model
- ☐ 接口层负责 Application Model → Response Object
- ☐ 所有层之间禁止直接暴露领域对象或 Persistence Entity
- ☐ 命名必须语义化，不使用抽象 Result 或 DTO 后缀
- **理由**：保持层次清晰、职责分明，便于维护、测试和团队协作。
