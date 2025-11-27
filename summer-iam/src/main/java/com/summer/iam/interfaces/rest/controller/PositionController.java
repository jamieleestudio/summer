package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.PositionQueryService;
import com.summer.iam.application.service.PositionCommandService;
import com.summer.iam.interfaces.rest.dto.position.PositionCreateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
import com.summer.iam.interfaces.rest.dto.position.PositionUpdateRequest;
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

    private final PositionQueryService positionQueryService;
    private final PositionCommandService positionCommandService;

    public PositionController(PositionQueryService positionQueryService,
                              PositionCommandService positionCommandService) {
        this.positionQueryService = positionQueryService;
        this.positionCommandService = positionCommandService;
    }

    @GetMapping
    @Operation(summary = "List positions (paginated)")
    public Page<PositionResponse> list(Pageable pageable) {
        return positionQueryService.findAll(pageable);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get position details")
    public Optional<PositionResponse> get(@PathVariable("id") String id) {
        return positionQueryService.findById(id);
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
}