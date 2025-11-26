package com.summer.framework.orm.domain;

import java.io.Serializable;

/**
 * tree interface
 * @param <PK>
 */
public interface GeneralTreeable<PK extends Serializable> extends Treeable<PK>{

    void setName(String name);
    String getName();

    String getIcon();
    void setIcon(String icon);

    Boolean getIsRoot();
    void setIsRoot(Boolean isRoot);

}
