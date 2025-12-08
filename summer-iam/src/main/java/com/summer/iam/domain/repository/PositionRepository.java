package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Position;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PositionRepository {

    List<Position> findAll();

    Page<Position> findAll(Pageable pageable);

    Optional<Position> findById(String id);

    List<Position> findByIdIn(List<String> ids);

    Position save(Position position);

    void deleteById(String id);
}
