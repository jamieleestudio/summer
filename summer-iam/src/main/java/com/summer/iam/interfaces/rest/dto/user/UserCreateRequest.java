package com.summer.iam.interfaces.rest.dto.user;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateRequest {
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @NotBlank
    private String account;
    @NotBlank
    private String password;
    private String email;
    private String phone;
    private Integer gender;
    private String avatar;
    private String description;
    private Boolean enable;
    private String departmentId;
    private java.util.List<String> positionIds;
    private java.util.List<String> roleIds;

}
