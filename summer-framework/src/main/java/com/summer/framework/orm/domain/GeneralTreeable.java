package com.summer.framework.orm.domain;

import java.io.Serializable;

/*
 * 通用树接口
 * @author Likasi
 * @date 15/05/2021 23:05
 */
public interface GeneralTreeable<PK extends Serializable> extends Treeable<PK>{

    void setName(String name);
    String getName();

    String getIcon();
    void setIcon(String icon);

    Boolean getIsRoot();
    void setIsRoot(Boolean isRoot);

}
