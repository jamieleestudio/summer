package com.summer.system.entity;

import com.summer.framework.orm.domain.AbstractAuditable;
import com.summer.framework.orm.domain.Sortable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


/*
 * 岗位
 * @author Likasi
 */
@Getter
@Setter
@Entity
@Table(name="sm_system_position")
public class SystemPosition extends AbstractAuditable<Long,Long> implements Sortable {

    /**
     * 岗位名称
     */
    @Column(name = "name")
    private String name;

    /**
     * 岗位编码
     */
    @Column(name = "code")
    private String code;

    /**
     * 所属部门
     */
    @Column(name = "department_id")
    private Long departmentId;

    /**
     * 岗位类型
     */
    @Column(name = "type")
    private Integer type;

    /**
     * 岗位描述
     */
    @Column(name = "description")
    private String description;

    private Integer sort;
}
