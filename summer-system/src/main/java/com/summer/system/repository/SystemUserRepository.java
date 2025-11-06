//package com.summer.system.repository;
//
//import com.summer.system.dto.SystemUserQueryDTO;
//import com.summer.system.entity.SystemUser;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//
//import java.util.List;
//
///**
// * 用户repository
// */
//public interface SystemUserRepository  extends JpaRepository<SystemUser,Long> {
//
//
//    /**
//     * 分页查询用户列表
//     * @param systemUserPageSearchDTO 查询参数
//     * @param pageable 分页参数
//     * @return List<SystemUser>
//     */
//    List<SystemUser> pageUserList(SystemUserQueryDTO systemUserPageSearchDTO, Pageable pageable);
//
//    /**
//     * 分页查询用户列表计数
//     * @param systemUserPageSearchDTO 查询参数
//     * @return Long
//     */
//    Long pageUserCount(SystemUserQueryDTO systemUserPageSearchDTO);
//
//    /**
//     * 逻辑删除用户
//     * @param id 用户id
//     */
//    @Modifying
//    @Query("UPDATE  SystemUser su SET su.deleted=true WHERE su.id=:id")
//    void  logicDeleteUser(Long id);
//}
