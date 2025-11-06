package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/*
 * 岗位DTO
 * @author Likasi
 */
@Getter
@Setter
public class SystemPositionDTO implements Serializable {

    private Long id;

    private String name;

    private String code;

    private String departmentName;

    private String typeStr;

    private String description;

    private Integer sort;

}
