package com.summer.iam.application.service;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.UserFactory;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final DepartmentRepository departmentRepository;
    private final PositionRepository positionRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository,
                              DepartmentRepository departmentRepository,
                              PositionRepository positionRepository,
                              RoleRepository roleRepository,
                              PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.departmentRepository = departmentRepository;
        this.positionRepository = positionRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserResponse create(UserCreateCommand cmd) {
        if (userRepository.findByAccount(cmd.getAccount()).isPresent()) {
            throw new IllegalArgumentException("账号已存在: " + cmd.getAccount());
        }
        Department dept = null;
        if (cmd.getDepartmentId() != null) {
            dept = departmentRepository.findById(cmd.getDepartmentId()).orElse(null);
        }
        List<Position> positions = new ArrayList<>();
        if (cmd.getPositionIds() != null) {
            for (String pid : cmd.getPositionIds()) {
                positionRepository.findById(pid).ifPresent(positions::add);
            }
        }
        List<Role> roles = new ArrayList<>();
        if (cmd.getRoleIds() != null) {
            for (String rid : cmd.getRoleIds()) {
                roleRepository.findById(rid).ifPresent(roles::add);
            }
        }
        User user = UserFactory.create(
                cmd.getFirstName(),
                cmd.getLastName(),
                cmd.getAccount(),
                passwordEncoder.encode(cmd.getPassword()),
                cmd.getEmail(),
                cmd.getPhone(),
                cmd.getGender(),
                cmd.getAvatar(),
                cmd.getDescription(),
                cmd.getEnable(),
                dept,
                positions,
                roles
        );
        User saved = userRepository.save(user);
        return UserResponse.from(saved);
    }

    public Optional<UserResponse> update(String id, UserUpdateCommand cmd) {
        return userRepository.findById(id).map(user -> {
            if (cmd.getFirstName() != null) user.setFirstName(cmd.getFirstName());
            if (cmd.getLastName() != null) user.setLastName(cmd.getLastName());
            if (cmd.getAccount() != null) user.setAccount(cmd.getAccount());
            if (cmd.getPassword() != null) user.setPassword(passwordEncoder.encode(cmd.getPassword()));
            if (cmd.getEmail() != null) user.setEmail(cmd.getEmail());
            if (cmd.getPhone() != null) user.setPhone(cmd.getPhone());
            if (cmd.getGender() != null) user.setGender(cmd.getGender());
            if (cmd.getAvatar() != null) user.setAvatar(cmd.getAvatar());
            if (cmd.getDescription() != null) user.setDescription(cmd.getDescription());
            if (cmd.getEnable() != null) user.setEnable(cmd.getEnable());
            if (cmd.getDepartmentId() != null) {
                Department dept = departmentRepository.findById(cmd.getDepartmentId()).orElse(null);
                user.setDepartment(dept);
            }
            if (cmd.getPositionIds() != null) {
                List<Position> positions = new ArrayList<>();
                for (String pid : cmd.getPositionIds()) {
                    positionRepository.findById(pid).ifPresent(positions::add);
                }
                user.setPositions(positions);
            }
            if (cmd.getRoleIds() != null) {
            List<Role> roles = new ArrayList<>();
            for (String rid : cmd.getRoleIds()) {
                roleRepository.findById(rid).ifPresent(roles::add);
            }
            user.setRoles(roles);
        }
            User saved = userRepository.save(user);
            return UserResponse.from(saved);
        });
    }

    public void delete(String id) { userRepository.deleteById(id); }

    @Transactional(readOnly = true)
    public Page<UserResponse> findAll(Pageable pageable) { return userRepository.findAll(pageable).map(com.summer.iam.interfaces.rest.dto.user.UserResponse::from); }

    @Transactional(readOnly = true)
    public Optional<UserResponse> findById(String id) { return userRepository.findById(id).map(com.summer.iam.interfaces.rest.dto.user.UserResponse::from); }

    
}
