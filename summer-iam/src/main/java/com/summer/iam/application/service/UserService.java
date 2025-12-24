package com.summer.iam.application.service;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.application.query.UserPageQuery;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface UserService {
    UserResponse create(UserCreateCommand cmd);
    Optional<UserResponse> update(String id, UserUpdateCommand cmd);
    void delete(String id);
    Page<UserResponse> findAll(Pageable pageable);
    Optional<UserResponse> findById(String id);
    void setEnabled(String id, Boolean enabled);
    Page<UserResponse> search(UserPageQuery query, Pageable pageable);
}
