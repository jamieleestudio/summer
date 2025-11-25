package com.summer.iam.infrastructure.config.security;

import com.summer.iam.infrastructure.persistence.entity.UserEntity;
import com.summer.iam.infrastructure.persistence.entity.UserRoleEntity;
import com.summer.iam.infrastructure.persistence.entity.RolePermissionEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemUserRepository;
import com.summer.iam.infrastructure.persistence.repository.SystemUserRoleRepository;
import com.summer.iam.infrastructure.persistence.repository.SystemRoleRepository;
import com.summer.iam.infrastructure.persistence.repository.SystemRolePermissionRepository;
import com.summer.iam.infrastructure.persistence.repository.SystemPermissionRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Custom UserDetailsService implementation for authentication
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final SystemUserRepository systemUserRepository;
    private final SystemUserRoleRepository userRoleRepository;
    private final SystemRoleRepository roleRepository;
    private final SystemRolePermissionRepository rolePermissionRepository;
    private final SystemPermissionRepository permissionRepository;

    public CustomUserDetailsService(SystemUserRepository systemUserRepository,
                                    SystemUserRoleRepository userRoleRepository,
                                    SystemRoleRepository roleRepository,
                                    SystemRolePermissionRepository rolePermissionRepository,
                                    SystemPermissionRepository permissionRepository) {
        this.systemUserRepository = systemUserRepository;
        this.userRoleRepository = userRoleRepository;
        this.roleRepository = roleRepository;
        this.rolePermissionRepository = rolePermissionRepository;
        this.permissionRepository = permissionRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = systemUserRepository.findByAccount(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with username: " + username));

        // Check if user is enabled and not deleted
        if (Boolean.TRUE.equals(user.getDeleted())) {
            throw new UsernameNotFoundException("User is deleted: " + username);
        }

        if (Boolean.FALSE.equals(user.getEnable())) {
            throw new UsernameNotFoundException("User is disabled: " + username);
        }

        java.util.List<GrantedAuthority> authorities = new java.util.ArrayList<>();
        java.util.List<UserRoleEntity> userRoles = userRoleRepository.findAllByUserId(user.getId());
        for (UserRoleEntity ur : userRoles) {
            roleRepository.findById(ur.getRoleId()).ifPresent(role -> {
                authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getName()));
                java.util.List<RolePermissionEntity> rolePerms = rolePermissionRepository.findAllByRoleId(role.getId());
                for (RolePermissionEntity rp : rolePerms) {
                    permissionRepository.findById(rp.getPermissionId()).ifPresent(perm -> {
                        authorities.add(new SimpleGrantedAuthority("PERM_" + perm.getCode()));
                    });
                }
            });
        }

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
