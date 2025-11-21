package com.summer.admin.infrastructure.config.security;

import com.summer.admin.infrastructure.persistence.entity.SystemUserEntity;
import com.summer.admin.infrastructure.persistence.repository.SystemUserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

/**
 * Custom UserDetailsService implementation for authentication
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final SystemUserRepository systemUserRepository;

    public CustomUserDetailsService(SystemUserRepository systemUserRepository) {
        this.systemUserRepository = systemUserRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SystemUserEntity user = systemUserRepository.findByAccount(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with username: " + username));

        // Check if user is enabled and not deleted
        if (Boolean.TRUE.equals(user.getDeleted())) {
            throw new UsernameNotFoundException("User is deleted: " + username);
        }

        if (Boolean.FALSE.equals(user.getEnable())) {
            throw new UsernameNotFoundException("User is disabled: " + username);
        }

        // For now, assigning a default role. You can extend this to fetch actual roles from database
        List<GrantedAuthority> authorities = Collections.singletonList(
                new SimpleGrantedAuthority("ROLE_USER")
        );

        return User.builder()
                .username(user.getAccount())
                .password(user.getPassword())
                .authorities(authorities)
                .accountExpired(false)
                .accountLocked(false)
                .credentialsExpired(false)
                .disabled(Boolean.FALSE.equals(user.getEnable()))
                .build();
    }
}
