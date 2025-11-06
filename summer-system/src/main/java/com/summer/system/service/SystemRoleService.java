package com.summer.system.service;


import com.summer.common.page.PageParam;
import com.summer.system.dto.SystemRoleDTO;
import org.springframework.data.domain.Page;

import java.util.List;

public interface SystemRoleService {


    Page<SystemRoleDTO>  pageRole(String name, PageParam pageParam);

    List<SystemRoleDTO>  findAll();

}
