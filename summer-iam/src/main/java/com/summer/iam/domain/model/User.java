package com.summer.iam.domain.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.AbstractPersistable;

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
public class User extends AbstractPersistable<String> {

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

    @jakarta.persistence.ManyToOne(fetch = jakarta.persistence.FetchType.EAGER)
    @jakarta.persistence.JoinColumn(name = "department_id")
    private Department department;

    @jakarta.persistence.ManyToOne(fetch = jakarta.persistence.FetchType.EAGER)
    @jakarta.persistence.JoinColumn(name = "position_id")
    private Position position;

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
