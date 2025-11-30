package com.summer.iam.domain.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UuidGenerator;

@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name = "sm_system_department")
public class Department {

    @Id
    @UuidGenerator
    private String id;

    @Column(name = "pid")
    private String pid;

    @Column(name = "name")
    private String name;

    @Column(name = "icon")
    private String icon;

    @Column(name = "is_root")
    private Boolean root;

    @Column(name = "code")
    private String code;

    @Column(name = "sort")
    private Integer sort;
}
