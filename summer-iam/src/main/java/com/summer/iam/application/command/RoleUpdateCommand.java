package com.summer.iam.application.command;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class RoleUpdateCommand {
    private String name;
    private String description;
    private Integer permissionScope;
    private Integer sort;
    private Boolean enabled;
    private List<String> permissions;
}
