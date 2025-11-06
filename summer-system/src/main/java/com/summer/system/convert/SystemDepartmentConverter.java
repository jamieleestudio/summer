package com.summer.system.convert;

import com.summer.framework.orm.domain.ViewTree;
import com.summer.system.entity.SystemDepartment;

import java.util.ArrayList;
import java.util.List;

/*
 * 部门转换器
 * @author Likasi
 */
public class SystemDepartmentConverter {

    public static List<ViewTree> toSystemDepartmentTreeDTOList(List<SystemDepartment> systemDepartmentList){

        List<ViewTree> systemDepartmentTreeDTOList = new ArrayList<>();
        ViewTree systemDepartmentTreeDTO;
        for(SystemDepartment systemDepartment : systemDepartmentList){
            systemDepartmentTreeDTO = new ViewTree();
            systemDepartmentTreeDTO.setId(systemDepartment.getId());
            systemDepartmentTreeDTO.setPid(systemDepartment.getPid());
            systemDepartmentTreeDTO.setName(systemDepartment.getName());
            systemDepartmentTreeDTO.setIcon(systemDepartment.getIcon());
            systemDepartmentTreeDTO.setIsRoot(systemDepartment.getIsRoot());
            systemDepartmentTreeDTO.setLabel(systemDepartment.getName());
            systemDepartmentTreeDTOList.add(systemDepartmentTreeDTO);
        }
        return systemDepartmentTreeDTOList;

    }

}
