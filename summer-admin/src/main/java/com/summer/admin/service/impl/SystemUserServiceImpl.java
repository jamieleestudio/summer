//package com.summer.admin.service.impl;
//
//import com.google.common.collect.Lists;
//import com.summer.admin.convert.SystemUserConverter;
//import com.summer.admin.dto.SystemUserDTO;
//import com.summer.admin.dto.SystemUserQueryDTO;
//import com.summer.admin.dto.SystemUserSaveDTO;
//import com.summer.admin.entity.SystemUser;
//import com.summer.admin.repository.SystemUserRepository;
//import com.summer.admin.service.SystemUserService;
//import jakarta.annotation.Resource;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageImpl;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.List;
//
///**
// * 系统用户服务
// * @author Likasi
// */
//@Service
//@Transactional
//public class SystemUserServiceImpl implements SystemUserService {
//
//    @Resource
//    private SystemUserRepository systemUserRepository;
//
//    @Override
//    public Page<SystemUserDTO> pageUser(SystemUserQueryDTO systemUserPageSearchDTO, PageParam pageParam) {
//
//        PageRequest pageRequest = pageParam.toPageRequest();
//
//        Long count = systemUserRepository.pageUserCount(systemUserPageSearchDTO);
//        if(count < 1){
//            return new PageImpl<>(Lists.newArrayList(),pageRequest,count);
//        }
//        List<SystemUser> systemUserList =  systemUserRepository.pageUserList(systemUserPageSearchDTO,pageRequest);
//        List<SystemUserDTO> systemUserPageDTOList = SystemUserConverter.toSystemUserPageDTO(systemUserList);
//
//        return new PageImpl<>(systemUserPageDTOList, pageRequest, 0L);
//    }
//
//    @Override
//    public void saveUser(SystemUserSaveDTO systemUserSaveDTO) {
//        SystemUser systemUser = SystemUserConverter.newSystemUser(systemUserSaveDTO);
////        systemUserRepository.save(systemUser);
//    }
//
//    @Override
//    public void deleteUser(Long id) {
//        systemUserRepository.logicDeleteUser(id);
//    }
//}
