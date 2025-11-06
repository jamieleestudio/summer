package com.summer.framework.orm.domain;


import jakarta.persistence.MappedSuperclass;
import java.io.Serializable;

/*
 * 抽象树
 * @author Likasi
 * @date 15/05/2021 22:04
 */
@MappedSuperclass
public abstract class AbstractTreeable<PK extends Serializable> extends AbstractPersistable<PK> implements GeneralTreeable<PK>{

    private PK pid;

    private String name;

    private String icon;

    private Boolean isRoot;

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getIcon() {
        return icon;
    }

    @Override
    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public PK getPid() {
        return pid;
    }

    @Override
    public void setPid(PK pid) {
        this.pid = pid;
    }

    public Boolean getIsRoot() {
        return isRoot;
    }

    public void setIsRoot(Boolean setIsRoot) {
        isRoot = setIsRoot;
    }
}
