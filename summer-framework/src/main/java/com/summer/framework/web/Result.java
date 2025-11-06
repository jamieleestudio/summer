//package com.summer.framework.web;
//
//
//import lombok.Getter;
//import lombok.Setter;
//
//import java.io.Serializable;
//
///**
// * 统一响应结果
// */
//@Getter
//@Setter
//public class Result<T> implements Serializable {
//
//
//    private Integer code;
//
//    private String message;
//
//    private T data;
//
//    public Result() {
//
//    }
//
//    public Result(int code, String message) {
//        this.code = code;
//        this.message = message;
//    }
//
//    private Result(int code, String message, T data) {
//        this.code = code;
//        this.message = message;
//        this.data = data;
//    }
//
//    private Result(BaseExceptionCode baseExceptionCode) {
//        this.code = baseExceptionCode.getCode();
//        this.message = baseExceptionCode.getMessage();
//    }
//
//    private Result(BaseExceptionCode baseExceptionCode, T data) {
//        this.code = baseExceptionCode.getCode();
//        this.message = baseExceptionCode.getMessage();
//        this.data = data;
//    }
//
//
//    public static <T> Result<T> info( int code, String message) {
//        return new Result<>( code, message);
//    }
//
//    public static <T> Result<T> info(int code, String message, T date) {
//        return new Result<>( code, message, date);
//    }
//
//    /**
//     * 请求成功消息
//     */
//    public static <T> Result<T> success() {
//        return new Result<>(CommonExceptionCodeEnum.SUCCESS);
//    }
//
//    public static <T> Result<T> success(T data) {
//        return new Result<>(CommonExceptionCodeEnum.SUCCESS, data);
//    }
//
//    /**
//     * 请求失败消息
//     */
//    public static <T> Result<T> failure() {
//        return new Result<>(CommonExceptionCodeEnum.FAIL);
//    }
//
//    public static <T> Result<T> failure(String message) {
//        return new Result<>(CommonExceptionCodeEnum.FAIL.getCode(), message);
//    }
//
//    public static <T> Result<T> failure(BaseExceptionCode exceptionEnum) {
//        return new Result<>(exceptionEnum);
//    }
//
//
//    public static <T> Result<T> failure(BaseExceptionCode exceptionEnum, String message) {
//        return new Result<>(exceptionEnum.getCode(), message);
//    }
//
//    public static <T> Result<T> failure(Integer code, String message) {
//        return new Result<>(code, message);
//    }
//
//    @Override
//    public String toString() {
//        return "Result{" +
//                "code=" + code +
//                ", message='" + message + '\'' +
//                ", data=" + data +
//                '}';
//    }
//}
