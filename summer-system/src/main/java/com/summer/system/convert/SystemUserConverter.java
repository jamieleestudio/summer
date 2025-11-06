package com.summer.system.convert;

import com.google.common.collect.Lists;
import com.summer.framework.orm.enums.EnabledEnum;
import com.summer.framework.orm.enums.GenderEnum;
import com.summer.system.dto.SystemUserDTO;
import com.summer.system.dto.SystemUserSaveDTO;
import com.summer.system.entity.SystemUser;

import java.util.List;

/**
 * 用户转换
 * @author lixf
 */
public class SystemUserConverter {

    public static List<SystemUserDTO> toSystemUserPageDTO(List<SystemUser> systemUserList){

        List<SystemUserDTO> systemUserPageDTOList = Lists.newArrayList();

        SystemUserDTO systemUserPageDTO ;
        for(SystemUser systemUser : systemUserList){
            systemUserPageDTO = new SystemUserDTO();
            systemUserPageDTO.setGender(systemUser.getGender());
            systemUserPageDTO.setGenderStr(GenderEnum.getDesc(systemUser.getGender()));
            systemUserPageDTO.setPhone(systemUser.getPhone());
            systemUserPageDTO.setName(systemUser.getUsername());
            systemUserPageDTO.setAccount(systemUser.getAccount());
            systemUserPageDTO.setEnable(EnabledEnum.getDesc(systemUser.getEnable()));
            systemUserPageDTO.setDescription(systemUser.getDescription());
            systemUserPageDTOList.add(systemUserPageDTO);
        }

        return systemUserPageDTOList;
    }

    public static SystemUser newSystemUser(SystemUserSaveDTO systemUserSaveDTO){
        SystemUser systemUser = new SystemUser();
        systemUser.setAccount(systemUserSaveDTO.getAccount());
        systemUser.setUsername(systemUserSaveDTO.getName());
        systemUser.setAvatar(systemUserSaveDTO.getAvatar());
        systemUser.setDescription(systemUserSaveDTO.getDescription());
        systemUser.setEmail(systemUserSaveDTO.getEmail());
        systemUser.setPhone(systemUserSaveDTO.getPhone());
        systemUser.setGender(systemUserSaveDTO.getGender());
        systemUser.setEnable(systemUserSaveDTO.getEnable());
//
//        if(systemUserSaveDTO.getId() != null){
//            systemUser.setId(systemUserSaveDTO.getId());
//        }else{
//            systemUser.setDeleted(Boolean.FALSE);
//        }
        return systemUser;
    }

}
