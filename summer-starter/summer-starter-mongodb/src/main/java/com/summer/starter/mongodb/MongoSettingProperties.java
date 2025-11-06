package com.summer.starter.mongodb;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * mongo配置属性
 * 同一时间都以毫秒为单位
 */
@Getter
@Setter

@Component
@PropertySource("classpath:/META-INF/mongodb.properties")
public class MongoSettingProperties {

    //每个主机的最小连接数
    @Value("${spring.mongodb.pool.min-size}")
    private int minSize = 5;

    //每个主机的最大连接数
    @Value("${spring.mongodb.pool.max-size}")
    private int maxSize = 2500;

    //最大等待时间
    @Value("${spring.mongodb.pool.max-wait-time}")
    private long maxWaitTime = 1000 * 60 * 2;

    //最大连接寿命
    @Value("${spring.mongodb.pool.max-connection-life-time}")
    private  long maxConnectionLifeTime;

    //最大连接空闲时间
    @Value("${spring.mongodb.pool.max-connection-idle-time}")
    private  long maxConnectionIdleTime;

    @Value("${spring.mongodb.pool.maintenance-initial-delay}")
    private  long maintenanceInitialDelay;

    @Value("${spring.mongodb.pool.maintenance-frequency}")
    private  long maintenanceFrequency = 1000 * 60;


}
