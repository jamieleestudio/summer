package com.summer.iam.interfaces.rest.dto.role;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@Schema(description = "角色更新请求")
public class RoleUpdateRequest {

    @NotBlank(message = "角色名称不能为空")
    @Schema(description = "角色名称", example = "管理员")
    private String name;

    @Schema(description = "角色描述", example = "系统管理员角色")
    private String description;

    @NotNull(message = "权限范围不能为空")
    @Schema(description = "权限范围", example = "999")
    private Integer permissionScope;

    @Schema(description = "排序", example = "1")
    private Integer sort;
    
    @Schema(description = "是否启用", example = "true")
    private Boolean enabled;

    @Schema(description = "权限ID列表")
    private List<String> permissions;

}