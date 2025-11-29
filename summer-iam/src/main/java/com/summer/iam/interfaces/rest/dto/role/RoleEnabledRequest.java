package com.summer.iam.interfaces.rest.dto.role;

import io.swagger.v3.oas.annotations.media.Schema;

public class RoleEnabledRequest {
    @Schema(description = "是否启用", example = "true", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean enabled;

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}