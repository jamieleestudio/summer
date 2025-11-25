package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.repository.UserRepository;
import com.summer.iam.infrastructure.persistence.entity.UserEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemUserRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
public class UserRepositoryJpaAdapter implements UserRepository {

    private final SystemUserRepository systemUserRepository;
    private final UserEntityAdapter userEntityAdapter;

    public UserRepositoryJpaAdapter(SystemUserRepository systemUserRepository,
                                    UserEntityAdapter userEntityAdapter) {
        this.systemUserRepository = systemUserRepository;
        this.userEntityAdapter = userEntityAdapter;
    }

    @Override
    public Optional<User> findById(String id) {
        try {
            Long longId = Long.parseLong(id);
            return systemUserRepository.findById(longId).map(userEntityAdapter::toDomain);
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }

    @Override
    public Optional<User> findByAccount(String account) {
        return systemUserRepository.findByAccount(account).map(userEntityAdapter::toDomain);
    }

    @Override
    public Optional<User> findByEmail(String email) {
        // not implemented in JPA repository, return empty
        return Optional.empty();
    }

    @Override
    public Optional<User> findByPhone(String phone) {
        // not implemented in JPA repository, return empty
        return Optional.empty();
    }

    @Override
    public List<User> findAllAvailable() {
        // simplistic: map all users; filtering can be added
        return systemUserRepository.findAll().stream()
                .map(userEntityAdapter::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public List<User> findAll() {
        return systemUserRepository.findAll().stream()
                .map(userEntityAdapter::toDomain)
                .collect(Collectors.toList());
    }

    @Override
    public User save(User user) {
        UserEntity entity = userEntityAdapter.toEntity(user);
        UserEntity saved = systemUserRepository.save(entity);
        return userEntityAdapter.toDomain(saved);
    }

    @Override
    public List<User> saveAll(List<User> users) {
        List<UserEntity> entities = users.stream().map(userEntityAdapter::toEntity).collect(Collectors.toList());
        return systemUserRepository.saveAll(entities).stream().map(userEntityAdapter::toDomain).collect(Collectors.toList());
    }

    @Override
    public void delete(User user) {
        // soft delete marking is in domain; persist current entity state
        findById(user.getId()).ifPresent(u -> systemUserRepository.delete(userEntityAdapter.toEntity(u)));
    }

    @Override
    public void deleteById(String id) {
        try {
            systemUserRepository.deleteById(Long.parseLong(id));
        } catch (NumberFormatException ignored) { }
    }

    @Override
    public boolean existsById(String id) {
        try {
            return systemUserRepository.existsById(Long.parseLong(id));
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    public boolean existsByAccount(String account) {
        return systemUserRepository.findByAccount(account).isPresent();
    }

    @Override
    public boolean existsByEmail(String email) {
        // not implemented
        return false;
    }

    @Override
    public boolean existsByPhone(String phone) {
        // not implemented
        return false;
    }
}
