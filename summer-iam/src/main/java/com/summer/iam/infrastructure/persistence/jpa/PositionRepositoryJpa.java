package com.summer.iam.infrastructure.persistence.jpa;

import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PositionRepositoryJpa extends JpaRepository<Position, String>, PositionRepository {

}
