package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.PositionCommandService;
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

    private final PositionCommandService positionCommandService;

    public PositionController(PositionCommandService positionCommandService) {
        this.positionCommandService = positionCommandService;
    }

    @GetMapping
    @Operation(summary = "List positions (paginated)")
    public Page<PositionResponse> list(Pageable pageable) {
        return positionCommandService.findAll(pageable);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get position details")
    public Optional<PositionResponse> get(@PathVariable("id") String id) {
        return positionCommandService.findById(id);
    }

    @PostMapping
    @Operation(summary = "Create position")
    public PositionResponse create(@RequestBody PositionCreateRequest request) {
        return positionCommandService.create(request);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update position")
    public Optional<PositionResponse> update(@PathVariable("id") String id,
                                             @RequestBody PositionUpdateRequest request) {
        return positionCommandService.update(id, request);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete position")
    public void delete(@PathVariable("id") String id) {
        positionCommandService.delete(id);
    }

    @PutMapping("/{id}/enabled")
    @Operation(summary = "Set position enabled state")
    public Optional<PositionResponse> setEnabled(@PathVariable("id") String id,
                                                 @RequestBody PositionEnabledRequest request) {
        return positionCommandService.setEnabled(id, request.getEnabled());
    }
}
