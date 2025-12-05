package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.RoleCreateCommand;
import com.summer.iam.application.command.RoleUpdateCommand;
import com.summer.iam.interfaces.rest.dto.role.RoleCreateRequest;
import com.summer.iam.interfaces.rest.dto.role.RoleUpdateRequest;

public final class RoleAssembler {
    private RoleAssembler() {}

    public static RoleCreateCommand toCreateCommand(RoleCreateRequest req) {
        RoleCreateCommand cmd = new RoleCreateCommand();
        cmd.setName(req.getName());
        cmd.setDescription(req.getDescription());
        cmd.setPermissionScope(req.getPermissionScope());
        cmd.setSort(req.getSort());
        cmd.setEnabled(req.getEnabled());
        cmd.setPermissions(req.getPermissions());
        return cmd;
    }

    public static RoleUpdateCommand toUpdateCommand(RoleUpdateRequest req) {
        RoleUpdateCommand cmd = new RoleUpdateCommand();
        cmd.setName(req.getName());
        cmd.setDescription(req.getDescription());
        cmd.setPermissionScope(req.getPermissionScope());
        cmd.setSort(req.getSort());
        cmd.setEnabled(req.getEnabled());
        cmd.setPermissions(req.getPermissions());
        return cmd;
    }
}
