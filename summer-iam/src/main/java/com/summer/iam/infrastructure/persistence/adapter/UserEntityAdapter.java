package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.User;
import com.summer.iam.infrastructure.persistence.entity.UserEntity;
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
    public User toDomain(UserEntity entity) {
        if (entity == null) {
            return null;
        }

        User user = new User();
        user.setId(entity.getId() == null ? null : String.valueOf(entity.getId()));
        user.setAccount(entity.getAccount());
        user.setPassword(entity.getPassword());
        user.setEmail(entity.getEmail());
        user.setPhone(entity.getPhone());
        user.setDeleted(entity.getDeleted() != null && entity.getDeleted());
        
        // 设置扩展字段
        user.setAvatar(entity.getAvatar());
        
        return user;
    }

    /**
     * 将领域对象转换为持久化实体
     * @param user 领域对象
     * @return 持久化实体
     */
    public UserEntity toEntity(User user) {
        if (user == null) {
            return null;
        }

        UserEntity entity = new UserEntity();
        entity.setAccount(user.getAccount());
        entity.setPassword(user.getPassword());
        entity.setEmail(user.getEmail());
        entity.setPhone(user.getPhone());
        
        // 设置扩展字段
        entity.setAvatar(user.getAvatar());
        
        return entity;
    }

    /**
     * 更新持久化实体
     * @param entity 要更新的持久化实体
     * @param user 领域对象（作为更新源）
     * @return 更新后的持久化实体
     */
    public UserEntity updateEntity(UserEntity entity, User user) {
        if (entity == null || user == null) {
            return entity;
        }

        // 更新基本信息
        entity.setEmail(user.getEmail());
        entity.setPhone(user.getPhone());
        
        // 更新扩展信息
        
        // 只在密码不为空时更新密码
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            entity.setPassword(user.getPassword());
        }
        
        return entity;
    }
}
