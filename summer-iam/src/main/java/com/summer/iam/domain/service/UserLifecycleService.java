package com.summer.iam.domain.service;

import com.summer.iam.domain.model.User;
import com.summer.iam.domain.model.UserDisabledEvent;
import org.springframework.stereotype.Service;

@Service
public class UserLifecycleService {
    public UserDisabledEvent disable(User user) {
        if (user == null) return null;
        user.setEnable(false);
        return new UserDisabledEvent(user.getId());
    }
}
