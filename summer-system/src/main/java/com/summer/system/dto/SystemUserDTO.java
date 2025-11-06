package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/*
 * 用户dto
 * @author Likasi
 */
@Getter
@Setter
public class SystemUserDTO implements Serializable {

    private Long  id;

    private String account;

    private String name;

    private Integer gender;

    private String genderStr;

    private String phone;

    private String enable;

    private String description;

}
