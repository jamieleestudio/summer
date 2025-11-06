package com.summer.common.constants;

import java.util.regex.Pattern;

/**
 * 公共正则表达式
 * @author lixf
 */
public interface CommonPattern {

    /**
     * 冒号后面第一个参数
     */
    Pattern COLON_FIRST = Pattern.compile(CommonCharacter.COLON+"[A-Za-z]+");

}
