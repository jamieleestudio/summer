//package com.summer.system.service.impl;
//
//import com.google.common.collect.Lists;
//import com.summer.common.page.PageParam;
//import com.summer.framework.orm.domain.ViewTree;
//import com.summer.system.convert.SystemPositionConverter;
//import com.summer.system.dto.SystemPositionDTO;
//import com.summer.system.dto.SystemPositionQueryDTO;
//import com.summer.system.entity.SystemDepartment;
//import com.summer.system.entity.SystemPosition;
//import com.summer.system.repository.SystemDepartmentRepository;
//import com.summer.system.repository.SystemPositionRepository;
//import com.summer.system.service.SystemDepartmentService;
//import com.summer.system.service.SystemPositionService;
//import org.apache.commons.collections.CollectionUtils;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageImpl;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Service;
//
//import jakarta.annotation.Resource;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
///*
// * 岗位服务
// * @author Likasi
// */
//@Service
//public class SystemPositionServiceImpl implements SystemPositionService {
//
//    @Resource
//    private SystemPositionRepository systemPositionRepository;
//    @Resource
//    private SystemDepartmentRepository systemDepartmentRepository;
//    @Resource
//    private SystemDepartmentService systemDepartmentService;
//
//    @Override
//    public Page<SystemPositionDTO> pagePosition(SystemPositionQueryDTO systemPositionQueryDTO, PageParam pageParam) {
//
//        PageRequest pageRequest = pageParam.toPageRequest();
//        Long count = systemPositionRepository.pagePositionCount(systemPositionQueryDTO);
//        if(count < 1){
//            return new PageImpl<>(Lists.newArrayList(),pageRequest,count);
//        }
//
//        List<SystemPosition> systemPositionList =  systemPositionRepository.pagePosition(systemPositionQueryDTO,pageRequest);
//        //岗位ID
//        List<Long> positionIdList = systemPositionList.stream().map(SystemPosition::getDepartmentId).collect(Collectors.toList());
//        //部门名称map
//        Map<Long,String> departmentNameMap = systemDepartmentRepository.findByIdIn(positionIdList).stream()
//                .collect(Collectors.toMap(SystemDepartment::getId,SystemDepartment::getName));
//        List<SystemPositionDTO> systemPositionDTOList = SystemPositionConverter.toSystemPositionDTOList(systemPositionList,departmentNameMap);
//        return new PageImpl<>(systemPositionDTOList, pageRequest, 0L);
//    }
//
//    @Override
//    public List<ViewTree> findPositionTree() {
//
//        List<ViewTree> systemDepartmentTreeDTOList = systemDepartmentService.findDepartmentTree();
//
//        Iterator<SystemPosition> systemPositionIterator = systemPositionRepository.findAll().iterator();
//
//        List<ViewTree> viewTreeList = Lists.newArrayList();
//        ViewTree viewTree;
//        while (systemPositionIterator.hasNext()){
//            SystemPosition systemPosition = systemPositionIterator.next();
//            viewTree = new ViewTree();
//            viewTree.setId(systemPosition.getId());
//            viewTree.setIsRoot(false);
//            viewTree.setName(systemPosition.getName());
//            viewTree.setPid(systemPosition.getDepartmentId());
//            viewTree.setChildren(Lists.newArrayList());
//            viewTreeList.add(viewTree);
//        }
//
//        Map<Long,List<ViewTree>> departmentIdMap = viewTreeList.stream().collect(Collectors.groupingBy(ViewTree::getPid));
//
//        systemDepartmentTreeDTOList.forEach(item->{
//            setChildren(item.getChildren(),departmentIdMap);
//        });
//        return systemDepartmentTreeDTOList;
//    }
//
//    private void setChildren(List<ViewTree> treeList,Map<Long,List<ViewTree>> departmentIdMap){
//
//        for(ViewTree viewTree :  treeList){
//            viewTree.setDisabled(true);
//            List<ViewTree> list =  departmentIdMap.get(viewTree.getId());
//            if(CollectionUtils.isNotEmpty(list)){
//                viewTree.getChildren().addAll(list);
//            }
////            if(CollectionUtils.isNotEmpty(viewTree.getChildren())){
////                setChildren(viewTree.getChildren(),departmentIdMap);
////            }
//        }
//    }
//
//}
