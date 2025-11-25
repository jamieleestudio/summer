package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * System User Repository
 */
@Repository
public interface SystemUserRepository extends JpaRepository<UserEntity, Long> {
    
    /**
     * Find user by account
     * @param account user account
     * @return Optional<SystemUserEntity>
     */
    Optional<UserEntity> findByAccount(String account);
}
