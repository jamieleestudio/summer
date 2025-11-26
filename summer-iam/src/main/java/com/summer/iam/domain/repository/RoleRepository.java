package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Role;

import java.util.List;
import java.util.Optional;

public interface RoleRepository {

    Optional<Role> findById(String id);

    Optional<Role> findByName(String name);

    List<Role> findAll();

    Role saveRole(Role role);

    void deleteById(String id);

}
