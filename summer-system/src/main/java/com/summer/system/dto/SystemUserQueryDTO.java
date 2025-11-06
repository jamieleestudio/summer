package com.summer.system.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/*
 * 用户查询dto
 * @author Likasi
 */
@Getter
@Setter
public class SystemUserQueryDTO implements Serializable {

    private String key;

    private String value;

}
