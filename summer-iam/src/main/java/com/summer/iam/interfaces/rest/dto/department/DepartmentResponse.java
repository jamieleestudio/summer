package com.summer.iam.interfaces.rest.dto.department;

public class DepartmentResponse {
    private String id;
    private String pid;
    private String name;
    private String icon;
    private Boolean root;
    private String code;
    private Integer sort;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPid() { return pid; }
    public void setPid(String pid) { this.pid = pid; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }
    public Boolean getRoot() { return root; }
    public void setRoot(Boolean root) { this.root = root; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }
}