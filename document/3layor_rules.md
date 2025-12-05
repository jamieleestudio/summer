# 传统三层架构返回对象与命名规范（单体 / 微服务通用）

## 1. 总体原则

* **Presentation 层（接口层 / Controller）**

  * 负责协议适配，接收 Request 对象，返回 Response 对象
  * 不直接操作数据库或业务逻辑
  * **理由**：保证接口层稳定，对外接口不泄漏内部实现

* **Business 层（服务层 / Service）**

  * 处理业务逻辑，操作数据，封装流程
  * 接收 DTO / Command 对象，返回业务对象（Business Model / Service Result）
  * **理由**：集中业务逻辑，便于测试和复用

* **Data Access 层（Repository / DAO）**

  * 与数据库交互，返回 Persistence Entity
  * 不包含业务逻辑
  * **理由**：分离数据存储与业务逻辑，保证层间职责清晰

* **转换规则**

  * Persistence Entity → Business Model → Response Object
  * Presentation 层与 Data Access 层通过 Business 层隔离
  * **理由**：保持分层清晰、便于维护

## 2. 层级对象规范

| 层级             | 输入                    | 输出                              | 输出模型命名建议                                                   | 理由                                |
| -------------- | --------------------- | ------------------------------- | ---------------------------------------------------------- | --------------------------------- |
| Presentation 层 | Request Object        | Response Object                 | <Noun>Response / <Noun>View / <Noun>Representation         | 明确接口输出，类不使用 DTO 后缀，可放在 `dto/` 文件夹 |
| Business 层     | Command / Query / DTO | Business Model / Service Result | <Noun>Info / <Noun>Summary / <Noun>Profile / <Noun>Outcome | 业务逻辑处理后返回语义化对象，保持可读性              |
| Data Access 层  | SQL / ORM 参数          | Persistence Entity              | Entity                                                     | 仅存储和映射数据库结构，不包含业务逻辑               |

## 3. 写操作返回对象

* 命名必须语义化，避免使用 `Result`
* 推荐后缀：Receipt / Confirmation / Outcome / Snapshot
* 示例：`CreateOrderCommand → OrderConfirmation`
* **理由**：清晰表达业务意图和操作结果

## 4. 读操作返回对象

* 命名语义化：Info / Summary / Profile / Representation
* 单项查询：`GetUserDetailQuery → UserDetailInfo`
* 列表查询：`ListOrdersQuery → OrderSummary`
* **理由**：保持可读性和一致性，便于前端和微服务消费

## 5. 转换规范

* **Persistence Entity → Business Model**：Data Access 层返回，Business 层转换
* **Business Model → Response Object**：由 Presentation 层转换，保证接口输出稳定
* **转换工具**：可用 MapStruct、AutoMapper 或手工转换
* **理由**：降低层间耦合，提高可维护性

## 6. 文件夹结构模板

```
/project-root
├── docs/                   # 文档、架构图、规范说明
├── config/                 # 配置（YAML/Properties）
├── src/main/java/com/example/project/
│   ├── presentation/       # 接口层 / Controller
│   │     ├── rest/
│   │     ├── dto/          # 请求/响应对象（语义化命名）
│   │     └── assembler/    # Business Model ↔ Response Object 转换
│   ├── business/           # 服务层 / Service
│   │     ├── command/
│   │     ├── query/
│   │     ├── model/        # Business Model（Info / Summary / Profile / Outcome）
│   │     └── service/      # Service 类
│   ├── dataaccess/         # 数据访问层 / Repository / DAO
│   │     ├── mapper/       # Entity ↔ Business Model 转换
│   │     └── entity/       # Persistence Entity
├── src/test/java/          # 单元测试
└── build.gradle / pom.xml  # 构建文件
```

* **理由**：清晰分层目录，职责明确，易于团队理解和维护

## 7. 命名模板

* 写操作（Command）：<Verb><Noun>Command → <Noun>Receipt / Confirmation / Snapshot
* 读操作（Query）：Get<List|Single><Noun>Query → <Noun>Info / Summary / Profile
* 接口层返回：<Noun>Response / <Noun>Representation
* **理由**：语义化命名提高可读性，便于维护和团队协作

## 8. 最佳实践 Checklist

* ☐ Presentation 层不直接操作 Business Model 或 Persistence Entity
* ☐ Business 层负责业务逻辑和模型转换
* ☐ Data Access 层仅操作数据库，不包含业务逻辑
* ☐ 所有对象命名语义化，不使用 DTO 后缀
* ☐ 微服务架构下返回对象统一结构（可选 data + meta + errors）
* **理由**：保持层次清晰、职责分明，便于维护和测试
