package com.summer.framework.exception;


import lombok.Getter;
import lombok.Setter;

/**
 * 非运行期异常基类，所有自定义非运行时异常继承该类
 */
@Getter
@Setter
public class BaseUncheckedException extends RuntimeException implements BaseException {

    /**
     * 异常信息
     */
    protected String message;

    /**
     * 具体异常码
     */
    protected int code;

    public BaseUncheckedException(int code, String errorMessage) {
        super(errorMessage);
        this.code = code;
        this.message = errorMessage;
    }

    public BaseUncheckedException(int code, String format, Object... args) {
        super(String.format(format, args));
        this.code = code;
        this.message = String.format(format, args);
    }


}
