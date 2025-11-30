package com.summer.iam.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UuidGenerator;

import java.util.List;
import java.util.Objects;

/**
 * User domain model
 * Focuses on business rules and behavior, independent of persistence frameworks
 */
@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name = "sm_system_user")
public class User  {

    @Id
    @UuidGenerator
    private String id;

    private String firstName;

    private String lastName;

    private String account;

    private String password;

    private String email;

    private String phone;

    private Integer gender;

    private String avatar;

    private String description;

    private Boolean deleted;

    private Boolean enable;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id")
    private Department department;

    @ManyToMany
    @JoinTable(
            name = "sm_system_user_position",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "position_id")
    )
    private List<Position> positions;

    @ManyToMany
    @JoinTable(
            name = "sm_system_user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private List<Role> roles;

    /**
     * 验证密码
     * @param password 待验证的密码
     * @return 是否匹配
     */
    public boolean validatePassword(String password) {
        Objects.requireNonNull(password, "密码不能为空");
        return this.password.equals(password);
    }

    /**
     * 获取用户全名
     * @return 全名
     */
    public String getFullName() {
        return lastName + firstName;
    }

    /**
     * 检查用户是否可用
     * @return 是否可用
     */
    public boolean isAvailable() {
        return this.enable != null && this.enable && this.deleted == null || !this.deleted;
    }
}
