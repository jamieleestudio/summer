package com.summer.iam.application.service;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.User_;
import com.summer.iam.infrastructure.persistence.jpa.UserRepositoryJpa;
import com.summer.iam.infrastructure.persistence.jpa.specification.UserSpecification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 演示JPA Specification使用的服务类
 * 注意：当JPA Metamodel生成后，UserSpecification类中的字符串属性引用应更新为使用生成的元模型类
 */
@Service
public class UserSpecificationService {

    private final UserRepositoryJpa userRepositoryJpa;

    public UserSpecificationService(UserRepositoryJpa userRepositoryJpa) {
        this.userRepositoryJpa = userRepositoryJpa;
    }

    /**
     * 根据账号查找用户
     * @param account 账号
     * @return 用户对象
     */
    public Optional<User> findByAccount(String account) {
        return userRepositoryJpa.findOne(UserSpecification.withAccount(account));
    }

    /**
     * 按姓名模糊查询用户
     * @param name 姓名关键字
     * @return 用户列表
     */
    public List<User> findByNameLike(String name) {
        return userRepositoryJpa.findAll(UserSpecification.withNameLike(name));
    }

    /**
     * 复杂条件查询（分页）
     * @param account 账号（可选）
     * @param name 姓名（可选）
     * @param departmentId 部门ID（可选）
     * @param onlyAvailable 是否只查询可用用户
     * @param pageable 分页参数
     * @return 分页结果
     */
    public Page<User> findUsers(Optional<String> account,
                               Optional<String> name,
                               Optional<String> departmentId,
                               boolean onlyAvailable,
                               Pageable pageable) {
        
        // 使用组合Specification进行查询
        return userRepositoryJpa.findAll(
                UserSpecification.getUserSpecification(account, name, departmentId, onlyAvailable),
                pageable
        );
    }

    /**
     * 查找所有可用用户
     * @return 可用用户列表
     */
    public List<User> findAllAvailableUsers() {
        return userRepositoryJpa.findAll(UserSpecification.availableUsers());
    }

    /**
     * 按部门查找可用用户
     * @param departmentId 部门ID
     * @return 用户列表
     */
    public List<User> findAvailableUsersByDepartment(String departmentId) {
        return userRepositoryJpa.findAll(
                UserSpecification.withDepartmentId(departmentId)
                        .and(UserSpecification.availableUsers())
        );
    }
}