package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Role;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;

public interface RoleRepository {

    Optional<Role> findById(String id);

    Optional<Role> findByName(String name);

    List<Role> findAll();

    Page<Role> findAll(Pageable pageable);

    Role save(Role role);

    void deleteById(String id);

}
