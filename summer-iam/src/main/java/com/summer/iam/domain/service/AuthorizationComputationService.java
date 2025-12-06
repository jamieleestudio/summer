package com.summer.iam.domain.service;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class AuthorizationComputationService {
    public Set<String> computeAuthorities(List<Role> roles, List<Permission> perms) {
        Set<String> result = new HashSet<>();
        if (roles != null) {
            for (Role r : roles) {
                if (r != null && r.getName() != null) result.add(r.getName());
            }
        }
        if (perms != null) {
            for (Permission p : perms) {
                if (p != null && p.getCode() != null) result.add("PERM_" + p.getCode());
            }
        }
        return result;
    }
}
