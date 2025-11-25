package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.infrastructure.persistence.entity.DepartmentEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemDepartmentRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
public class DepartmentRepositoryJpaAdapter implements DepartmentRepository {
    private final SystemDepartmentRepository repository;
    private final DepartmentEntityAdapter adapter;

    public DepartmentRepositoryJpaAdapter(SystemDepartmentRepository repository, DepartmentEntityAdapter adapter) {
        this.repository = repository;
        this.adapter = adapter;
    }

    @Override
    public Optional<Department> findById(String id) {
        try {
            return repository.findById(Long.parseLong(id)).map(adapter::toDomain);
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }

    @Override
    public List<Department> findAll() {
        return repository.findAll().stream().map(adapter::toDomain).collect(Collectors.toList());
    }

    @Override
    public Department save(Department department) {
        DepartmentEntity entity = adapter.toEntity(department);
        return adapter.toDomain(repository.save(entity));
    }

    @Override
    public void deleteById(String id) {
        try {
            repository.deleteById(Long.parseLong(id));
        } catch (NumberFormatException ignored) {}
    }
}
