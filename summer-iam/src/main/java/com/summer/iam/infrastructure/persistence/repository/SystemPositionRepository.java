package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.PositionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemPositionRepository extends JpaRepository<PositionEntity, Long> {
    List<PositionEntity> findAllByDepartmentId(Long departmentId);
}
