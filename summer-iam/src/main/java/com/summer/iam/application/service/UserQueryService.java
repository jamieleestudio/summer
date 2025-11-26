package com.summer.iam.application.service;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserQueryService {
    private final UserRepository userRepository;

    public UserQueryService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Page<UserResponse> findAll(Pageable pageable) {
        return userRepository.findAll(pageable).map(this::toResponse);
    }

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
        if (u.getPosition() != null) {
            r.setPositionId(u.getPosition().getId());
            r.setPositionName(u.getPosition().getName());
        }
        return r;
    }
}
