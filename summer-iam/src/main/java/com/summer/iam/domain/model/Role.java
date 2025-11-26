package com.summer.iam.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.AbstractPersistable;

import java.util.List;


@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name = "sm_system_role")
public class Role  extends AbstractPersistable<String>{

    @Column(name = "name")
    private String  name;

    @Column(name = "description")
    private String  description;

    @Column(name = "permission_scope")
    private Integer permissionScope;

    @Column(name = "sort")
    private Integer sort;

    @ManyToMany
    @JoinTable(
            name = "sm_role_permission",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "permission_id")
    )
    @BatchSize(size = 10)
    private List<Permission> permissions;

}
