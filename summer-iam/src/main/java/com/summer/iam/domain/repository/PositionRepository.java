package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Position;

import java.util.List;
import java.util.Optional;

public interface PositionRepository {
    Optional<Position> findById(String id);
    List<Position> findAll();
    List<Position> findAllByDepartmentId(String departmentId);
    Position save(Position position);
    void deleteById(String id);
}
