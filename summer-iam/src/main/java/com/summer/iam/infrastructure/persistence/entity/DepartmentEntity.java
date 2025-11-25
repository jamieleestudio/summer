package com.summer.iam.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.domain.AbstractAuditable;

@Getter
@Setter
@Entity
@Table(name = "sm_system_department")
public class DepartmentEntity extends AbstractAuditable<UserEntity, Long> {

    @Column(name = "pid")
    private Long pid;

    @Column(name = "name")
    private String name;

    @Column(name = "icon")
    private String icon;

    @Column(name = "is_root")
    private Boolean isRoot;

    @Column(name = "code")
    private String code;

    @Column(name = "sort")
    private Integer sort;
}
