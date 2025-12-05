package com.summer.iam.application.command;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DepartmentUpdateCommand {
    private String pid;
    private String name;
    private String icon;
    private Boolean root;
    private String code;
    private Integer sort;
}
