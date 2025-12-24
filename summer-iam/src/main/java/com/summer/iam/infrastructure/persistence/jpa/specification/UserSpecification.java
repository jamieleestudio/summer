package com.summer.iam.infrastructure.persistence.jpa.specification;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.User_;
import org.springframework.data.jpa.domain.Specification;

import java.util.Optional;

/**
 * User实体的JPA Specification示例类
 * 使用JPA Metamodel进行类型安全的查询
 */
public class UserSpecification {

    /**
     * 根据账号模糊查询用户
     * @param account 账号关键字
     * @return Specification对象
     */
    public static Specification<User> withAccount(String account) {
        return (root, query, criteriaBuilder) -> {
            if (account == null || account.isEmpty()) {
                return null;
            }
            String pattern = "%" + account + "%";
            return criteriaBuilder.like(root.get(User_.account), pattern);
        };
    }

    /**
     * 根据姓名模糊查询用户
     * @param name 姓名关键字
     * @return Specification对象
     */
    public static Specification<User> withNameLike(String name) {
        return (root, query, criteriaBuilder) -> {
            if (name == null || name.isEmpty()) {
                return null;
            }
            String pattern = "%" + name + "%";
            return criteriaBuilder.or(
                criteriaBuilder.like(root.get("username").get("firstName"), pattern),
                criteriaBuilder.like(root.get("username").get("lastName"), pattern)
            );
        };
    }

    /**
     * 根据部门ID查找用户
     * @param departmentId 部门ID
     * @return Specification对象
     */
    public static Specification<User> withDepartmentId(String departmentId) {
        return (root, query, criteriaBuilder) -> {
            if (departmentId == null) {
                return null;
            }
            // 使用类型安全的元模型引用
            return criteriaBuilder.equal(root.get(User_.department).get("id"), departmentId);
        };
    }

    /**
     * 根据手机号模糊查询用户
     * @param phone 手机号关键字
     * @return Specification对象
     */
    public static Specification<User> withPhone(String phone) {
        return (root, query, criteriaBuilder) -> {
            if (phone == null || phone.isEmpty()) {
                return null;
            }
            String pattern = "%" + phone + "%";
            return criteriaBuilder.like(root.get(User_.phone), pattern);
        };
    }

    /**
     * 根据启停用状态查询用户
     * @param enabled 启用状态
     * @return Specification对象
     */
    public static Specification<User> withEnabled(Boolean enabled) {
        return (root, query, criteriaBuilder) -> {
            if (enabled == null) {
                return null;
            }
            return criteriaBuilder.equal(root.get(User_.enable), enabled);
        };
    }

    /**
     * 过滤未被删除的用户
     * @return Specification对象
     */
    public static Specification<User> notDeleted() {
        return (root, query, criteriaBuilder) -> criteriaBuilder.isFalse(root.get(User_.deleted));
    }

    /**
     * 查找可用的用户（启用且未删除）
     * @return Specification对象
     */
    public static Specification<User> availableUsers() {
        return withEnabled(Boolean.TRUE).and(notDeleted());
    }

    /**
     * 组合多个查询条件
     * @param account 账号
     * @param name 姓名
     * @param phone 手机号
     * @param departmentId 部门ID
     * @param enabled 启停用状态
     * @return 组合后的Specification
     */
    public static Specification<User> getUserSpecification(
            Optional<String> account,
            Optional<String> name,
            Optional<String> phone,
            Optional<String> departmentId,
            Optional<Boolean> enabled) {

        Specification<User> spec = Specification.unrestricted();

        if (account.isPresent()) {
            spec = spec.and(withAccount(account.get()));
        }

        if (name.isPresent()) {
            spec = spec.and(withNameLike(name.get()));
        }

        if (phone.isPresent()) {
            spec = spec.and(withPhone(phone.get()));
        }

        if (departmentId.isPresent()) {
            spec = spec.and(withDepartmentId(departmentId.get()));
        }

        // 默认只查询未删除的用户
        spec = spec.and(notDeleted());

        if (enabled.isPresent()) {
            spec = spec.and(withEnabled(enabled.get()));
        }

        return spec;
    }
}
