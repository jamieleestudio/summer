package com.summer.iam.interfaces.rest.dto.role;

public class RoleResponse {
    private String id;
    private String name;
    private String description;
    private Integer permissionScope;
    private Integer sort;
    private Boolean enabled;

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
}
