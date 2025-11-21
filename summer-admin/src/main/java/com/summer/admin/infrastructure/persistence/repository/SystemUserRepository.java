package com.summer.admin.infrastructure.persistence.repository;

import com.summer.admin.infrastructure.persistence.entity.SystemUserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * System User Repository
 */
@Repository
public interface SystemUserRepository extends JpaRepository<SystemUserEntity, String> {
    
    /**
     * Find user by account
     * @param account user account
     * @return Optional<SystemUserEntity>
     */
    Optional<SystemUserEntity> findByAccount(String account);
}
