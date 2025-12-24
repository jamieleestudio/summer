package com.summer.iam.application.service.impl;

import java.util.List;
import java.util.Optional;

import com.summer.iam.application.service.UserSpecificationService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.summer.iam.domain.model.User;
import com.summer.iam.infrastructure.persistence.jpa.UserRepositoryJpa;
import com.summer.iam.infrastructure.persistence.jpa.specification.UserSpecification;

@Service
public class UserSpecificationServiceImpl implements UserSpecificationService {

    private final UserRepositoryJpa userRepositoryJpa;

    public UserSpecificationServiceImpl(UserRepositoryJpa userRepositoryJpa) {
        this.userRepositoryJpa = userRepositoryJpa;
    }

    @Override
    public Optional<User> findByAccount(String account) {
        return userRepositoryJpa.findOne(UserSpecification.withAccount(account));
    }

    @Override
    public List<User> findByNameLike(String name) {
        return userRepositoryJpa.findAll(UserSpecification.withNameLike(name));
    }

    @Override
    public Page<User> findUsers(Optional<String> account,
                               Optional<String> name,
                               Optional<String> phone,
                               Optional<String> departmentId,
                               Optional<Boolean> enabled,
                               Pageable pageable) {
        return userRepositoryJpa.findAll(
                UserSpecification.getUserSpecification(account, name, phone, departmentId, enabled),
                pageable
        );
    }

    @Override
    public List<User> findAllAvailableUsers() {
        return userRepositoryJpa.findAll(UserSpecification.availableUsers());
    }

    @Override
    public List<User> findAvailableUsersByDepartment(String departmentId) {
        return userRepositoryJpa.findAll(
                UserSpecification.withDepartmentId(departmentId)
                        .and(UserSpecification.availableUsers())
        );
    }
}
