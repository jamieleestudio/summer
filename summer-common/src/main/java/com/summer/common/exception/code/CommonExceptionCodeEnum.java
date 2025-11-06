package com.summer.common.exception.code;

import lombok.Getter;

/**
 * 全局错误码枚举
 * 0-999 系统异常编码保留
 */
@Getter
public enum CommonExceptionCodeEnum implements BaseExceptionCode {

    SUCCESS(200, "成功"),
    FAIL(-1, "失败"),


    // ========== 客户端错误段 ==========

    BAD_REQUEST(400, "请求参数不正确"),
    UNAUTHORIZED(401, "账号未登录"),
    FORBIDDEN(403, "没有该操作权限"),
    NOT_FOUND(404, "请求未找到"),
    METHOD_NOT_ALLOWED(405, "请求方法不正确"),

    // ========== 服务端错误段 ==========

    INTERNAL_SERVER_ERROR(500, "系统异常"),
    UNKNOWN(999, "未知错误");


    CommonExceptionCodeEnum(Integer code, String message) {
        this.Code = code;
        this.Message = message;
    }

    CommonExceptionCodeEnum(Integer code, String message, String tip) {
        this.Code = code;
        this.Message = message;
        this.tip = tip;
    }

    /**
     * 错误编号
     */
    private int Code;

    /**
     * 错误信息
     */
    private String Message;

    /**
     * 返回给前端的友好提示
     */
    private String tip;

}
