package com.summer.system.repository;

import com.summer.system.entity.SystemDepartment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/*
 * 部门 repository
 * @author Likasi
 */
public interface SystemDepartmentRepository extends CrudRepository<SystemDepartment,Long>  {


    List<SystemDepartment> findByIdIn(List<Long> idList);

}
