package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/*
 * 岗位查询DTO
 * @author Likasi
 */
@Getter
@Setter
public class SystemPositionQueryDTO implements Serializable {

    /**
     * 岗位名称
     */
    private String name;

    /**
     * 部门ID
     */
    private Long departmentId;
}
