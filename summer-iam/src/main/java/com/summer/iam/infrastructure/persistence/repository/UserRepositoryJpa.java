package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.UserRepository;
import org.springframework.data.repository.CrudRepository;

public interface UserRepositoryJpa extends CrudRepository<User, String>, UserRepository {
}
