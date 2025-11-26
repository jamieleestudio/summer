package com.summer.iam.infrastructure.persistence.jpa;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.UserRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface UserRepositoryJpa extends JpaRepository<User, String>, UserRepository, JpaSpecificationExecutor<User> {
}
