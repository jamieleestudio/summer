package com.summer.iam.domain.model;

import java.util.List;

public class RoleAssignmentResult {
    private List<Role> toAssign;
    private List<Role> toRemove;
    private List<String> violations;

    public List<Role> getToAssign() { return toAssign; }
    public void setToAssign(List<Role> toAssign) { this.toAssign = toAssign; }
    public List<Role> getToRemove() { return toRemove; }
    public void setToRemove(List<Role> toRemove) { this.toRemove = toRemove; }
    public List<String> getViolations() { return violations; }
    public void setViolations(List<String> violations) { this.violations = violations; }
}
