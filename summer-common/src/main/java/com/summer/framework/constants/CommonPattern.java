package com.summer.framework.constants;

import java.util.regex.Pattern;

/**
 * the common pattern
 */
public interface CommonPattern {

    /**
     * colon first param
     */
    Pattern COLON_FIRST = Pattern.compile(CommonCharacter.COLON+"[A-Za-z]+");

}
