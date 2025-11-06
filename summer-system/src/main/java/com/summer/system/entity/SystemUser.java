package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractAuditable;
import com.summer.framework.orm.domain.Deleted;
import com.summer.framework.orm.domain.Enable;
import com.summer.framework.orm.domain.Sortable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


/**
 * 系统用户
 */
@Getter
@Setter
@Entity
@Table(name = "sm_system_user")
public class SystemUser extends AbstractAuditable<Long,Long> implements Deleted, Enable, Sortable {

    /**
     * 工号
     */
    @Column(name = "job_number")
    private String jobNumber;

    /**
     * 姓名
     */
    @Column(name = "name")
    private String name;

    /**
     * 账户
     */
    @Column(name = "account")
    private String account;

    /**
     * 密码
     */
    @Column(name = "password")
    private String password;

    /**
     * 邮箱
     */
    @Column(name = "email")
    private String email;

    /**
     * 手机
     */
    @Column(name = "phone")
    private String phone;

    /**
     * 性别
     */
    @Column(name = "gender")
    private Integer gender;

    /**
     * 头像
     */
    @Column(name = "avatar")
    private String avatar;

    /**
     * 描述
     */
    @Column(name = "description")
    private String description;

    private Integer sort;
    private Boolean deleted;
    private Boolean enable;

}
