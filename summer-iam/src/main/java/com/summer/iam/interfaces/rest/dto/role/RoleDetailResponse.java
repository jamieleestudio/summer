package com.summer.iam.interfaces.rest.dto.role;

import java.util.ArrayList;
import java.util.List;

public class RoleDetailResponse {
    private String id;
    private String name;
    private String description;
    private Integer permissionScope;
    private Integer sort;
    private Boolean enabled;
    private List<String> permissions = new ArrayList<>();

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Integer getPermissionScope() { return permissionScope; }
    public void setPermissionScope(Integer permissionScope) { this.permissionScope = permissionScope; }
    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }
    public List<String> getPermissions() { return permissions; }
    public void setPermissions(List<String> permissions) { this.permissions = permissions; }
}