package com.summer.starter.mongodb;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;


@Getter
@Setter
@Component
@ConfigurationProperties("mongodb.auth")
public class MongodbAuthProperties {


    //数据库名称 (这个才是需要操作的数据库)
    private String database;
    //认证数据库 （这个是认证的数据库，不要和操作的数据库搞错了）
    private String authenticationDatabase;
    //副本集名称
    private String replicaSetName;
    //用户名
    private String userName;
    //密码
    private String password;
    //host
    private String host;


}
