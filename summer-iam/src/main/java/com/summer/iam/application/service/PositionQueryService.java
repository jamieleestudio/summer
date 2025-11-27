package com.summer.iam.application.service;

import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PositionQueryService {
    private final PositionRepository positionRepository;

    public PositionQueryService(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }

    public Page<PositionResponse> findAll(Pageable pageable) {
        return positionRepository.findAll(pageable).map(this::toResponse);
    }

    public Optional<PositionResponse> findById(String id) {
        return positionRepository.findById(id).map(this::toResponse);
    }

    private PositionResponse toResponse(Position p) {
        PositionResponse r = new PositionResponse();
        r.setId(p.getId());
        r.setName(p.getName());
        r.setCode(p.getCode());
        r.setType(p.getType());
        r.setDescription(p.getDescription());
        r.setSort(p.getSort());
        return r;
    }
}
