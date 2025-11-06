package com.summer.framework.orm.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Objects;


@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public enum GenderEnum {

    SECRET(0,"保密"),
    MALE(1,"男"),
    FEMALE(2,"女");

    private final Integer code;
    private final String desc;

    public static String getDesc(Integer code){
        if(code == null){
            return "";
        }
        for (GenderEnum value : GenderEnum.values()) {
            if (Objects.equals(value.code, code)) {
                return value.desc;
            }
        }
        return "";
    }


}
