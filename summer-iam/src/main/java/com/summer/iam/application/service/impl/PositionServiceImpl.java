package com.summer.iam.application.service.impl;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.application.model.PositionInfo;
import com.summer.iam.application.model.PositionSummary;
import com.summer.iam.application.service.PositionService;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.PositionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

@Service
@Transactional
public class PositionServiceImpl implements PositionService {
    private final PositionRepository positionRepository;
    public PositionServiceImpl(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }

    @Override
    public PositionInfo create(PositionCreateCommand cmd) {
        Position p = new Position();
        p.setName(cmd.getName());
        p.setCode(cmd.getCode());
        p.setType(cmd.getType());
        p.setDescription(cmd.getDescription());
        p.setSort(cmd.getSort());
        p.setEnabled(cmd.getEnabled());
        Position saved = positionRepository.save(p);
        return PositionInfo.from(saved);
    }

    @Override
    public Optional<PositionInfo> update(String id, PositionUpdateCommand cmd) {
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
            return PositionInfo.from(saved);
        });
    }

    @Override
    public void delete(String id) {
        positionRepository.deleteById(id);
    }

    @Override
    public Optional<PositionInfo> setEnabled(String id, Boolean enabled) {
        return positionRepository.findById(id).map(p -> {
            p.setEnabled(enabled);
            Position saved = positionRepository.save(p);
            return PositionInfo.from(saved);
        });
    }

    @Override
    @Transactional(readOnly = true)
    public Page<PositionSummary> findAll(Pageable pageable) {
        return positionRepository.findAll(pageable).map(PositionSummary::from);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<PositionInfo> findById(String id) {
        return positionRepository.findById(id).map(PositionInfo::from);
    }
}
