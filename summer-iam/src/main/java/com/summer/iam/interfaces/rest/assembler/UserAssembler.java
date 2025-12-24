package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.application.model.UserInfo;
import com.summer.iam.interfaces.rest.dto.user.UserCreateRequest;
import com.summer.iam.interfaces.rest.dto.user.UserResponse;
import com.summer.iam.interfaces.rest.dto.user.UserUpdateRequest;

public final class UserAssembler {
    private UserAssembler() {}

    public static UserCreateCommand toCreateCommand(UserCreateRequest req) {
        UserCreateCommand cmd = new UserCreateCommand();
        cmd.setFirstName(req.getFirstName());
        cmd.setLastName(req.getLastName());
        cmd.setAccount(req.getAccount());
        cmd.setPassword(req.getPassword());
        cmd.setEmail(req.getEmail());
        cmd.setPhone(req.getPhone());
        cmd.setGender(req.getGender());
        cmd.setAvatar(req.getAvatar());
        cmd.setDescription(req.getDescription());
        cmd.setEnable(req.getEnable());
        cmd.setDepartmentId(req.getDepartmentId());
        cmd.setPositionIds(req.getPositionIds());
        cmd.setRoleIds(req.getRoleIds());
        return cmd;
    }

    public static UserUpdateCommand toUpdateCommand(UserUpdateRequest req) {
        UserUpdateCommand cmd = new UserUpdateCommand();
        cmd.setFirstName(req.getFirstName());
        cmd.setLastName(req.getLastName());
        cmd.setAccount(req.getAccount());
        cmd.setPassword(req.getPassword());
        cmd.setEmail(req.getEmail());
        cmd.setPhone(req.getPhone());
        cmd.setGender(req.getGender());
        cmd.setAvatar(req.getAvatar());
        cmd.setDescription(req.getDescription());
        cmd.setEnable(req.getEnable());
        cmd.setDepartmentId(req.getDepartmentId());
        cmd.setPositionIds(req.getPositionIds());
        cmd.setRoleIds(req.getRoleIds());
        return cmd;
    }

    public static UserResponse toResponse(UserInfo info) {
        if (info == null) return null;
        UserResponse r = new UserResponse();
        r.setId(info.getId());
        r.setFirstName(info.getFirstName());
        r.setLastName(info.getLastName());
        r.setAccount(info.getAccount());
        r.setEmail(info.getEmail());
        r.setPhone(info.getPhone());
        r.setGender(info.getGender());
        r.setAvatar(info.getAvatar());
        r.setDescription(info.getDescription());
        r.setEnable(info.getEnable());
        r.setDepartmentId(info.getDepartmentId());
        r.setDepartmentName(info.getDepartmentName());
        r.setPositionIds(info.getPositionIds());
        r.setPositionNames(info.getPositionNames());
        r.setRoleIds(info.getRoleIds());
        r.setRoleNames(info.getRoleNames());
        return r;
    }
}
