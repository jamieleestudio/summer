package com.summer.admin.domain.service;

import com.summer.admin.domain.model.User;
import com.summer.admin.domain.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 用户领域服务实现类
 * 实现具体的业务逻辑
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User login(String account, String password) {
        Optional<User> optionalUser = userRepository.findByAccount(account);
        if (!optionalUser.isPresent()) {
            throw new RuntimeException("用户不存在");
        }

        User user = optionalUser.get();
        if (!user.isEnabled()) {
            throw new RuntimeException("用户已被禁用");
        }

        if (!user.verifyPassword(password)) {
            throw new RuntimeException("密码错误");
        }

        return user;
    }

    @Override
    public User createUser(User user) {
        // 检查账号是否已存在
        if (isAccountExists(user.getAccount())) {
            throw new RuntimeException("账号已被使用");
        }

        // 检查邮箱是否已存在
        if (user.getEmail() != null && !user.getEmail().isEmpty() && isEmailExists(user.getEmail())) {
            throw new RuntimeException("邮箱已被使用");
        }

        // 检查电话是否已存在
        if (user.getPhone() != null && !user.getPhone().isEmpty() && isPhoneExists(user.getPhone())) {
            throw new RuntimeException("电话已被使用");
        }

        // 生成用户ID
        if (user.getId() == null || user.getId().isEmpty()) {
            user.setId(UUID.randomUUID().toString());
        }

        // 设置创建时间
        user.setCreatedAt(System.currentTimeMillis());
        user.setUpdatedAt(System.currentTimeMillis());

        // 保存用户
        return userRepository.save(user);
    }

    @Override
    public User updateUser(User user) {
        // 检查用户是否存在
        User existingUser = getUserById(user.getId());

        // 更新用户信息
        existingUser.updatePersonalInfo(
                user.getName(),
                user.getEmail(),
                user.getPhone(),
                user.getDepartment(),
                user.getPosition()
        );

        // 更新密码（如果提供了新密码）
        if (user.getPassword() != null && !user.getPassword().isEmpty() && 
                !existingUser.getPassword().equals(user.getPassword())) {
            existingUser.changePassword(user.getPassword());
        }

        // 更新用户状态（如果提供了状态变更）
        if (user.isEnabled() != existingUser.isEnabled()) {
            if (user.isEnabled()) {
                existingUser.enable();
            } else {
                existingUser.disable();
            }
        }

        // 更新最后更新时间
        existingUser.setUpdatedAt(System.currentTimeMillis());

        // 保存更新
        return userRepository.save(existingUser);
    }

    @Override
    public User getUserById(String id) {
        Optional<User> optionalUser = userRepository.findById(id);
        return optionalUser.orElseThrow(() -> new RuntimeException("用户不存在: " + id));
    }

    @Override
    public User getUserByAccount(String account) {
        Optional<User> optionalUser = userRepository.findByAccount(account);
        return optionalUser.orElseThrow(() -> new RuntimeException("用户不存在: " + account));
    }

    @Override
    public List<User> getAllAvailableUsers() {
        return userRepository.findAllAvailable();
    }

    @Override
    public User enableUser(String id) {
        User user = getUserById(id);
        user.enable();
        user.setUpdatedAt(System.currentTimeMillis());
        return userRepository.save(user);
    }

    @Override
    public User disableUser(String id) {
        User user = getUserById(id);
        user.disable();
        user.setUpdatedAt(System.currentTimeMillis());
        return userRepository.save(user);
    }

    @Override
    public void deleteUser(String id) {
        User user = getUserById(id);
        user.delete();
        user.setUpdatedAt(System.currentTimeMillis());
        userRepository.save(user);
    }

    @Override
    public boolean isAccountExists(String account) {
        return userRepository.existsByAccount(account);
    }

    @Override
    public boolean isEmailExists(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean isPhoneExists(String phone) {
        return userRepository.existsByPhone(phone);
    }
}