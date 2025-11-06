package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractAuditTreeable;
import com.summer.framework.orm.domain.Sortable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;



/*
 * 组织机构
 * @author Likasi
 */
@Getter
@Setter
@Entity
@Table(name="sm_system_department")
public class SystemDepartment extends AbstractAuditTreeable<Long,Long> implements Sortable {

    @Column(name = "code")
    private String code;

    private Integer sort;

}
