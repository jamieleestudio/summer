package com.summer.iam.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Position {
    private String id;
    private String name;
    private String code;
    private String departmentId;
    private Integer type;
    private String description;
    private Integer sort;
}
