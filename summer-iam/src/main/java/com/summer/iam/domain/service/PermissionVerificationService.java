package com.summer.iam.domain.service;

import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public class PermissionVerificationService {

    public boolean hasPermission(String code) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            return false;
        }
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if (authorities == null) {
            return false;
        }
        Set<String> names = authorities.stream().map(GrantedAuthority::getAuthority).collect(Collectors.toSet());
        if (names.contains("ROLE_ADMIN")) {
            return true;
        }
        return names.contains("PERM_" + code);
    }

    public boolean hasPermission(String action, String resource) {
        String code = resource + ":" + action;
        return hasPermission(code);
    }

    public boolean hasAnyPermission(Collection<String> codes) {
        if (codes == null || codes.isEmpty()) {
            return false;
        }
        for (String code : codes) {
            if (hasPermission(code)) {
                return true;
            }
        }
        return false;
    }

    public boolean hasRole(String roleName) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            return false;
        }
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if (authorities == null) {
            return false;
        }
        String role = roleName.startsWith("ROLE_") ? roleName : "ROLE_" + roleName;
        for (GrantedAuthority ga : authorities) {
            if (role.equals(ga.getAuthority())) {
                return true;
            }
        }
        return false;
    }
}
