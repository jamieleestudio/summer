package com.summer.iam.interfaces.rest.dto.user;

import io.swagger.v3.oas.annotations.media.Schema;

public class UserEnabledRequest {
    @Schema(description = "是否启用", example = "true", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean enabled;

    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
}
