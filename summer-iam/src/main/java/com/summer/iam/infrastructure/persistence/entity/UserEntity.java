package com.summer.iam.infrastructure.persistence.entity;

import com.summer.framework.orm.domain.Deleted;
import com.summer.framework.orm.domain.Enable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.domain.AbstractAuditable;


/**
 * 系统用户
 */
@Getter
@Setter
@Entity
@Table(name = "sm_system_user")
public class UserEntity extends AbstractAuditable<UserEntity,Long> implements Deleted, Enable {

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "account")
    private String account;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "gender")
    private Integer gender;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "description")
    private String description;

    private Boolean deleted;

    private Boolean enable;

    

}

