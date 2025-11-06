package com.summer.starter.mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import org.springframework.context.annotation.Bean;


//@EnableMongoRepositories(basePackages = {"com.yineng"},basePackageClasses = MongoRepository.class)
//@ComponentScan(basePackages = { "com.yineng" })
public class MongodbSingleConfiguration  {

    /*
     * Use the standard Mongo driver API to create a com.mongodb.client.MongoClient instance.
     */
    public @Bean
    MongoClient mongoClient() {
        return MongoClients.create("mongodb://localhost:27017");
    }


}
