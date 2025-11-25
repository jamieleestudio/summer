package com.summer.iam.interfaces.rest.dto.response;

public class LoginResponse {

    public LoginResponse() {
    }

    public LoginResponse(String token) {
        this.accessToken = token;
    }

    private String accessToken;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String token) {
        this.accessToken = token;
    }
}
