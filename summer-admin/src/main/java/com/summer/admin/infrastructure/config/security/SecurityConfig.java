package com.summer.admin.infrastructure.config.security;

import com.summer.admin.infrastructure.config.jwt.JWTFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig  {

   private final JWTFilter jwtFilter;
   private final JwtAccessDeniedHandler accessDeniedHandler;
   private final JwtAuthenticationEntryPoint authenticationEntryPoint;

   public SecurityConfig(JWTFilter jwtFilter,
                         JwtAccessDeniedHandler accessDeniedHandler,
                         JwtAuthenticationEntryPoint authenticationEntryPoint) {
      this.jwtFilter = jwtFilter;
      this.accessDeniedHandler = accessDeniedHandler;
      this.authenticationEntryPoint = authenticationEntryPoint;
   }

   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
               http
              .csrf(csrf -> csrf.disable())
              .sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
              .authorizeHttpRequests(authz -> authz
                      .requestMatchers("/**").permitAll()
                      .anyRequest().authenticated())
              .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)
              .exceptionHandling(ex -> ex
                      .accessDeniedHandler(accessDeniedHandler)
                      .authenticationEntryPoint(authenticationEntryPoint));
       return http.build();
   }

}
