package com.summer.iam.domain.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.summer.iam.domain.model.Permission;

public class PermissionTreeService {

    public boolean canMove(String nodeId, String targetPid, Set<String> descendants) {
        if (nodeId == null || targetPid == null) return false;
        if (descendants == null) return true;
        return !descendants.contains(targetPid) && !nodeId.equals(targetPid);
    }

    public Set<String> validate(List<Permission> nodes) {
        Set<String> ids = new HashSet<>();
        Set<String> errors = new HashSet<>();
        if (nodes != null) {
            for (Permission p : nodes) {
                if (p == null) continue;
                String id = p.getId();
                if (id == null || !ids.add(id)) errors.add("dup:" + id);
            }
        }
        return errors;
    }
}
