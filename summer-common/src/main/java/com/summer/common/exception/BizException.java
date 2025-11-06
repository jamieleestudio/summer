package com.summer.common.exception;

import com.summer.common.exception.code.BaseExceptionCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class BizException extends BaseUncheckedException{


    private BaseExceptionCode exceptionCode;

    public BizException(int code, String errorMessage) {
        super(code, errorMessage);
    }

    public BizException(int code, String format, Object... args) {
        super(code, format, args);
    }

    public static BizException wrap(BaseExceptionCode exceptionEnum) {
        BizException bizException = new BizException(exceptionEnum.getCode(), exceptionEnum.getMessage());
        bizException.setExceptionCode(exceptionEnum);
        return bizException;
    }

    public static BizException wrap(BaseExceptionCode exceptionEnum, Object... args) {
        BizException k12Exception = new BizException(exceptionEnum.getCode(), exceptionEnum.getMessage(), args);
        k12Exception.setExceptionCode(exceptionEnum);
        return k12Exception;
    }

}
