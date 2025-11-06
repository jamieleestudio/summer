package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/*
 * 保存用户DTO
 * @author Likasi
 * @date 22/05/2021 12:42
 */
@Getter
@Setter
public class SystemUserSaveDTO implements Serializable {

    private Long id;

    private String account;

    private String name;

    private String email;

    private String phone;

    private Integer gender;

    private String avatar;

    private String description;

    private Boolean enable;

    private Long departmentId;

    private Long positionId;

    private Long roleId;

}
