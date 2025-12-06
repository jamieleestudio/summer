package com.summer.iam.domain.service;

import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.model.RoleAssignmentResult;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleAssignmentService {
    public RoleAssignmentResult validate(List<Role> current, List<Role> toAssign) {
        Set<String> currentNames = new HashSet<>();
        if (current != null) {
            for (Role r : current) {
                if (r != null && r.getName() != null) currentNames.add(r.getName());
            }
        }
        List<Role> addList = new ArrayList<>();
        if (toAssign != null) {
            for (Role r : toAssign) {
                if (r != null && r.getName() != null && !currentNames.contains(r.getName())) addList.add(r);
            }
        }
        List<Role> removeList = new ArrayList<>();
        if (current != null) {
            Set<String> toAssignNames = new HashSet<>();
            if (toAssign != null) {
                for (Role r : toAssign) {
                    if (r != null && r.getName() != null) toAssignNames.add(r.getName());
                }
            }
            for (Role r : current) {
                if (r != null && r.getName() != null && !toAssignNames.contains(r.getName())) removeList.add(r);
            }
        }
        RoleAssignmentResult result = new RoleAssignmentResult();
        result.setToAssign(addList);
        result.setToRemove(removeList);
        result.setViolations(new ArrayList<>());
        return result;
    }
}
