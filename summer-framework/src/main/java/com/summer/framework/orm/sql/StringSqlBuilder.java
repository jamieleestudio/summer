package com.summer.framework.orm.sql;


import com.summer.framework.constants.CommonCharacter;
import com.summer.framework.constants.CommonPattern;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;

public class StringSqlBuilder {

    //sql builder
    private final StringBuilder stringBuilder = new StringBuilder();

    //参数map
    public Map<String, Object> paramsMap  = new HashMap<>();

    public StringSqlBuilder(String sql){
        stringBuilder.append(sql);
    }

    public StringSqlBuilder append(String sql){
        stringBuilder.append(sql);
        return this;
    }

    public StringSqlBuilder append(String sql, Object ...params){
        if(params == null){
            return this;
        }
        Matcher matcher = CommonPattern.COLON_FIRST.matcher(sql);
        int index = 0;
        while (matcher.find()){
            paramsMap.put(matcher.group().replace(CommonCharacter.COLON, ""),params[index]);
            index++;
        }
        stringBuilder.append(sql);
        return this;
    }


    public StringSqlBuilder append(String sql, String paramKey, Object param){
        if(param == null){
            return this;
        }
        stringBuilder.append(sql);
        paramsMap.put(paramKey,param);
        return this;
    }

    @Override
    public String toString() {
        return stringBuilder.toString();
    }

    public String toCountString(){
        return "SELECT COUNT(*) FROM ("+ stringBuilder +") _temp_count";
    }
//
//    public String toPageString(Pageable page){
//        return stringBuilder.append(limitClause(page)).toString();
//    }

//    protected String limitClause(Pageable page) {
//        return " LIMIT " + page.getOffset() + " , " + page.getPageSize();
//    }

    public Map<String, Object> getParamsMap() {
        return paramsMap;
    }

}
