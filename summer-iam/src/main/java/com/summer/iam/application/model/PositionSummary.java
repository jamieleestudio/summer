package com.summer.iam.application.model;

import com.summer.iam.domain.model.Position;

public class PositionSummary {
    private String id;
    private String name;
    private String code;
    private Integer type;
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
    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }
    public Boolean getEnabled() { return enabled; }
    public void setEnabled(Boolean enabled) { this.enabled = enabled; }

    public static PositionSummary from(Position p) {
        PositionSummary s = new PositionSummary();
        s.setId(p.getId());
        s.setName(p.getName());
        s.setCode(p.getCode());
        s.setType(p.getType());
        s.setSort(p.getSort());
        s.setEnabled(p.getEnabled());
        return s;
    }
}
