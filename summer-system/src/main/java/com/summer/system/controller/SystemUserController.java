package com.summer.system.controller;

import com.summer.common.page.PageParam;
import com.summer.common.web.Result;
import com.summer.system.dto.SystemUserDTO;
import com.summer.system.dto.SystemUserQueryDTO;
import com.summer.system.dto.SystemUserSaveDTO;
import com.summer.system.service.SystemUserService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import jakarta.annotation.Resource;

@RestController
@RequestMapping("/system-permission/user")
public class SystemUserController {

    @Resource
    private SystemUserService systemUserService;

    /**
     * 获取用户分页列表
     * @param systemUserPageSearchDTO 查询参数
     * @param pageParam 分页参数
     * @return Result<Page<SystemUserPageDTO>>
     */
    @GetMapping("/list")
    public Result<Page<SystemUserDTO>> pageUser(SystemUserQueryDTO systemUserPageSearchDTO, PageParam pageParam){
        return Result.success(systemUserService.pageUser(systemUserPageSearchDTO,pageParam));
    }

    /**
     * 保存用户
     * @param systemUserSaveDTO 用户信息
     * @return Result<Object>
     */
    @PostMapping("/save")
    public Result<Object> saveUser(SystemUserSaveDTO systemUserSaveDTO){
        systemUserService.saveUser(systemUserSaveDTO);
        return Result.success();
    }

    /**
     * 删除用户
     * @param id 用户id
     * @return Result<Object>
     */
    @GetMapping("/{id}/delete")
    public Result<Object> deleteUser(@PathVariable Long id){
        systemUserService.deleteUser(id);
        return Result.success();
    }

}


