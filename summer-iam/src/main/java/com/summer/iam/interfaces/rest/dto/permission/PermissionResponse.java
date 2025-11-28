package com.summer.iam.interfaces.rest.dto.permission;

import com.summer.framework.orm.domain.Treeable;
import com.summer.iam.domain.model.Permission;

public class PermissionResponse implements Treeable<String> {
    private String id;
    private String code;
    private String type;
    private String name;
    private String description;
    private String pid;
    private String icon;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getPid() { return pid; }
    public void setPid(String pid) { this.pid = pid; }
    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }
}
