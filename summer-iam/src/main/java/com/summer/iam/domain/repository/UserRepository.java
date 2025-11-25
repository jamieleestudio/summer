package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.User;

import java.util.List;
import java.util.Optional;

/**
 * 用户仓储接口
 * 定义用户领域对象的持久化操作
 * 接口位于领域层，实现位于基础设施层
 */
public interface UserRepository {

    /**
     * 根据ID查找用户
     * @param id 用户ID
     * @return 用户对象，如果不存在返回empty
     */
    Optional<User> findById(String id);

    /**
     * 根据账号查找用户
     * @param account 用户账号
     * @return 用户对象，如果不存在返回empty
     */
    Optional<User> findByAccount(String account);

    /**
     * 根据邮箱查找用户
     * @param email 用户邮箱
     * @return 用户对象，如果不存在返回empty
     */
    Optional<User> findByEmail(String email);

    /**
     * 根据电话查找用户
     * @param phone 用户电话
     * @return 用户对象，如果不存在返回empty
     */
    Optional<User> findByPhone(String phone);

    /**
     * 查询所有可用用户
     * @return 可用用户列表
     */
    List<User> findAllAvailable();

    /**
     * 查询所有用户
     * @return 用户列表
     */
    List<User> findAll();

    /**
     * 保存用户
     * @param user 用户对象
     * @return 保存后的用户对象
     */
    User save(User user);

    /**
     * 批量保存用户
     * @param users 用户列表
     * @return 保存后的用户列表
     */
    List<User> saveAll(List<User> users);

    /**
     * 删除用户
     * @param user 用户对象
     */
    void delete(User user);

    /**
     * 根据ID删除用户
     * @param id 用户ID
     */
    void deleteById(String id);

    /**
     * 判断用户是否存在
     * @param id 用户ID
     * @return 是否存在
     */
    boolean existsById(String id);

    /**
     * 判断账号是否已被使用
     * @param account 用户账号
     * @return 是否已被使用
     */
    boolean existsByAccount(String account);

    /**
     * 判断邮箱是否已被使用
     * @param email 用户邮箱
     * @return 是否已被使用
     */
    boolean existsByEmail(String email);

    /**
     * 判断电话是否已被使用
     * @param phone 用户电话
     * @return 是否已被使用
     */
    boolean existsByPhone(String phone);
}