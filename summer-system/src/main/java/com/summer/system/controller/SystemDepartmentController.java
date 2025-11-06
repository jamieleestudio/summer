package com.summer.system.controller;

import com.summer.common.web.Result;
import com.summer.framework.orm.domain.ViewTree;
import com.summer.system.service.SystemDepartmentService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.Resource;
import java.util.List;

/*
 * 部门controller
 * @author Likasi
 */
@RestController
@RequestMapping("/system-permission/department")
public class SystemDepartmentController {

    @Resource
    private SystemDepartmentService systemDepartmentService;

    /**
     * 获取用户分页列表
     * @return Result<List<SystemDepartmentTreeDTO>>
     */
    @GetMapping("/tree")
    public Result<List<ViewTree>> findDepartmentTree(){
        return Result.success(systemDepartmentService.findDepartmentTree());
    }

}
