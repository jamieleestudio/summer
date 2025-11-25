package com.summer.framework.exception;

/**
 * 异常接口类
 */
public interface BaseException {

    /**
     * 返回异常信息
     *
     * @return 异常信息
     */
    String getMessage();

    /**
     * 返回异常编码
     *
     * @return 异常编码
     */
    int getCode();

}
