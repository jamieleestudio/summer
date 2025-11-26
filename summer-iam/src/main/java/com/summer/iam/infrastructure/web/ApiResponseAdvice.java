package com.summer.iam.infrastructure.web;

import com.summer.iam.interfaces.rest.dto.ApiResponse;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

@RestControllerAdvice
public class ApiResponseAdvice implements ResponseBodyAdvice<Object> {

    @Override
    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType,
                                  Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        String path = request.getURI().getPath();
        if (path != null && (path.startsWith("/v3/api-docs") || path.startsWith("/swagger-ui"))) {
            return body;
        }
        if (selectedContentType != null && !selectedContentType.includes(MediaType.APPLICATION_JSON)) {
            return body;
        }
        if (body == null) {
            return ApiResponse.ok(null);
        }
        if (body instanceof ApiResponse) {
            return body;
        }
        if (selectedContentType.includes(MediaType.APPLICATION_PROBLEM_JSON)) {
            return body;
        }
        return ApiResponse.ok(body);
    }
}
