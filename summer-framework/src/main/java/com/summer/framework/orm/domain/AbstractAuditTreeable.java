package com.summer.framework.orm.domain;

import jakarta.persistence.MappedSuperclass;
import java.io.Serializable;

/*
 * 抽象审核树
 * @author Likasi
 * @date 15/05/2021 22:27
 */
@MappedSuperclass
public class AbstractAuditTreeable<U, PK extends Serializable> extends AbstractAuditable<U,PK> implements GeneralTreeable<PK>{

    private PK pid;

    private String name;

    private String icon;

    private Boolean isRoot;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public PK getPid() {
        return pid;
    }

    public void setPid(PK pid) {
        this.pid = pid;
    }


    public Boolean getIsRoot() {
        return isRoot;
    }

    public void setIsRoot(Boolean root) {
        isRoot = root;
    }
}
