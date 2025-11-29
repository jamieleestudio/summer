package com.summer.iam.domain.model;

import com.summer.framework.orm.domain.Treeable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.UuidGenerator;


@Getter
@Setter
@Entity
@Table(name = "sm_system_permission")
public class Permission implements Treeable<String> {

    @Id
    @UuidGenerator
    private String id;
    
    public enum Type {
        CATALOG,
        MENU,
        EMBEDDED,
        LINK,
        BUTTON
    }

    @Column(name = "code")
    private String code;

    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private Type type;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "pid")
    private String pid;

    @Column(name = "icon")
    private String icon;
    
    
    @Transient
    public boolean isNew() {
        return this.id == null;
    }
}