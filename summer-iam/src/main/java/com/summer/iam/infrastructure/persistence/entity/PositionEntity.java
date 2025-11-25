package com.summer.iam.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.jpa.domain.AbstractAuditable;

@Getter
@Setter
@Entity
@Table(name = "sm_system_position")
public class PositionEntity extends AbstractAuditable<UserEntity, Long> {

    @Column(name = "name")
    private String name;

    @Column(name = "code")
    private String code;

    @Column(name = "department_id")
    private Long departmentId;

    @Column(name = "type")
    private Integer type;

    @Column(name = "description")
    private String description;

    @Column(name = "sort")
    private Integer sort;
}
