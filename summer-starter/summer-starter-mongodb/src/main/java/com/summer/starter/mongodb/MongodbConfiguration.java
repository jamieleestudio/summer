package com.summer.starter.mongodb;

import com.mongodb.MongoClientSettings;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.connection.ClusterSettings;
import com.mongodb.connection.ConnectionPoolSettings;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.MongoTransactionManager;
import org.springframework.data.mongodb.config.AbstractMongoClientConfiguration;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

import jakarta.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * java config 的方式配置mongodb
 * host经过处理（自约束格式 address:host,address:host,注意：springboot自动解析不是这种格式）
 */
//@EnableMongoRepositories(basePackages = {"com.summer"},basePackageClasses = MongoRepository.class)
@ComponentScan(basePackages = { "com.summer" })
public class MongodbConfiguration extends AbstractMongoClientConfiguration {

    @Resource
    private MongodbAuthProperties mongodbAuthProperties;
    @Resource
    private MongoSettingProperties mongoSettingProperties;

    @Override
    protected String getDatabaseName() {
        return mongodbAuthProperties.getDatabase();
    }

    @Override
    public void configureClientSettings(MongoClientSettings.Builder builder){

        ClusterSettings.Builder clusterSettingsBuilder = ClusterSettings.builder();
        clusterSettingsBuilder.hosts(this.buildServerAddress());
        //设置副本集名称
        clusterSettingsBuilder.requiredReplicaSetName(mongodbAuthProperties.getReplicaSetName());

        //认证
        builder.credential(MongoCredential.createCredential(
                mongodbAuthProperties.getUserName(),
                mongodbAuthProperties.getAuthenticationDatabase(),
                mongodbAuthProperties.getPassword().toCharArray()));
        //应用ClusterSettings
        builder.applyToClusterSettings(item->item.applySettings(clusterSettingsBuilder.build()));
        //应用ConnectionPoolSettings (连接池配置)
        builder.applyToConnectionPoolSettings(item->item.applySettings(this.buildPoolSetting().build()));
    }

    /**
     * 连接池相关配置
     * @return ConnectionPoolSettings.Builder
     */
    private ConnectionPoolSettings.Builder buildPoolSetting(){
        ConnectionPoolSettings.Builder poolBuilder = ConnectionPoolSettings.builder();
        poolBuilder.maxSize(mongoSettingProperties.getMaxSize());
        poolBuilder.minSize(mongoSettingProperties.getMinSize());
        poolBuilder.maxWaitTime(mongoSettingProperties.getMaxWaitTime(), TimeUnit.MILLISECONDS);
        poolBuilder.maxConnectionIdleTime(mongoSettingProperties.getMaxConnectionIdleTime(), TimeUnit.MILLISECONDS);
        poolBuilder.maxConnectionLifeTime(mongoSettingProperties.getMaxConnectionLifeTime(), TimeUnit.MILLISECONDS);
        poolBuilder.maintenanceInitialDelay(mongoSettingProperties.getMaintenanceInitialDelay(), TimeUnit.MILLISECONDS);
        poolBuilder.maintenanceFrequency(mongoSettingProperties.getMaintenanceFrequency(), TimeUnit.MILLISECONDS);
        return poolBuilder;
    }


    @Bean
    public MongoTransactionManager mongoTransactionManager(MongoDatabaseFactory mongoDatabaseFactory) {
        return new MongoTransactionManager(mongoDatabaseFactory);
    }

    /**
     * 此处将 spring.data.mongodb.host 构建成 List<ServerAddress>
     * @return List<ServerAddress>
     */
    private List<ServerAddress> buildServerAddress(){
        String hosts = mongodbAuthProperties.getHost();
        String[] hs = hosts.split(",");
        List<ServerAddress> serverAddressList = new ArrayList<>();
        for(String h : hs){
            String[]addArr = h.split(":");
            serverAddressList.add(new ServerAddress(addArr[0], Integer.parseInt(addArr[1])));
        }
        return serverAddressList;
    }


}
