package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractAuditTreeable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


@Getter
@Setter
@Entity
@Table(name="sm_system_permission")
public class SystemPermission extends AbstractAuditTreeable<Long,Long> {

    @Column(name = "permission_code")
    private String permissionCode;
}
