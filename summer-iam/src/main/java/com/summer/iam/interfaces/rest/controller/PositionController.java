package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.application.model.PositionInfo;
import com.summer.iam.application.model.PositionSummary;
import com.summer.iam.application.service.PositionService;
import com.summer.iam.interfaces.rest.assembler.PositionAssembler;
import com.summer.iam.interfaces.rest.dto.position.PositionCreateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
import com.summer.iam.interfaces.rest.dto.position.PositionUpdateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionEnabledRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/positions")
@Tag(name = "Positions")
public class PositionController {

    private final PositionService positionService;

    public PositionController(PositionService positionService) {
        this.positionService = positionService;
    }

    @GetMapping
    @Operation(summary = "List positions (paginated)")
    public Page<PositionResponse> list(Pageable pageable) {
        Page<PositionSummary> page = positionService.findAll(pageable);
        return page.map(PositionAssembler::toResponse);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get position details")
    public Optional<PositionResponse> get(@PathVariable("id") String id) {
        return positionService.findById(id).map(PositionAssembler::toResponse);
    }

    @PostMapping
    @Operation(summary = "Create position")
    public PositionResponse create(@RequestBody PositionCreateRequest request) {
        PositionCreateCommand cmd = PositionAssembler.toCreateCommand(request);
        PositionInfo info = positionService.create(cmd);
        return PositionAssembler.toResponse(info);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update position")
    public Optional<PositionResponse> update(@PathVariable("id") String id,
                                             @RequestBody PositionUpdateRequest request) {
        PositionUpdateCommand cmd = PositionAssembler.toUpdateCommand(request);
        return positionService.update(id, cmd).map(PositionAssembler::toResponse);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete position")
    public void delete(@PathVariable("id") String id) {
        positionService.delete(id);
    }

    @PutMapping("/{id}/enabled")
    @Operation(summary = "Set position enabled state")
    public Optional<PositionResponse> setEnabled(@PathVariable("id") String id,
                                                 @RequestBody PositionEnabledRequest request) {
        return positionService.setEnabled(id, request.getEnabled()).map(PositionAssembler::toResponse);
    }
}
