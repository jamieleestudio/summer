package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.infrastructure.persistence.entity.PositionEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemPositionRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class PositionRepositoryJpaAdapter implements PositionRepository {
    private final SystemPositionRepository repository;
    private final PositionEntityAdapter adapter;

    public PositionRepositoryJpaAdapter(SystemPositionRepository repository, PositionEntityAdapter adapter) {
        this.repository = repository;
        this.adapter = adapter;
    }

    @Override
    public Optional<Position> findById(String id) {
        try {
            return repository.findById(Long.parseLong(id)).map(adapter::toDomain);
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }

    @Override
    public List<Position> findAll() {
        return repository.findAll().stream().map(adapter::toDomain).collect(Collectors.toList());
    }

    @Override
    public List<Position> findAllByDepartmentId(String departmentId) {
        try {
            Long depId = Long.parseLong(departmentId);
            return repository.findAllByDepartmentId(depId).stream().map(adapter::toDomain).collect(Collectors.toList());
        } catch (NumberFormatException e) {
            return List.of();
        }
    }

    @Override
    public Position save(Position position) {
        PositionEntity entity = adapter.toEntity(position);
        return adapter.toDomain(repository.save(entity));
    }

    @Override
    public void deleteById(String id) {
        try {
            repository.deleteById(Long.parseLong(id));
        } catch (NumberFormatException ignored) {}
    }
}
