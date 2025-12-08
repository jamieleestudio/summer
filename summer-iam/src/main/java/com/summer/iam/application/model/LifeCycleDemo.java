package com.summer.iam.application.model;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

@Component
public class LifeCycleDemo implements InitializingBean, DisposableBean {
  @PostConstruct
  void initA() { System.out.println("PostConstruct A"); }

  @PostConstruct
  void initB() { System.out.println("PostConstruct B"); }

  @Override
  public void afterPropertiesSet() { System.out.println("afterPropertiesSet"); }

  public void customInit() { System.out.println("init-method"); }

  @PreDestroy
  void preDestroy() { System.out.println("PreDestroy"); }

  @Override
  public void destroy() { System.out.println("destroy"); }
}
