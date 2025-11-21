package com.summer.admin.entity;

import com.summer.framework.orm.domain.AbstractPersistable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "sm_system_user_role")
public class SystemUserRole extends AbstractPersistable<Long> {

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "role_id")
    private Long roleId;

}
