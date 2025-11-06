package com.summer.framework.orm.domain;

import java.io.Serializable;

/**
 * 树接口
 * @param <PK> PK
 */
public interface Treeable<PK extends Serializable>{

    PK getPid();
    void setPid(PK pId);

}
