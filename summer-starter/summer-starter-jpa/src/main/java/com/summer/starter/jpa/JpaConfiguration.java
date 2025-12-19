// package com.summer.starter.jpa;

// import jakarta.annotation.Resource;
// import jakarta.persistence.EntityManagerFactory;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
// import org.springframework.orm.jpa.JpaTransactionManager;
// import org.springframework.orm.jpa.JpaVendorAdapter;
// import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
// import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
// import org.springframework.transaction.PlatformTransactionManager;
// import org.springframework.transaction.annotation.EnableTransactionManagement;

// import javax.sql.DataSource;
// import java.util.HashMap;
// import java.util.Map;

// /**
//  *
//  * JPA configuration
//  *
//  * @author lixf
//  */
// @EnableJpaRepositories(basePackages = {"com.summer"})
// @EnableTransactionManagement
// public class JpaConfiguration {

//     @Resource private DataSource dataSource;

//     @Bean
//     public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

//         LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
//         factory.setPackagesToScan("com.summer.**.entity");
//         // JPA Hibernate adapter
//         JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
//         factory.setJpaVendorAdapter(vendorAdapter);
//         factory.setDataSource(dataSource);
//         Map<String,Object> japPropertyMap = new HashMap<>();
//         // JPA tenant routing interceptor
// //        japPropertyMap.put(AvailableSettings.STATEMENT_INSPECTOR,new JpaTenantRoutingInspector());
//         factory.setJpaPropertyMap(japPropertyMap);

//         return factory;
//     }

//     @Bean
//     public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
//         return new JpaTransactionManager(entityManagerFactory);
//     }

// }
