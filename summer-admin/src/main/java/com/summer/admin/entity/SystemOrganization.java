package com.summer.admin.entity;


import com.summer.framework.orm.domain.AbstractAuditTreeable;
import com.summer.framework.orm.domain.Sortable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name="sm_system_organization")
public class SystemOrganization extends AbstractAuditTreeable<Long,Long> implements Sortable {

    @Column(name = "code")
    private String code;

    @Column(name = "abbreviation")
    private String abbreviation;

    @Column(name = "nature")
    private Integer nature;

    @Column(name = "address")
    private String address;

    @Column(name = "home_page")
    private String homePage;

    @Column(name = "established_time")
    private LocalDateTime establishedTime;

    private Integer sort;

}
