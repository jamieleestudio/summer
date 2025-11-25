package com.summer.framework.orm.enums;



import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Objects;


@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public enum EnabledEnum {

    /* 使用中 */
    TRUE(Boolean.TRUE,"使用中"),
    /* 已停用 */
    FALSE(Boolean.FALSE,"已停用");

    private Boolean code;
    private String name;

    public static String getDesc(Boolean code){
        if(code == null){
            return "";
        }
        for (EnabledEnum value : EnabledEnum.values()) {
            if (Objects.equals(value.code, code)) {
                return value.name;
            }
        }
        return "";
    }

}
