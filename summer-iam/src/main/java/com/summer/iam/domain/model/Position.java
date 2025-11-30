package com.summer.iam.domain.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UuidGenerator;

@Getter
@Setter
@Entity
@DynamicUpdate
@Table(name = "sm_system_position")
public class Position  {

    @Id
    @UuidGenerator
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "type")
    private Integer type;

    @Column(name = "description")
    private String description;

    @Column(name = "sort")
    private Integer sort;

    @Column(name = "enabled", nullable = false)
    private Boolean enabled = true;
}
