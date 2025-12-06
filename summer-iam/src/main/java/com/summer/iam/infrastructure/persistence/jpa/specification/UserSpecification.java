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
     * 根据账号查找用户
     * @param account 账号
     * @return Specification对象
     */
    public static Specification<User> withAccount(String account) {
        return (root, query, criteriaBuilder) -> {
            if (account == null) {
                return null;
            }
            // 使用类型安全的元模型引用
            return criteriaBuilder.equal(root.get(User_.account), account);
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
     * 查找可用的用户
     * @return Specification对象
     */
    public static Specification<User> availableUsers() {
        return (root, query, criteriaBuilder) -> {
            // 使用类型安全的元模型引用
            return criteriaBuilder.and(
                criteriaBuilder.isTrue(root.get(User_.enable)),
                criteriaBuilder.isFalse(root.get(User_.deleted))
            );
        };
    }

    /**
     * 组合多个查询条件
     * @param account 账号
     * @param name 姓名
     * @param departmentId 部门ID
     * @param onlyAvailable 是否只查询可用用户
     * @return 组合后的Specification
     */
    public static Specification<User> getUserSpecification(
            Optional<String> account,
            Optional<String> name,
            Optional<String> departmentId,
            boolean onlyAvailable) {
        
        Specification<User> spec = Specification.where(null);
        
        if (account.isPresent()) {
            spec = spec.and(withAccount(account.get()));
        }
        
        if (name.isPresent()) {
            spec = spec.and(withNameLike(name.get()));
        }
        
        if (departmentId.isPresent()) {
            spec = spec.and(withDepartmentId(departmentId.get()));
        }
        
        if (onlyAvailable) {
            spec = spec.and(availableUsers());
        }
        
        return spec;
    }
}
