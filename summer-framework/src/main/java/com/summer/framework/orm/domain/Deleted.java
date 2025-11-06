package com.summer.framework.orm.domain;

/**
 * 逻辑删除接口
 * @author lixf
 * @date 2021/5/17 17:24
 */
public interface Deleted {

    Boolean getDeleted();
    void setDeleted(Boolean deleted);

}
