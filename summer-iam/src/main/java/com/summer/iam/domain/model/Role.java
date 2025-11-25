package com.summer.iam.domain.model;

import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
public class Role {
    private String id;
    private String name;
    private String description;
    private Integer permissionScope;
    private Integer sort;
    private Set<Permission> permissions = new LinkedHashSet<>();

    public void grant(Permission permission) {
        if (permission != null) {
            permissions.add(permission);
        }
    }

    public void revoke(String permissionCode) {
        if (permissionCode == null) return;
        permissions.removeIf(p -> permissionCode.equals(p.getCode()));
    }
}
