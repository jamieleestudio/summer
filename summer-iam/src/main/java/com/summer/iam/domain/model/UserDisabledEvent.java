package com.summer.iam.domain.model;

public class UserDisabledEvent {
    private String userId;

    public UserDisabledEvent(String userId) { this.userId = userId; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
}
