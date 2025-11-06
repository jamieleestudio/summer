package com.summer.system.convert;

import com.summer.system.dto.SystemPositionDTO;
import com.summer.system.entity.SystemPosition;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*
 *
 * @author Likasi
 */
public class SystemPositionConverter {

    public static List<SystemPositionDTO>  toSystemPositionDTOList(List<SystemPosition> systemPositionList,
                                                                   Map<Long,String> departmentNameMap) {

        List<SystemPositionDTO> systemPositionDTOList = new ArrayList<>();
        SystemPositionDTO systemPositionDTO;
        for(SystemPosition systemPosition : systemPositionList){
            systemPositionDTO = new SystemPositionDTO();
            systemPositionDTO.setId(systemPosition.getId());
            systemPositionDTO.setDepartmentName(departmentNameMap.get(systemPosition.getDepartmentId()));
            systemPositionDTO.setCode(systemPosition.getCode());
            systemPositionDTO.setDescription(systemPosition.getDescription());
            systemPositionDTO.setSort(systemPosition.getSort());
            systemPositionDTO.setName(systemPosition.getName());
//            SystemPositionTypeEnum
            systemPositionDTOList.add(systemPositionDTO);
        }
        return systemPositionDTOList;
    }

}
