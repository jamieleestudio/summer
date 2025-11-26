package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.RoleRepository;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepositoryJpa extends CrudRepository<Role, String>,RoleRepository {

    default Role saveRole(final Role role){
        return save(role);
    }

}
