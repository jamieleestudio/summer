package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Department;
import com.summer.iam.infrastructure.persistence.entity.DepartmentEntity;
import org.springframework.stereotype.Component;

@Component
public class DepartmentEntityAdapter {
    public Department toDomain(DepartmentEntity entity) {
        if (entity == null) return null;
        Department d = new Department();
        d.setId(entity.getId() == null ? null : String.valueOf(entity.getId()));
        d.setPid(entity.getPid() == null ? null : String.valueOf(entity.getPid()));
        d.setName(entity.getName());
        d.setIcon(entity.getIcon());
        d.setRoot(Boolean.TRUE.equals(entity.getIsRoot()));
        d.setCode(entity.getCode());
        d.setSort(entity.getSort());
        return d;
    }

    public DepartmentEntity toEntity(Department department) {
        if (department == null) return null;
        DepartmentEntity e = new DepartmentEntity();
        e.setPid(department.getPid() == null ? null : Long.parseLong(department.getPid()));
        e.setName(department.getName());
        e.setIcon(department.getIcon());
        e.setIsRoot(Boolean.TRUE.equals(department.getRoot()));
        e.setCode(department.getCode());
        e.setSort(department.getSort());
        return e;
    }
}
