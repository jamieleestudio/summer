package com.summer.iam.interfaces.rest.dto.position;

import io.swagger.v3.oas.annotations.media.Schema;

public class PositionEnabledRequest {
    @Schema(description = "是否启用", example = "true", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean enabled;

    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
}
