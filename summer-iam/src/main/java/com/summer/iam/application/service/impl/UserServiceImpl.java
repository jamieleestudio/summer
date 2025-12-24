package com.summer.iam.application.service.impl;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.application.query.UserPageQuery;
import com.summer.iam.application.service.UserService;
import com.summer.iam.application.service.UserSpecificationService;
import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.UserFactory;
import com.summer.iam.domain.model.Username;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserFactory userFactory;
    private final UserSpecificationService userSpecificationService;

    public UserServiceImpl(UserRepository userRepository,
                           UserFactory userFactory,
                           PasswordEncoder passwordEncoder,
                           UserSpecificationService userSpecificationService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.userFactory = userFactory;
        this.userSpecificationService = userSpecificationService;
    }

    @Override
    public UserResponse create(UserCreateCommand cmd) {
        if (userRepository.findByAccount(cmd.getAccount()).isPresent()) {
            throw new IllegalArgumentException("账号已存在: " + cmd.getAccount());
        }
        Username username = new Username(cmd.getFirstName(), cmd.getLastName());
        User user = userFactory.create(
                username,
                cmd.getAccount(),
                passwordEncoder.encode(cmd.getPassword()),
                cmd.getEmail(),
                cmd.getPhone(),
                cmd.getGender(),
                cmd.getAvatar(),
                cmd.getDescription(),
                cmd.getEnable(),
                Boolean.FALSE,
                cmd.getDepartmentId(),
                cmd.getPositionIds(),
                cmd.getRoleIds()
        );
        User saved = userRepository.save(user);
        return UserResponse.from(saved);
    }

    @Override
    public Optional<UserResponse> update(String id, UserUpdateCommand cmd) {
        return userRepository.findById(id).map(user -> {
            user.setUsername(new Username(cmd.getFirstName(), cmd.getLastName()));
            user.setAccount(cmd.getAccount());
            if (cmd.getPassword() != null) user.setPassword(passwordEncoder.encode(cmd.getPassword()));
            user.setEmail(cmd.getEmail());
            user.setPhone(cmd.getPhone());
            user.setGender(cmd.getGender());
            user.setAvatar(cmd.getAvatar());
            user.setDescription(cmd.getDescription());
            user.setEnable(cmd.getEnable());
            user.setDeleted(Boolean.FALSE);
            userFactory.populateRelations(
                    user,
                    cmd.getDepartmentId(),
                    cmd.getPositionIds(),
                    cmd.getRoleIds()
            );
            User saved = userRepository.save(user);
            return UserResponse.from(saved);
        });
    }

    @Override
    public void delete(String id) { userRepository.deleteById(id); }

    @Override
    @Transactional(readOnly = true)
    public Page<UserResponse> findAll(Pageable pageable) { return userRepository.findAll(pageable).map(UserResponse::from); }

    @Override
    @Transactional(readOnly = true)
    public Optional<UserResponse> findById(String id) { return userRepository.findById(id).map(UserResponse::from); }

    @Override
    public void setEnabled(String id, Boolean enabled) {
        userRepository.findById(id).map(user -> {
            user.setEnable(enabled);
            return userRepository.save(user);
        }).orElseThrow(() -> new IllegalArgumentException("用户不存在: " + id));
    }

    @Override
    @Transactional(readOnly = true)
    public Page<UserResponse> search(UserPageQuery query, Pageable pageable) {
        Optional<String> accountOpt = Optional.ofNullable(query.getAccount()).filter(s -> !s.isBlank());
        Optional<String> nameOpt = Optional.ofNullable(query.getName()).filter(s -> !s.isBlank());
        Optional<String> phoneOpt = Optional.ofNullable(query.getPhone()).filter(s -> !s.isBlank());
        Optional<Boolean> enabledOpt = Optional.ofNullable(query.getEnabled());

        Page<User> page = userSpecificationService.findUsers(
                accountOpt,
                nameOpt,
                phoneOpt,
                Optional.empty(),
                enabledOpt,
                pageable
        );

        return page.map(UserResponse::from);
    }

}
