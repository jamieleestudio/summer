package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.service.OrganizationService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/org/positions")
public class PositionController {

    private final OrganizationService organizationService;

    public PositionController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GetMapping
    @PreAuthorize("hasAuthority('PERM_POS_READ') or hasRole('ADMIN')")
    public List<Position> list(@RequestParam(required = false) String departmentId) {
        return organizationService.listPositions(departmentId);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('PERM_POS_CREATE') or hasRole('ADMIN')")
    public Position create(@RequestBody Position input) {
        return organizationService.createPosition(input);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('PERM_POS_UPDATE') or hasRole('ADMIN')")
    public ResponseEntity<Position> update(@PathVariable String id, @RequestBody Position input) {
        return organizationService.updatePosition(id, input)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('PERM_POS_DELETE') or hasRole('ADMIN')")
    public ResponseEntity<Void> delete(@PathVariable String id) {
        organizationService.deletePosition(id);
        return ResponseEntity.noContent().build();
    }
}
