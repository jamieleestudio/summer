package com.summer.system.convert;


import com.google.common.collect.Lists;
import com.summer.system.dto.SystemRoleDTO;
import com.summer.system.entity.SystemRole;

import java.util.List;

public class SystemRoleConverter {


    public static List<SystemRoleDTO> toSystemRoleDTOList(Iterable<SystemRole> systemRoleList){

        List<SystemRoleDTO> systemRoleDTOList = Lists.newArrayList();
        SystemRoleDTO systemRoleDTO;
        for(SystemRole systemRole : systemRoleList){
            systemRoleDTO = new SystemRoleDTO();
            systemRoleDTO.setId(systemRole.getId());
            systemRoleDTO.setName(systemRole.getName());
            systemRoleDTO.setDescription(systemRole.getDescription());
            systemRoleDTO.setSort(systemRole.getSort());
            systemRoleDTOList.add(systemRoleDTO);
        }
        return systemRoleDTOList;
    }

}
