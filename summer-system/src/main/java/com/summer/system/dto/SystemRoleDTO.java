package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SystemRoleDTO implements Serializable {

    private Long id;

    private String name;

    private String description;

    private Integer sort;

}
