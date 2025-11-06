package com.summer.system.entity;

import com.summer.framework.orm.domain.Deleted;
import com.summer.framework.orm.domain.Enable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.proxy.HibernateProxy;
import org.springframework.data.jpa.domain.AbstractAuditable;

import java.util.Objects;


/**
 * 系统用户
 */
@Getter
@Setter
@Entity
@Table(name = "sm_system_user")
public class SystemUser extends AbstractAuditable<SystemUser,String> implements Deleted, Enable {

    @Column(name = "username")
    private String username;

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

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        SystemUser that = (SystemUser) o;
        return getId() != null && Objects.equals(getId(), that.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }
}

