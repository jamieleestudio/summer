package com.summer.common.exception;


import lombok.Getter;
import lombok.Setter;

/**
 * 运行期异常基类
 */
@Getter
@Setter
public abstract class BaseCheckedException extends Exception implements BaseException {


    /**
     * 异常信息
     */
    protected String message;

    /**
     * 具体异常码
     */
    protected int code;

    public BaseCheckedException(int code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public BaseCheckedException(int code, String format, Object... args) {
        super(String.format(format, args));
        this.code = code;
        this.message = String.format(format, args);
    }

}
