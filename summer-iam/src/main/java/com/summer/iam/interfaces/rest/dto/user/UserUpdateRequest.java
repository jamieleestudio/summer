package com.summer.iam.interfaces.rest.dto.user;

public class UserUpdateRequest {
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
    private java.util.List<String> positionIds;
    private java.util.List<String> roleIds;

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getAccount() { return account; }
    public void setAccount(String account) { this.account = account; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
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
    public java.util.List<String> getPositionIds() { return positionIds; }
    public void setPositionIds(java.util.List<String> positionIds) { this.positionIds = positionIds; }
    public java.util.List<String> getRoleIds() { return roleIds; }
    public void setRoleIds(java.util.List<String> roleIds) { this.roleIds = roleIds; }
}
