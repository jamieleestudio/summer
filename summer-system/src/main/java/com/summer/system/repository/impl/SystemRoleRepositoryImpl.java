package com.summer.system.repository.impl;


import com.summer.framework.orm.sql.StringSqlBuilder;
import com.summer.framework.orm.sql.StringSqlHelper;
import com.summer.system.entity.SystemRole;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import jakarta.annotation.Resource;
import java.util.List;

@Repository
public class SystemRoleRepositoryImpl {

    @Resource
    private NamedParameterJdbcOperations namedParameterJdbcOperations;

    public List<SystemRole> pageRoleList(String name, Pageable pageable){
        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(name);
        return namedParameterJdbcOperations.query(stringSqlBuilder.toPageString(pageable),stringSqlBuilder.getParamsMap(),new BeanPropertyRowMapper<>(SystemRole.class));
    }

    public Long pageRoleCount(String name){
        StringSqlBuilder stringSqlBuilder = buildSqlBuilder(name);
        return namedParameterJdbcOperations.queryForObject(stringSqlBuilder.toCountString(),stringSqlBuilder.getParamsMap(),Long.class);
    }

    private StringSqlBuilder buildSqlBuilder(String name){

        StringSqlBuilder stringSqlBuilder = new StringSqlBuilder("SELECT r.* FROM sm_system_role AS r ");
        if(StringUtils.isNotBlank(name)){
            stringSqlBuilder.append((" AND r.name LIKE :name"), StringSqlHelper.like(name));
        }
        return stringSqlBuilder;
    }

}
