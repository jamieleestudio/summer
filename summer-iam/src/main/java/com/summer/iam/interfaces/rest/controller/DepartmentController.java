package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.command.DepartmentCreateCommand;
import com.summer.iam.application.command.DepartmentUpdateCommand;
import com.summer.iam.application.service.DepartmentService;
import com.summer.iam.interfaces.rest.assembler.DepartmentAssembler;
import com.summer.iam.interfaces.rest.dto.department.DepartmentCreateRequest;
import com.summer.iam.interfaces.rest.dto.department.DepartmentResponse;
import com.summer.iam.interfaces.rest.dto.department.DepartmentUpdateRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/departments")
@Tag(name = "Departments")
public class DepartmentController {

    private final DepartmentService departmentService;

    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @GetMapping
    @Operation(summary = "List departments")
    public List<DepartmentResponse> list() {
        return departmentService.findAll();
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get department details")
    public Optional<DepartmentResponse> get(@PathVariable("id") String id) {
        return departmentService.findById(id);
    }

    @PostMapping
    @Operation(summary = "Create department")
    public DepartmentResponse create(@RequestBody DepartmentCreateRequest request) {
        DepartmentCreateCommand cmd = DepartmentAssembler.toCreateCommand(request);
        return departmentService.create(cmd);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update department")
    public Optional<DepartmentResponse> update(@PathVariable("id") String id,
                                               @RequestBody DepartmentUpdateRequest request) {
        DepartmentUpdateCommand cmd = DepartmentAssembler.toUpdateCommand(request);
        return departmentService.update(id, cmd);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete department")
    public void delete(@PathVariable("id") String id) {
        departmentService.delete(id);
    }
}
