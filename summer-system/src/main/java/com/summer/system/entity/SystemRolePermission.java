package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractPersistable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


@Getter
@Setter
@Entity
@Table(name="sm_system_role_permission")
public class SystemRolePermission extends AbstractPersistable<Long> {

    @Column(name = "role_id")
    private Long roleId;

    @Column(name = "permission_id")
    private Long permissionId;

}
