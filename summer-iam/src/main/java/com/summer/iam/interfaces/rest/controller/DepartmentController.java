package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.DepartmentCommandService;
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

    private final DepartmentCommandService departmentCommandService;

    public DepartmentController(DepartmentCommandService departmentCommandService) {
        this.departmentCommandService = departmentCommandService;
    }

    @GetMapping
    @Operation(summary = "List departments")
    public List<DepartmentResponse> list() {
        return departmentCommandService.findAll();
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get department details")
    public Optional<DepartmentResponse> get(@PathVariable("id") String id) {
        return departmentCommandService.findById(id);
    }

    @PostMapping
    @Operation(summary = "Create department")
    public DepartmentResponse create(@RequestBody DepartmentCreateRequest request) {
        return departmentCommandService.create(request);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update department")
    public Optional<DepartmentResponse> update(@PathVariable("id") String id,
                                               @RequestBody DepartmentUpdateRequest request) {
        return departmentCommandService.update(id, request);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete department")
    public void delete(@PathVariable("id") String id) {
        departmentCommandService.delete(id);
    }
}
