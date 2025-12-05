package com.summer.iam.application.command;

import lombok.Getter;
import lombok.Setter;
import java.util.List;

@Getter
@Setter
public class UserCreateCommand {
    private String firstName;
    private String lastName;
    private String account;
    private String password;
    private String email;
    private String phone;
    private Integer gender;
    private String avatar;
    private String description;
    private Boolean enable;
    private String departmentId;
    private List<String> positionIds;
    private List<String> roleIds;
}
