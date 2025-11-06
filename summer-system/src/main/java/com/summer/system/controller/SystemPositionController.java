package com.summer.system.controller;

import com.summer.common.page.PageParam;
import com.summer.common.web.Result;
import com.summer.framework.orm.domain.ViewTree;
import com.summer.system.dto.SystemPositionDTO;
import com.summer.system.dto.SystemPositionQueryDTO;
import com.summer.system.service.SystemPositionService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.Resource;
import java.util.List;

/**
 * 岗位controller
 */
@RestController
@RequestMapping("/system-permission/position")
public class SystemPositionController {

    @Resource
    private SystemPositionService systemPositionService;

    @GetMapping("/list")
    public Result<Page<SystemPositionDTO>> positionList(SystemPositionQueryDTO systemPositionQueryDTO, PageParam pageParam){
        return Result.success(systemPositionService.pagePosition(systemPositionQueryDTO,pageParam));
    }

    @GetMapping("/tree")
    public Result<List<ViewTree>> findPositionTree(){
        return Result.success(systemPositionService.findPositionTree());
    }


}
