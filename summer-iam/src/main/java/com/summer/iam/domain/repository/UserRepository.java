package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.User;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;

public interface UserRepository {

    Optional<User> findByAccount(String username);

    List<User> findAll();

    Page<User> findAll(Pageable pageable);

    Optional<User> findById(String id);

    User save(User user);

    void deleteById(String id);

}
