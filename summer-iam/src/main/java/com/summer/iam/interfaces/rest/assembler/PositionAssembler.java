package com.summer.iam.interfaces.rest.assembler;

import com.summer.iam.application.command.PositionCreateCommand;
import com.summer.iam.application.command.PositionUpdateCommand;
import com.summer.iam.application.model.PositionInfo;
import com.summer.iam.application.model.PositionSummary;
import com.summer.iam.interfaces.rest.dto.position.PositionCreateRequest;
import com.summer.iam.interfaces.rest.dto.position.PositionResponse;
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

    public static PositionResponse toResponse(PositionInfo info) {
        PositionResponse r = new PositionResponse();
        r.setId(info.getId());
        r.setName(info.getName());
        r.setCode(info.getCode());
        r.setType(info.getType());
        r.setDescription(info.getDescription());
        r.setSort(info.getSort());
        r.setEnabled(info.getEnabled());
        return r;
    }

    public static PositionResponse toResponse(PositionSummary s) {
        PositionResponse r = new PositionResponse();
        r.setId(s.getId());
        r.setName(s.getName());
        r.setCode(s.getCode());
        r.setType(s.getType());
        r.setSort(s.getSort());
        r.setEnabled(s.getEnabled());
        return r;
    }
}
