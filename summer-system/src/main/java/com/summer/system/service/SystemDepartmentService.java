package com.summer.system.service;

import com.summer.framework.orm.domain.ViewTree;

import java.util.List;

/*
 * 部门服务
 * @author Likasi
 */
public interface SystemDepartmentService {


    List<ViewTree> findDepartmentTree();

}
