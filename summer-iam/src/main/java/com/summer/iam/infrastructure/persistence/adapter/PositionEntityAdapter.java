package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Position;
import com.summer.iam.infrastructure.persistence.entity.PositionEntity;
import org.springframework.stereotype.Component;

@Component
public class PositionEntityAdapter {
    public Position toDomain(PositionEntity entity) {
        if (entity == null) return null;
        Position p = new Position();
        p.setId(entity.getId() == null ? null : String.valueOf(entity.getId()));
        p.setName(entity.getName());
        p.setCode(entity.getCode());
        p.setDepartmentId(entity.getDepartmentId() == null ? null : String.valueOf(entity.getDepartmentId()));
        p.setType(entity.getType());
        p.setDescription(entity.getDescription());
        p.setSort(entity.getSort());
        return p;
    }

    public PositionEntity toEntity(Position position) {
        if (position == null) return null;
        PositionEntity e = new PositionEntity();
        e.setName(position.getName());
        e.setCode(position.getCode());
        e.setDepartmentId(position.getDepartmentId() == null ? null : Long.parseLong(position.getDepartmentId()));
        e.setType(position.getType());
        e.setDescription(position.getDescription());
        e.setSort(position.getSort());
        return e;
    }
}
