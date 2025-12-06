package com.summer.iam.domain.model;

import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.domain.repository.RoleRepository;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public final class UserFactory {
    private final DepartmentRepository departmentRepository;
    private final PositionRepository positionRepository;
    private final RoleRepository roleRepository;

    public UserFactory(DepartmentRepository departmentRepository,
                       PositionRepository positionRepository,
                       RoleRepository roleRepository) {
        this.departmentRepository = departmentRepository;
        this.positionRepository = positionRepository;
        this.roleRepository = roleRepository;
    }

    public User create(
            Username username,
            String account,
            String encodedPassword,
            String email,
            String phone,
            Integer gender,
            String avatar,
            String description,
            UserStatus status,
            String departmentId,
            List<String> positionIds,
            List<String> roleIds
    ) {
        User user = new User();
        user.setUsername(username);
        user.setAccount(account);
        user.setPassword(encodedPassword);
        user.setEmail(email);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAvatar(avatar);
        user.setDescription(description);
        user.setStatus(status);
        populateRelations(user, departmentId, positionIds, roleIds);
        return user;
    }

    public void populateRelations(
            User user,
            String departmentId,
            List<String> positionIds,
            List<String> roleIds
    ) {
        if (departmentId != null) {
            Department dept = departmentRepository.findById(departmentId).orElse(null);
            user.setDepartment(dept);
        }else{
            user.setDepartment(null);
        }

        if (positionIds != null) {
            user.setPositions(positionRepository.findByIds(positionIds));
        }else{
            user.setPositions(null);    
        }

        if (roleIds != null) {
            user.setRoles(roleRepository.findByIds(roleIds));
        }else{
            user.setRoles(null);        
        }
    }
}
