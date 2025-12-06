package com.summer.iam.domain.service;

import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.model.Scope;
import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.User;
import org.springframework.stereotype.Service;

@Service
public class PermissionScopeService {
    public Scope effectiveScope(Role role, User context) {
        Integer s = role != null ? role.getPermissionScope() : null;
        if (s != null && s >= 999) return new Scope(Scope.Type.GLOBAL);
        return new Scope(Scope.Type.LIMITED);
    }

    public boolean isPermitted(Permission perm, Scope scope) {
        if (perm == null || scope == null) return false;
        if (scope.getType() == Scope.Type.GLOBAL) return true;
        return true;
    }
}
