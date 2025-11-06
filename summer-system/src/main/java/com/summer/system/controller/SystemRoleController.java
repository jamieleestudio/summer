package com.summer.system.controller;


import com.summer.common.page.PageParam;
import com.summer.common.web.Result;
import com.summer.system.dto.SystemRoleDTO;
import com.summer.system.service.SystemRoleService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/system-permission/role")
public class SystemRoleController {

    @Resource
    private SystemRoleService systemRoleService;

    @GetMapping("/list")
    public Result<Page<SystemRoleDTO>> roleList(String name, PageParam pageParam){
        return Result.success(systemRoleService.pageRole(name,pageParam));
    }

    @GetMapping("/listAll")
    public Result<List<SystemRoleDTO>> roleList(){
        return Result.success(systemRoleService.findAll());
    }

}
