package com.summer.iam.application.service;

import com.summer.iam.domain.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface UserSpecificationService {
    Optional<User> findByAccount(String account);
    List<User> findByNameLike(String name);
    Page<User> findUsers(Optional<String> account,
                        Optional<String> name,
                        Optional<String> departmentId,
                        boolean onlyAvailable,
                        Pageable pageable);
    List<User> findAllAvailableUsers();
    List<User> findAvailableUsersByDepartment(String departmentId);
}
