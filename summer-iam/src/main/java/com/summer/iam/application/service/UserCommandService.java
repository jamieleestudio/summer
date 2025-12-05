package com.summer.iam.application.service;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.model.User;
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
public class UserCommandService {

    private final UserRepository userRepository;
    private final DepartmentRepository departmentRepository;
    private final PositionRepository positionRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;

    public UserCommandService(UserRepository userRepository,
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
        User user = new User();
        user.setFirstName(cmd.getFirstName());
        user.setLastName(cmd.getLastName());
        user.setAccount(cmd.getAccount());
        user.setPassword(passwordEncoder.encode(cmd.getPassword()));
        user.setEmail(cmd.getEmail());
        user.setPhone(cmd.getPhone());
        user.setGender(cmd.getGender());
        user.setAvatar(cmd.getAvatar());
        user.setDescription(cmd.getDescription());
        user.setEnable(cmd.getEnable());
        if (cmd.getDepartmentId() != null) {
            departmentRepository.findById(cmd.getDepartmentId()).ifPresent(user::setDepartment);
        }
        if (cmd.getPositionIds() != null) {
            List<com.summer.iam.domain.model.Position> positions = new ArrayList<>();
            for (String pid : cmd.getPositionIds()) {
                positionRepository.findById(pid).ifPresent(positions::add);
            }
            user.setPositions(positions);
        }
        if (cmd.getRoleIds() != null) {
            List<com.summer.iam.domain.model.Role> roles = new ArrayList<>();
            for (String rid : cmd.getRoleIds()) {
                roleRepository.findById(rid).ifPresent(roles::add);
            }
            user.setRoles(roles);
        }
        User saved = userRepository.save(user);
        return toResponse(saved);
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
                List<com.summer.iam.domain.model.Role> roles = new ArrayList<>();
                for (String rid : cmd.getRoleIds()) {
                    roleRepository.findById(rid).ifPresent(roles::add);
                }
                user.setRoles(roles);
            }
            User saved = userRepository.save(user);
            return toResponse(saved);
        });
    }

    public void delete(String id) {
        userRepository.deleteById(id);
    }

    @Transactional(readOnly = true)
    public Page<UserResponse> findAll(Pageable pageable) {
        return userRepository.findAll(pageable).map(this::toResponse);
    }

    @Transactional(readOnly = true)
    public Optional<UserResponse> findById(String id) {
        return userRepository.findById(id).map(this::toResponse);
    }

    private UserResponse toResponse(User u) {
        UserResponse r = new UserResponse();
        r.setId(u.getId());
        r.setFirstName(u.getFirstName());
        r.setLastName(u.getLastName());
        r.setAccount(u.getAccount());
        r.setEmail(u.getEmail());
        r.setPhone(u.getPhone());
        r.setGender(u.getGender());
        r.setAvatar(u.getAvatar());
        r.setDescription(u.getDescription());
        r.setEnable(u.getEnable());
        if (u.getDepartment() != null) {
            r.setDepartmentId(u.getDepartment().getId());
            r.setDepartmentName(u.getDepartment().getName());
        }
        if (u.getPositions() != null) {
            List<String> pids = new ArrayList<>();
            List<String> pnames = new ArrayList<>();
            for (Position p : u.getPositions()) {
                pids.add(p.getId());
                pnames.add(p.getName());
            }
            r.setPositionIds(pids);
            r.setPositionNames(pnames);
        }
        if (u.getRoles() != null) {
            List<String> rids = new ArrayList<>();
            List<String> rnames = new ArrayList<>();
            for (com.summer.iam.domain.model.Role role : u.getRoles()) {
                rids.add(role.getId());
                rnames.add(role.getName());
            }
            r.setRoleIds(rids);
            r.setRoleNames(rnames);
        }
        return r;
    }
}
