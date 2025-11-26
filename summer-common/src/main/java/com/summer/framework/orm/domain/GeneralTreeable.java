package com.summer.framework.orm.domain;

import java.io.Serializable;

/**
 * tree interface
 * @param <PK>
 */
public interface GeneralTreeable<PK extends Serializable> extends Treeable<PK>{

    default Boolean getIsRoot(){
        return getPid() == null;
    }

}
