package com.summer.iam.domain.model;

import com.summer.framework.orm.domain.Treeable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Getter
@Setter
@Entity
@Table(name = "sm_system_permission")
public class Permission extends AbstractPersistable<String> implements Treeable<String> {

    public enum Type {
        MENU,
        OPERATION
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

}
