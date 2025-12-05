package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.DepartmentCreateCommand;
import com.summer.iam.application.command.DepartmentUpdateCommand;
import com.summer.iam.interfaces.rest.dto.department.DepartmentCreateRequest;
import com.summer.iam.interfaces.rest.dto.department.DepartmentUpdateRequest;

public final class DepartmentAssembler {
    private DepartmentAssembler() {}

    public static DepartmentCreateCommand toCreateCommand(DepartmentCreateRequest req) {
        DepartmentCreateCommand cmd = new DepartmentCreateCommand();
        cmd.setPid(req.getPid());
        cmd.setName(req.getName());
        cmd.setIcon(req.getIcon());
        cmd.setRoot(req.getRoot());
        cmd.setCode(req.getCode());
        cmd.setSort(req.getSort());
        return cmd;
    }

    public static DepartmentUpdateCommand toUpdateCommand(DepartmentUpdateRequest req) {
        DepartmentUpdateCommand cmd = new DepartmentUpdateCommand();
        cmd.setPid(req.getPid());
        cmd.setName(req.getName());
        cmd.setIcon(req.getIcon());
        cmd.setRoot(req.getRoot());
        cmd.setCode(req.getCode());
        cmd.setSort(req.getSort());
        return cmd;
    }
}
