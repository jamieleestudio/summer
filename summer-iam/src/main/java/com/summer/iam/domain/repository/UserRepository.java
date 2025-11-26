package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.User;

import java.util.Optional;

public interface UserRepository {

    Optional<User> findByAccount(String username);

}
