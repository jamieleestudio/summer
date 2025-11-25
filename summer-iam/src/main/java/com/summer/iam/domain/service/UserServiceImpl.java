package com.summer.iam.domain.service;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.UserRepository;
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
        // 保存用户
        return userRepository.save(user);
    }

    @Override
    public User updateUser(User user) {
        // 检查用户是否存在
        User existingUser = getUserById(user.getId());
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
        return userRepository.save(user);
    }

    @Override
    public User disableUser(String id) {
        User user = getUserById(id);
        user.disable();
        return userRepository.save(user);
    }

    @Override
    public void deleteUser(String id) {
        User user = getUserById(id);
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