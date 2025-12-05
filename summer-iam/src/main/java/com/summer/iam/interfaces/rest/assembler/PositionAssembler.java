package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.interfaces.rest.dto.position.PositionCreateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionUpdateRequest;

public final class PositionAssembler {
    private PositionAssembler() {}

    public static PositionCreateCommand toCreateCommand(PositionCreateRequest req) {
        PositionCreateCommand cmd = new PositionCreateCommand();
        cmd.setName(req.getName());
        cmd.setCode(req.getCode());
        cmd.setType(req.getType());
        cmd.setDescription(req.getDescription());
        cmd.setSort(req.getSort());
        cmd.setEnabled(req.getEnabled());
        return cmd;
    }

    public static PositionUpdateCommand toUpdateCommand(PositionUpdateRequest req) {
        PositionUpdateCommand cmd = new PositionUpdateCommand();
        cmd.setName(req.getName());
        cmd.setCode(req.getCode());
        cmd.setType(req.getType());
        cmd.setDescription(req.getDescription());
        cmd.setSort(req.getSort());
        cmd.setEnabled(req.getEnabled());
        return cmd;
    }
}
