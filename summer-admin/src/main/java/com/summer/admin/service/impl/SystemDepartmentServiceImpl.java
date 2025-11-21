//package com.summer.admin.service.impl;
//
//import com.google.common.collect.Lists;
//import com.summer.framework.orm.domain.ViewTree;
//import com.summer.framework.orm.orm.Transactional;
//import com.summer.admin.convert.SystemDepartmentConverter;
//import com.summer.admin.entity.SystemDepartment;
//import com.summer.admin.repository.SystemDepartmentRepository;
//import com.summer.admin.service.SystemDepartmentService;
//import org.apache.commons.collections.CollectionUtils;
//import org.springframework.stereotype.Service;
//
//import jakarta.annotation.Resource;
//import java.util.Comparator;
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
///*
// * 部门服务
// * @author Likasi
// */
//@Service
//@Transactional
//public class SystemDepartmentServiceImpl implements SystemDepartmentService {
//
//    @Resource
//    private SystemDepartmentRepository systemDepartmentRepository;
//
//    private  List<ViewTree> buildTree(List<ViewTree> list) {
//
//        list.sort(Comparator.comparing(ViewTree::getId));
//        Map<Object, List<ViewTree>> son = list.stream().filter(node->!node.getIsRoot()).collect(Collectors.groupingBy(ViewTree::getPid));
//
//        list.forEach(node -> {
//            List<ViewTree> viewTreeList  = son.get(node.getId());
//            if(CollectionUtils.isNotEmpty(viewTreeList)){
//                node.setChildren(viewTreeList);
//            }else{
//                node.setChildren(Lists.newArrayList());
//            }
//        });
//        return list.stream().filter(ViewTree::getIsRoot).collect(Collectors.toList());
//    }
//
//    @Override
//    public List<ViewTree> findDepartmentTree() {
//
//        Iterable<SystemDepartment> systemDepartmentIterable =  systemDepartmentRepository.findAll();
//
//        List<ViewTree> systemDepartmentTreeDTOList =
//                SystemDepartmentConverter.toSystemDepartmentTreeDTOList(Lists.newArrayList(systemDepartmentIterable));
//
//        return buildTree(systemDepartmentTreeDTOList);
//    }
//
//
//}
