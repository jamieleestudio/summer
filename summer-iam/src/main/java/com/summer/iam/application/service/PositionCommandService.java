package com.summer.iam.application.service;

import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.interfaces.rest.dto.position.PositionCreateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
import com.summer.iam.interfaces.rest.dto.position.PositionUpdateRequest;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PositionCommandService {
    private final PositionRepository positionRepository;
    public PositionCommandService(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }

    public PositionResponse create(PositionCreateRequest req) {
        Position p = new Position();
        p.setName(req.getName());
        p.setCode(req.getCode());
        p.setType(req.getType());
        p.setDescription(req.getDescription());
        p.setSort(req.getSort());
        Position saved = positionRepository.save(p);
        return toResponse(saved);
    }

    public Optional<PositionResponse> update(String id, PositionUpdateRequest req) {
        return positionRepository.findById(id).map(p -> {
            p.setName(req.getName());
            p.setCode(req.getCode());
            p.setType(req.getType());
            p.setDescription(req.getDescription());
            p.setSort(req.getSort());
            Position saved = positionRepository.save(p);
            return toResponse(saved);
        });
    }

    public void delete(String id) {
        positionRepository.deleteById(id);
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
