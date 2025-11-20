<div align="center">

# Summer

[![Java](https://img.shields.io/badge/Java-17%2B-blue.svg)](https://adoptium.net/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-4.0.0--RC1-6DB33F.svg)](https://spring.io/projects/spring-boot)
[![Build](https://img.shields.io/badge/Build-Maven-C71A36.svg)](https://maven.apache.org/)

</div>

## Overview
Summer is a modular, production‑ready starter for enterprise Java applications. It uses Spring Boot 4, Spring Security (JWT), JPA/Hibernate, and SpringDoc OpenAPI.

## Tech Stack
- Spring Boot 4.0.0‑RC1
- Spring Security 7 with JWT
- Spring Data JPA (Hibernate)
- SpringDoc OpenAPI (Swagger UI)
- Java 17+

## Modules
- `summer-manage`: Application entrypoint (`SummerApplication`)
- `summer-system`: Domain, REST interfaces, security, persistence entities
- `summer-framework`: Shared framework components (ORM base classes, utilities)
- `summer-starter`: Starters for JPA and Web
- `summer-bom`: Centralized dependency management

## Getting Started
### Prerequisites
- `JDK 17+`
- `Maven 3.8+`
- A running MySQL instance

### Build & Run
```bash
mvn -DskipTests package
java -jar summer-manage/target/summer-manage-1.0.jar
```

Default port is `8081`. After startup:
- Swagger UI: `http://localhost:8081/swagger-ui/index.html`
- OpenAPI JSON: `http://localhost:8081/v3/api-docs`

### Configuration
Application configuration lives in `summer-manage/src/main/resources/application.yml`.
```yaml
server:
  port: 8081

spring:
  datasource:
    url: jdbc:mysql://localhost:3306/summer?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true
    username: <your-username>
    password: <your-password>
    driver-class-name: com.mysql.cj.jdbc.Driver

jwt:
  header: Authorization
  base64-secret: <base64-encoded-secret>
  token-validity-in-seconds: 86400
  token-validity-in-seconds-for-remember-me: 108000
```

## API
- `POST /authenticate`: Issue JWT token for valid credentials.
  - Request: `username`, `password`, `rememberMe` (optional)
  - Response: `{ "id_token": "<jwt>" }` + `Authorization: Bearer <jwt>` header

## Development
- Import the project in your IDE and run `SummerApplication` in the `summer-manage` module.
- Swagger UI supports the `Authorize` button. Paste the raw token; `Bearer` is added automatically.

## Contributing
- Fork the repo, create a feature branch, and open a Pull Request.
- Keep commits focused and include tests where applicable.

## License
This project does not currently specify a license. Contact the maintainers for details.
