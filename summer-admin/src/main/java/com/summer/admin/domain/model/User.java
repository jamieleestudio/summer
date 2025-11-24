package com.summer.admin.domain.model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * 用户领域对象
 * 专注于业务规则和行为，不依赖持久化框架
 */
@Getter
@Setter
public class User {

    /**
     * 用户ID
     */
    private String id;

    /**
     * 名字
     */
    private String firstName;

    /**
     * 姓氏
     */
    private String lastName;

    /**
     * 账号
     */
    private String account;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话
     */
    private String phone;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否已删除
     */
    private Boolean deleted;

    /**
     * 是否已启用
     */
    private Boolean enable;

    /**
     * 创建时间
     */
    private LocalDateTime createdAt;

    /**
     * 更新时间
     */
    private LocalDateTime updatedAt;

    /**
     * 创建者
     */
    private User createdBy;

    /**
     * 更新者
     */
    private User lastModifiedBy;

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
     * 更新个人信息
     * @param firstName 名字
     * @param lastName 姓氏
     * @param email 邮箱
     * @param phone 电话
     */
    public void updatePersonalInfo(String firstName, String lastName, String email, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.updatedAt = LocalDateTime.now();
    }

    /**
     * 启用用户
     */
    public void enable() {
        this.enable = true;
        this.updatedAt = LocalDateTime.now();
    }

    /**
     * 禁用用户
     */
    public void disable() {
        this.enable = false;
        this.updatedAt = LocalDateTime.now();
    }

    /**
     * 标记为已删除
     */
    public void markAsDeleted() {
        this.deleted = true;
        this.updatedAt = LocalDateTime.now();
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