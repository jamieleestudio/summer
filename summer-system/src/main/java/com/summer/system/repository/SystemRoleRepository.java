package com.summer.system.repository;


import com.summer.system.entity.SystemRole;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SystemRoleRepository extends CrudRepository<SystemRole,Long> {


    List<SystemRole> pageRoleList(String name, Pageable pageable);


    Long pageRoleCount(String name);

}
