package com.summer.admin.entity;

import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;
import org.springframework.data.jpa.domain.AbstractAuditable;

@Getter
@Setter
@Entity
@Table(name="sm_system_role")
public class SystemRole extends AbstractAuditable<SystemUser,String> {

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

}
