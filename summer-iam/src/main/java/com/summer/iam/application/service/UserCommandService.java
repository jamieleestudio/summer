package com.summer.iam.application.service;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.interfaces.rest.dto.user.UserCreateRequest;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import com.summer.iam.interfaces.rest.dto.user.UserUpdateRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    public UserResponse create(UserCreateRequest req) {
        if (userRepository.findByAccount(req.getAccount()).isPresent()) {
            throw new IllegalArgumentException("账号已存在: " + req.getAccount());
        }
        User user = new User();
        user.setFirstName(req.getFirstName());
        user.setLastName(req.getLastName());
        user.setAccount(req.getAccount());
        user.setPassword(passwordEncoder.encode(req.getPassword()));
        user.setEmail(req.getEmail());
        user.setPhone(req.getPhone());
        user.setGender(req.getGender());
        user.setAvatar(req.getAvatar());
        user.setDescription(req.getDescription());
        user.setEnable(req.getEnable());
        if (req.getDepartmentId() != null) {
            departmentRepository.findById(req.getDepartmentId()).ifPresent(user::setDepartment);
        }
        if (req.getPositionIds() != null) {
            List<com.summer.iam.domain.model.Position> positions = new ArrayList<>();
            for (String pid : req.getPositionIds()) {
                positionRepository.findById(pid).ifPresent(positions::add);
            }
            user.setPositions(positions);
        }
        if (req.getRoleIds() != null) {
            List<com.summer.iam.domain.model.Role> roles = new ArrayList<>();
            for (String rid : req.getRoleIds()) {
                roleRepository.findById(rid).ifPresent(roles::add);
            }
            user.setRoles(roles);
        }
        User saved = userRepository.save(user);
        return toResponse(saved);
    }

    public Optional<UserResponse> update(String id, UserUpdateRequest req) {
        return userRepository.findById(id).map(user -> {
            if (req.getFirstName() != null) user.setFirstName(req.getFirstName());
            if (req.getLastName() != null) user.setLastName(req.getLastName());
            if (req.getAccount() != null) user.setAccount(req.getAccount());
            if (req.getPassword() != null) user.setPassword(passwordEncoder.encode(req.getPassword()));
            if (req.getEmail() != null) user.setEmail(req.getEmail());
            if (req.getPhone() != null) user.setPhone(req.getPhone());
            if (req.getGender() != null) user.setGender(req.getGender());
            if (req.getAvatar() != null) user.setAvatar(req.getAvatar());
            if (req.getDescription() != null) user.setDescription(req.getDescription());
            if (req.getEnable() != null) user.setEnable(req.getEnable());
            if (req.getDepartmentId() != null) {
                Department dept = departmentRepository.findById(req.getDepartmentId()).orElse(null);
                user.setDepartment(dept);
            }
            if (req.getPositionIds() != null) {
                List<Position> positions = new ArrayList<>();
                for (String pid : req.getPositionIds()) {
                    positionRepository.findById(pid).ifPresent(positions::add);
                }
                user.setPositions(positions);
            }
            if (req.getRoleIds() != null) {
                List<com.summer.iam.domain.model.Role> roles = new ArrayList<>();
                for (String rid : req.getRoleIds()) {
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
