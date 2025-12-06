package com.summer.iam.application.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.UserFactory;
import com.summer.iam.domain.model.UserStatus;
import com.summer.iam.domain.model.Username;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserFactory userFactory;

    public UserService(UserRepository userRepository,
                              UserFactory userFactory,
                              PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.userFactory = userFactory;
    }

    public UserResponse create(UserCreateCommand cmd) {
        if (userRepository.findByAccount(cmd.getAccount()).isPresent()) {
            throw new IllegalArgumentException("账号已存在: " + cmd.getAccount());
        }
        Username username = new Username(cmd.getFirstName(), cmd.getLastName());
        UserStatus status = new UserStatus(cmd.getEnable(), Boolean.FALSE);
        User user = userFactory.create(
                username,
                cmd.getAccount(),
                passwordEncoder.encode(cmd.getPassword()),
                cmd.getEmail(),
                cmd.getPhone(),
                cmd.getGender(),
                cmd.getAvatar(),
                cmd.getDescription(),
                status,
                cmd.getDepartmentId(),
                cmd.getPositionIds(),
                cmd.getRoleIds()
        );
        User saved = userRepository.save(user);
        return UserResponse.from(saved);
    }

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
            user.setStatus(new UserStatus(cmd.getEnable(), Boolean.FALSE));
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

    public void delete(String id) { userRepository.deleteById(id); }

    @Transactional(readOnly = true)
    public Page<UserResponse> findAll(Pageable pageable) { return userRepository.findAll(pageable).map(UserResponse::from); }

    @Transactional(readOnly = true)
    public Optional<UserResponse> findById(String id) { return userRepository.findById(id).map(UserResponse::from); }

    
}
