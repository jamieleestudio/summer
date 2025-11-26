package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Position;

import java.util.List;
import java.util.Optional;

public interface PositionRepository {

    List<Position> findAll();

    Optional<Position> findById(String id);

    Position save(Position position);

    void deleteById(String id);
}
