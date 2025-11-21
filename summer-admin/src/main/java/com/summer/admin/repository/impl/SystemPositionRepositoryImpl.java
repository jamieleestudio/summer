//package com.summer.admin.repository.impl;
//
//import com.summer.framework.orm.sql.StringSqlBuilder;
//import com.summer.framework.orm.sql.StringSqlHelper;
//import com.summer.admin.dto.SystemPositionQueryDTO;
//import com.summer.admin.entity.SystemPosition;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.data.domain.Pageable;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
//import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
//import org.springframework.stereotype.Repository;
//
//import jakarta.annotation.Resource;
//import java.util.List;
//
///*
// * 岗位repository
// * @author Likasi
// */
//@Repository
//public class SystemPositionRepositoryImpl {
//
//    @Resource
//    private NamedParameterJdbcOperations namedParameterJdbcOperations;
//
//    public List<SystemPosition> pagePosition(SystemPositionQueryDTO systemPositionQueryDTO, Pageable pageable) {
//        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(systemPositionQueryDTO);
//        return namedParameterJdbcOperations.query(stringSqlBuilder.toPageString(pageable),stringSqlBuilder.getParamsMap(),new BeanPropertyRowMapper<>(SystemPosition.class));
//    }
//
//    public Long pagePositionCount(SystemPositionQueryDTO systemPositionQueryDTO){
//        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(systemPositionQueryDTO);
//        return namedParameterJdbcOperations.queryForObject(stringSqlBuilder.toCountString(),stringSqlBuilder.getParamsMap(),Long.class);
//    }
//
//    private StringSqlBuilder buildSqlBuilder(SystemPositionQueryDTO systemPositionQueryDTO) {
//
//        StringSqlBuilder stringSqlBuilder = new StringSqlBuilder("SELECT * FROM sm_system_position  ");
//
//        if(systemPositionQueryDTO.getDepartmentId() != null) {
//            stringSqlBuilder.append((" AND departmentId = :departmentId"), systemPositionQueryDTO.getDepartmentId());
//        }
//
//        if(StringUtils.isNotBlank(systemPositionQueryDTO.getName())){
//            stringSqlBuilder.append((" AND name LIKE :name"), StringSqlHelper.like(systemPositionQueryDTO.getName()));
//        }
//
//        return stringSqlBuilder;
//    }
//
//}
