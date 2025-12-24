package com.summer.iam.application.service;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.application.model.PositionInfo;
import com.summer.iam.application.model.PositionSummary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

public interface PositionService {
    PositionInfo create(PositionCreateCommand cmd);
    Optional<PositionInfo> update(String id, PositionUpdateCommand cmd);
    void delete(String id);
    Optional<PositionInfo> setEnabled(String id, Boolean enabled);
    Page<PositionSummary> findAll(Pageable pageable);
    Optional<PositionInfo> findById(String id);
}
