//package com.summer.admin.service.impl;
//
//import com.google.common.collect.Lists;
//import com.summer.common.page.PageParam;
//import com.summer.admin.convert.SystemRoleConverter;
//import com.summer.admin.dto.SystemRoleDTO;
//import com.summer.admin.entity.SystemRole;
//import com.summer.admin.repository.SystemRoleRepository;
//import com.summer.admin.service.SystemRoleService;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageImpl;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Service;
//
//import jakarta.annotation.Resource;
//import java.util.List;
//
//@Service
//public class SystemRoleServiceImpl implements SystemRoleService {
//
//    @Resource
//    private SystemRoleRepository systemRoleRepository;
//
//    @Override
//    public Page<SystemRoleDTO> pageRole(String name, PageParam pageParam) {
//
//        PageRequest pageRequest = pageParam.toPageRequest();
//        Long count = systemRoleRepository.pageRoleCount(name);
//        if(count < 1){
//            return new PageImpl<>(Lists.newArrayList(),pageRequest,count);
//        }
//        List<SystemRole> systemUserList =  systemRoleRepository.pageRoleList(name,pageRequest);
//        List<SystemRoleDTO> systemUserPageDTOList = SystemRoleConverter.toSystemRoleDTOList(systemUserList);
//        return new PageImpl<>(systemUserPageDTOList, pageRequest, 0L);
//    }
//
//    @Override
//    public List<SystemRoleDTO> findAll() {
//        Iterable<SystemRole> systemUserList = systemRoleRepository.findAll();
//        return  SystemRoleConverter.toSystemRoleDTOList(systemUserList);
//    }
//
//}
