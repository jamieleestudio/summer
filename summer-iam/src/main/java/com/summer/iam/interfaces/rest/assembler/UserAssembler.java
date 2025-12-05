package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.UserCreateCommand;
import com.summer.iam.application.command.UserUpdateCommand;
import com.summer.iam.interfaces.rest.dto.user.UserCreateRequest;
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
}
