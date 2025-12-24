package com.summer.iam.infrastructure.config.security;

import com.summer.iam.infrastructure.config.jwt.JWTFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration(proxyBeanMethods = false)
@EnableWebSecurity
@EnableMethodSecurity
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
   public PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
   }

   @Bean
   public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)  {
      return authenticationConfiguration.getAuthenticationManager();
   }

   @Bean
   public DaoAuthenticationProvider authenticationProvider(UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
      DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider(userDetailsService);
      authProvider.setPasswordEncoder(passwordEncoder);
      return authProvider;
   }

   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http){
               http
              .csrf(AbstractHttpConfigurer::disable)
             .sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .authorizeHttpRequests(authz -> authz
                      .requestMatchers("/auth/**").permitAll()
                      .requestMatchers("/v3/api-docs/**", "/swagger-ui/**", "/swagger-ui.html", "/webjars/**").permitAll()
                      .requestMatchers("/admin/**").hasAnyAuthority("PERM_ADMIN","ROLE_ADMIN")
                      .anyRequest().authenticated())
              .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)
              .exceptionHandling(ex -> ex
                      .accessDeniedHandler(accessDeniedHandler)
                      .authenticationEntryPoint(authenticationEntryPoint));
       return http.build();
   }

}