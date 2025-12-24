package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.application.service.UserService;
import com.summer.iam.interfaces.rest.assembler.UserAssembler;
import com.summer.iam.interfaces.rest.dto.user.UserCreateRequest;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import com.summer.iam.interfaces.rest.dto.user.UserUpdateRequest;
import com.summer.iam.interfaces.rest.dto.user.UserEnabledRequest;
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

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    @Operation(summary = "List users (paginated)")
    public Page<UserResponse> list(Pageable pageable) {
        return userService.findAll(pageable);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get user details")
    public Optional<UserResponse> get(@PathVariable("id") String id) {
        return userService.findById(id);
    }

    @PostMapping
    @Operation(summary = "Create user")
    public UserResponse create(@RequestBody UserCreateRequest request) {
        UserCreateCommand cmd = UserAssembler.toCreateCommand(request);
        return userService.create(cmd);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update user")
    public Optional<UserResponse> update(@PathVariable("id") String id,
                                 @RequestBody UserUpdateRequest request) {
        UserUpdateCommand cmd = UserAssembler.toUpdateCommand(request);
        return userService.update(id, cmd);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete user")
    public void delete(@PathVariable("id") String id) {
        userService.delete(id);
    }

    @PutMapping("/{id}/enabled")
    @Operation(summary = "Set user enabled state")
    public void setEnabled(@PathVariable("id") String id,
                           @RequestBody UserEnabledRequest request) {
        userService.setEnabled(id, request.getEnabled());
    }

    
}
