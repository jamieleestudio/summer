package com.summer.iam.domain.model;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Embeddable
public class UserStatus {
    private Boolean enable;
    private Boolean deleted;

    public UserStatus(Boolean enable, Boolean deleted) {
        this.enable = enable;
        this.deleted = deleted;
    }

    public boolean isAvailable() {
        return Boolean.TRUE.equals(enable) && !Boolean.TRUE.equals(deleted);
    }
}
