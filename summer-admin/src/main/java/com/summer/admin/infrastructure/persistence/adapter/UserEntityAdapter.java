package com.summer.admin.infrastructure.persistence.adapter;

import com.summer.admin.domain.model.User;
import com.summer.admin.infrastructure.persistence.entity.SystemUserEntity;
import org.springframework.stereotype.Component;

/**
 * 用户领域对象与持久化实体的转换适配器
 * 负责在User领域对象和SystemUserEntity持久化实体之间进行数据转换
 */
@Component
public class UserEntityAdapter {

    /**
     * 将持久化实体转换为领域对象
     * @param entity 持久化实体
     * @return 领域对象
     */
    public User toDomain(SystemUserEntity entity) {
        if (entity == null) {
            return null;
        }

        User user = new User();
        user.setId(entity.getId());
        user.setName(entity.getName());
        user.setAccount(entity.getAccount());
        user.setPassword(entity.getPassword());
        user.setEmail(entity.getEmail());
        user.setPhone(entity.getPhone());
        user.setDepartment(entity.getDepartment());
        user.setPosition(entity.getPosition());
        user.setEnabled(entity.getEnabled() != null && entity.getEnabled());
        user.setCreatedAt(entity.getCreatedAt() != null ? entity.getCreatedAt().getTime() : 0);
        user.setUpdatedAt(entity.getUpdatedAt() != null ? entity.getUpdatedAt().getTime() : 0);
        user.setDeleted(entity.getDeleted() != null && entity.getDeleted());
        
        // 设置扩展字段
        user.setLastLoginTime(entity.getLastLoginTime() != null ? entity.getLastLoginTime().getTime() : 0);
        user.setLoginIp(entity.getLoginIp());
        user.setAvatar(entity.getAvatar());
        user.setRemark(entity.getRemark());
        
        return user;
    }

    /**
     * 将领域对象转换为持久化实体
     * @param user 领域对象
     * @return 持久化实体
     */
    public SystemUserEntity toEntity(User user) {
        if (user == null) {
            return null;
        }

        SystemUserEntity entity = new SystemUserEntity();
        entity.setId(user.getId());
        entity.setName(user.getName());
        entity.setAccount(user.getAccount());
        entity.setPassword(user.getPassword());
        entity.setEmail(user.getEmail());
        entity.setPhone(user.getPhone());
        entity.setDepartment(user.getDepartment());
        entity.setPosition(user.getPosition());
        entity.setEnabled(user.isEnabled());
        entity.setCreatedAt(user.getCreatedAt() > 0 ? new java.util.Date(user.getCreatedAt()) : null);
        entity.setUpdatedAt(user.getUpdatedAt() > 0 ? new java.util.Date(user.getUpdatedAt()) : null);
        entity.setDeleted(user.isDeleted());
        
        // 设置扩展字段
        entity.setLastLoginTime(user.getLastLoginTime() > 0 ? new java.util.Date(user.getLastLoginTime()) : null);
        entity.setLoginIp(user.getLoginIp());
        entity.setAvatar(user.getAvatar());
        entity.setRemark(user.getRemark());
        
        return entity;
    }

    /**
     * 更新持久化实体
     * @param entity 要更新的持久化实体
     * @param user 领域对象（作为更新源）
     * @return 更新后的持久化实体
     */
    public SystemUserEntity updateEntity(SystemUserEntity entity, User user) {
        if (entity == null || user == null) {
            return entity;
        }

        // 更新基本信息
        entity.setName(user.getName());
        entity.setEmail(user.getEmail());
        entity.setPhone(user.getPhone());
        entity.setDepartment(user.getDepartment());
        entity.setPosition(user.getPosition());
        entity.setEnabled(user.isEnabled());
        entity.setUpdatedAt(user.getUpdatedAt() > 0 ? new java.util.Date(user.getUpdatedAt()) : new java.util.Date());
        entity.setDeleted(user.isDeleted());
        
        // 更新扩展信息
        entity.setLastLoginTime(user.getLastLoginTime() > 0 ? new java.util.Date(user.getLastLoginTime()) : null);
        entity.setLoginIp(user.getLoginIp());
        entity.setAvatar(user.getAvatar());
        entity.setRemark(user.getRemark());
        
        // 只在密码不为空时更新密码
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            entity.setPassword(user.getPassword());
        }
        
        return entity;
    }
}