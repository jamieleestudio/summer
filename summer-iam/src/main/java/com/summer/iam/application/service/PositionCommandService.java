package com.summer.iam.application.service;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

@Service
@Transactional
public class PositionCommandService {
    private final PositionRepository positionRepository;
    public PositionCommandService(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }

    public PositionResponse create(PositionCreateCommand cmd) {
        Position p = new Position();
        p.setName(cmd.getName());
        p.setCode(cmd.getCode());
        p.setType(cmd.getType());
        p.setDescription(cmd.getDescription());
        p.setSort(cmd.getSort());
        p.setEnabled(cmd.getEnabled() != null ? cmd.getEnabled() : true);
        Position saved = positionRepository.save(p);
        return toResponse(saved);
    }

    public Optional<PositionResponse> update(String id, PositionUpdateCommand cmd) {
        return positionRepository.findById(id).map(p -> {
            if (cmd.getName() != null) p.setName(cmd.getName());
            if (cmd.getCode() != null) p.setCode(cmd.getCode());
            if (cmd.getType() != null) p.setType(cmd.getType());
            if (cmd.getDescription() != null) p.setDescription(cmd.getDescription());
            if (cmd.getSort() != null) p.setSort(cmd.getSort());
            if (cmd.getEnabled() != null) {
                p.setEnabled(cmd.getEnabled());
            }
            Position saved = positionRepository.save(p);
            return toResponse(saved);
        });
    }

    public void delete(String id) {
        positionRepository.deleteById(id);
    }

    public Optional<PositionResponse> setEnabled(String id, Boolean enabled) {
        return positionRepository.findById(id).map(p -> {
            p.setEnabled(enabled);
            Position saved = positionRepository.save(p);
            return toResponse(saved);
        });
    }

    @Transactional(readOnly = true)
    public Page<PositionResponse> findAll(Pageable pageable) {
        return positionRepository.findAll(pageable).map(this::toResponse);
    }

    @Transactional(readOnly = true)
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
        r.setEnabled(p.getEnabled());
        return r;
    }
}
