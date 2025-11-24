package com.summer.admin.domain.service;

import com.summer.admin.domain.model.User;
import java.util.List;
import java.util.Optional;

/**
 * 用户领域服务接口
 * 封装跨实体或复杂的业务逻辑
 */
public interface UserService {

    /**
     * 用户登录
     * @param account 账号
     * @param password 密码
     * @return 登录成功的用户
     * @throws RuntimeException 登录失败时抛出异常
     */
    User login(String account, String password);

    /**
     * 创建用户
     * @param user 用户对象
     * @return 创建的用户
     * @throws RuntimeException 创建失败时抛出异常
     */
    User createUser(User user);

    /**
     * 更新用户信息
     * @param user 用户对象
     * @return 更新后的用户
     * @throws RuntimeException 更新失败时抛出异常
     */
    User updateUser(User user);

    /**
     * 根据ID获取用户
     * @param id 用户ID
     * @return 用户对象
     * @throws RuntimeException 用户不存在时抛出异常
     */
    User getUserById(String id);

    /**
     * 根据账号获取用户
     * @param account 用户账号
     * @return 用户对象
     * @throws RuntimeException 用户不存在时抛出异常
     */
    User getUserByAccount(String account);

    /**
     * 获取所有可用用户
     * @return 用户列表
     */
    List<User> getAllAvailableUsers();

    /**
     * 启用用户
     * @param id 用户ID
     * @return 启用后的用户
     * @throws RuntimeException 操作失败时抛出异常
     */
    User enableUser(String id);

    /**
     * 禁用用户
     * @param id 用户ID
     * @return 禁用后的用户
     * @throws RuntimeException 操作失败时抛出异常
     */
    User disableUser(String id);

    /**
     * 删除用户（软删除）
     * @param id 用户ID
     * @throws RuntimeException 操作失败时抛出异常
     */
    void deleteUser(String id);

    /**
     * 检查账号是否已被使用
     * @param account 用户账号
     * @return 是否已被使用
     */
    boolean isAccountExists(String account);

    /**
     * 检查邮箱是否已被使用
     * @param email 用户邮箱
     * @return 是否已被使用
     */
    boolean isEmailExists(String email);

    /**
     * 检查电话是否已被使用
     * @param phone 用户电话
     * @return 是否已被使用
     */
    boolean isPhoneExists(String phone);
}