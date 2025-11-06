package com.summer.system.repository.impl;

import com.summer.framework.orm.sql.StringSqlBuilder;
import com.summer.framework.orm.sql.StringSqlHelper;
import com.summer.system.dto.SystemUserQueryDTO;
import com.summer.system.entity.SystemUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import jakarta.annotation.Resource;
import java.util.List;

/**
 * 用户repository
 */
@Repository
public class SystemUserRepositoryImpl{

    @Resource
    private NamedParameterJdbcOperations namedParameterJdbcOperations;

    public List<SystemUser> pageUserList(SystemUserQueryDTO systemUserPageSearchDTO, Pageable pageable){

        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(systemUserPageSearchDTO);
        return namedParameterJdbcOperations.query(stringSqlBuilder.toPageString(pageable),stringSqlBuilder.getParamsMap(),new BeanPropertyRowMapper<>(SystemUser.class));
    }


    private StringSqlBuilder buildSqlBuilder(SystemUserQueryDTO systemUserPageSearchDTO){

        StringSqlBuilder stringSqlBuilder = new StringSqlBuilder("SELECT u.* FROM sm_system_user AS u  WHERE u.deleted = false");
        if(StringUtils.isNotBlank(systemUserPageSearchDTO.getValue())){
            stringSqlBuilder.append((" AND u."+systemUserPageSearchDTO.getKey()+" LIKE :searchKey"), StringSqlHelper.like(systemUserPageSearchDTO.getValue()));
        }
        return stringSqlBuilder;
    }


    public Long pageUserCount(SystemUserQueryDTO systemUserPageSearchDTO){
        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(systemUserPageSearchDTO);
        return namedParameterJdbcOperations.queryForObject(stringSqlBuilder.toCountString(),stringSqlBuilder.getParamsMap(),Long.class);
    }

}
