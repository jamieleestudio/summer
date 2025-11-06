//package com.summer.system.service.impl;
//
//import com.google.common.collect.Lists;
//import com.summer.common.page.PageParam;
//import com.summer.system.convert.SystemRoleConverter;
//import com.summer.system.dto.SystemRoleDTO;
//import com.summer.system.entity.SystemRole;
//import com.summer.system.repository.SystemRoleRepository;
//import com.summer.system.service.SystemRoleService;
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
