package com.summer.iam.interfaces.rest.dto.user;

public class UserResponse {
    private String id;
    private String firstName;
    private String lastName;
    private String account;
    private String email;
    private String phone;
    private Integer gender;
    private String avatar;
    private String description;
    private Boolean enable;
    private String departmentId;
    private String departmentName;
    private java.util.List<String> positionIds;
    private java.util.List<String> positionNames;
    private java.util.List<String> roleIds;
    private java.util.List<String> roleNames;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getAccount() { return account; }
    public void setAccount(String account) { this.account = account; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public Integer getGender() { return gender; }
    public void setGender(Integer gender) { this.gender = gender; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Boolean getEnable() { return enable; }
    public void setEnable(Boolean enable) { this.enable = enable; }
    public String getDepartmentId() { return departmentId; }
    public void setDepartmentId(String departmentId) { this.departmentId = departmentId; }
    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }
    public java.util.List<String> getPositionIds() { return positionIds; }
    public void setPositionIds(java.util.List<String> positionIds) { this.positionIds = positionIds; }
    public java.util.List<String> getPositionNames() { return positionNames; }
    public void setPositionNames(java.util.List<String> positionNames) { this.positionNames = positionNames; }
    public java.util.List<String> getRoleIds() { return roleIds; }
    public void setRoleIds(java.util.List<String> roleIds) { this.roleIds = roleIds; }
    public java.util.List<String> getRoleNames() { return roleNames; }
    public void setRoleNames(java.util.List<String> roleNames) { this.roleNames = roleNames; }
}
