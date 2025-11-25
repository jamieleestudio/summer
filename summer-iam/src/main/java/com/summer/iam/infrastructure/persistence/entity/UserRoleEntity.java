package com.summer.iam.infrastructure.persistence.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "sm_system_user_role")
@IdClass(UserRoleId.class)
public class UserRoleEntity {

    @Id
    @Column(name = "user_id")
    private Long userId;

    @Id
    @Column(name = "role_id")
    private Long roleId;

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Long getRoleId() { return roleId; }
    public void setRoleId(Long roleId) { this.roleId = roleId; }
}
