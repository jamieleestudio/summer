package com.summer.iam.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UuidGenerator;

import java.util.List;

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

    @Embedded
    private Username username;

    private String account;

    private String password;

    private String email;

    private String phone;

    private Integer gender;

    private String avatar;

    private String description;

    @Embedded
    private UserStatus status;

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
     * 检查用户是否可用
     * @return 是否可用
     */
    public boolean isAvailable() {
        return this.status != null && this.status.isAvailable();
    }

}
