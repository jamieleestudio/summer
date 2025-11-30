package com.summer.iam.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UuidGenerator;

import java.util.List;

@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name = "sm_system_role")
public class Role {

    @Id
    @UuidGenerator
    private String id;
    
    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "permission_scope")
    private Integer permissionScope;

    @Column(name = "sort")
    private Integer sort;
    
    @Column(name = "enabled", nullable = false)
    private Boolean enabled = true;

    @ManyToMany
    @JoinTable(
            name = "sm_system_role_permission",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "permission_id")
    )
    @BatchSize(size = 50)
    private List<Permission> permissions;
    
    @Transient
    public boolean isNew() {
        return this.id == null;
    }
}
