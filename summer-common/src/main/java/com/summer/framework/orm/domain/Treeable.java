package com.summer.framework.orm.domain;

import java.io.Serializable;

/**
 * tree interface
 * @param <PK> PK
 */
public interface Treeable<PK extends Serializable>{

    PK getPid();
    void setPid(PK pId);

    default Boolean getIsRoot(){
        return getPid() == null;
    }

}
