package com.summer.admin.entity;

import com.summer.framework.orm.domain.AbstractPersistable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


/*
 * 用户和部门关系
 * @author Likasi
 */
@Getter
@Setter
@Entity
@Table(name="sm_system_user_department")
public class SystemUserDepartment extends AbstractPersistable<Long> {


    @Column(name = "user_id")
    private Long userId;

    @Column(name = "department_id")
    private Long departmentId;
}
