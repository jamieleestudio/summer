package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.service.OrganizationService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/org/departments")
public class DepartmentController {

    private final OrganizationService organizationService;

    public DepartmentController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('PERM_DEPT_READ') or hasRole('ADMIN')")
    public List<Department> list() {
        return organizationService.listDepartments();
    }

    @GetMapping("/tree")
    @PreAuthorize("hasAuthority('PERM_DEPT_READ') or hasRole('ADMIN')")
    public List<OrganizationService.DepartmentNode> tree() {
        return organizationService.departmentTree();
    }

    @PostMapping
    @PreAuthorize("hasAuthority('PERM_DEPT_CREATE') or hasRole('ADMIN')")
    public Department create(@RequestBody Department input) {
        return organizationService.createDepartment(input);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('PERM_DEPT_UPDATE') or hasRole('ADMIN')")
    public ResponseEntity<Department> update(@PathVariable String id, @RequestBody Department input) {
        return organizationService.updateDepartment(id, input)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('PERM_DEPT_DELETE') or hasRole('ADMIN')")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        organizationService.deleteDepartment(id);
        return ResponseEntity.noContent().build();
    }

}
