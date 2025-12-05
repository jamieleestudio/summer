package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.UserCommandService;
import com.summer.iam.interfaces.rest.dto.user.UserCreateRequest;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import com.summer.iam.interfaces.rest.dto.user.UserUpdateRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/users")
@Tag(name = "Users")
public class UserController {

    private final UserCommandService userCommandService;

    public UserController(UserCommandService userCommandService) {
        this.userCommandService = userCommandService;
    }

    @GetMapping
    @Operation(summary = "List users (paginated)")
    public Page<UserResponse> list(Pageable pageable) {
        return userCommandService.findAll(pageable);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get user details")
    public Optional<UserResponse> get(@PathVariable("id") String id) {
        return userCommandService.findById(id);
    }

    @PostMapping
    @Operation(summary = "Create user")
    public UserResponse create(@RequestBody UserCreateRequest request) {
        return userCommandService.create(request);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update user")
    public Optional<UserResponse> update(@PathVariable("id") String id,
                                 @RequestBody UserUpdateRequest request) {
        return userCommandService.update(id, request);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete user")
    public void delete(@PathVariable("id") String id) {
        userCommandService.delete(id);
    }

    
}
