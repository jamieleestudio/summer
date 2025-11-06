package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractAuditable;
import com.summer.framework.orm.domain.Sortable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


@Getter
@Setter
@Entity
@Table(name="sm_system_role")
public class SystemRole extends AbstractAuditable<Long,Long> implements Sortable {

    /**
     * 角色名称
     */
    @Column(name = "name")
    private String name;

    /**
     * 角色描述
     */
    @Column(name = "description")
    private String description;

    /**
     * 角色权限范围
     */
    @Column(name = "permission_scope")
    private Integer permissionScope;


    private Integer sort;

}
