package com.summer.iam.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Department {
    private String id;
    private String pid;
    private String name;
    private String icon;
    private Boolean root;
    private String code;
    private Integer sort;
}
