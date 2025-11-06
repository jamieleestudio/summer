//package com.summer.system.service;
//
//import com.summer.common.page.PageParam;
//import com.summer.system.dto.SystemUserDTO;
//import com.summer.system.dto.SystemUserQueryDTO;
//import com.summer.system.dto.SystemUserSaveDTO;
//import org.springframework.data.domain.Page;
//
///**
// * 系统用户服务
// * @author Likasi
// */
//public interface SystemUserService {
//
//    /**
//     * 用户列表分页
//     * @param systemUserPageSearchDTO 查询参数
//     * @param pageParam 分页参数
//     * @return Page<SystemUserPageDTO>
//     */
//    Page<SystemUserDTO> pageUser(SystemUserQueryDTO systemUserPageSearchDTO, PageParam pageParam);
//
//    /**
//     * 保存用户
//     * @param systemUserSaveDTO 用户信息
//     */
//    void saveUser(SystemUserSaveDTO systemUserSaveDTO);
//
//    /**
//     * 删除用户
//     * @param id 用户id
//     */
//    void deleteUser(Long id);
//
//}
