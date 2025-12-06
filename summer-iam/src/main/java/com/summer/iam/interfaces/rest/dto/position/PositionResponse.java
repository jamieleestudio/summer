package com.summer.iam.interfaces.rest.dto.position;

import com.summer.iam.domain.model.Position;

public class PositionResponse {
    private String id;
    private String name;
    private String code;
    private Integer type;
    private String description;
    private Integer sort;
    private Boolean enabled;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public Integer getType() { return type; }
    public void setType(Integer type) { this.type = type; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }

    public static PositionResponse from(Position p) {
        PositionResponse r = new PositionResponse();
        r.setId(p.getId());
        r.setName(p.getName());
        r.setCode(p.getCode());
        r.setType(p.getType());
        r.setDescription(p.getDescription());
        r.setSort(p.getSort());
        r.setEnabled(p.getEnabled());
        return r;
    }
}
