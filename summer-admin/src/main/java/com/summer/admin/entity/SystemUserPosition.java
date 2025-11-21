package com.summer.admin.entity;

import com.summer.framework.orm.domain.AbstractPersistable;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.*;


/*
 * 用户职位关系
 * @author Likasi
 * @date 15/05/2021 22:58
 */
@Getter
@Setter
@Entity
@Table(name="sm_system_user_position")
public class SystemUserPosition extends AbstractPersistable<Long> {

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "position_id")
    private Long positionId;

}
