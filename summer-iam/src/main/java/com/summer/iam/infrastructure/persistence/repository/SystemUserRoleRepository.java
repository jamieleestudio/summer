package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.UserRoleEntity;
import com.summer.iam.infrastructure.persistence.entity.UserRoleId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemUserRoleRepository extends JpaRepository<UserRoleEntity, UserRoleId> {
    List<UserRoleEntity> findAllByUserId(Long userId);
}
