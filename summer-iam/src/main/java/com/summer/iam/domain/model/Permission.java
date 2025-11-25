package com.summer.iam.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Permission {
    private String id;
    private String code;
    private String name;
    private String description;
}
