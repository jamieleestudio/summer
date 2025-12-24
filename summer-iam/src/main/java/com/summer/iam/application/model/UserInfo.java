package com.summer.iam.application.model;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.model.User;

import java.util.ArrayList;
import java.util.List;

public class UserInfo {
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
    private List<String> positionIds;
    private List<String> positionNames;
    private List<String> roleIds;
    private List<String> roleNames;

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
    public List<String> getPositionIds() { return positionIds; }
    public void setPositionIds(List<String> positionIds) { this.positionIds = positionIds; }
    public List<String> getPositionNames() { return positionNames; }
    public void setPositionNames(List<String> positionNames) { this.positionNames = positionNames; }
    public List<String> getRoleIds() { return roleIds; }
    public void setRoleIds(List<String> roleIds) { this.roleIds = roleIds; }
    public List<String> getRoleNames() { return roleNames; }
    public void setRoleNames(List<String> roleNames) { this.roleNames = roleNames; }

    public static UserInfo from(User u) {
        UserInfo info = new UserInfo();
        info.setId(u.getId());
        var username = u.getUsername();
        if(username != null){
            info.setFirstName(username.getFirstName());
            info.setLastName(username.getLastName());
        }
        info.setAccount(u.getAccount());
        info.setEmail(u.getEmail());
        info.setPhone(u.getPhone());
        info.setGender(u.getGender());
        info.setAvatar(u.getAvatar());
        info.setDescription(u.getDescription());
        info.setEnable(u.getEnable());
        
        Department d = u.getDepartment();
        if (d != null) {
            info.setDepartmentId(d.getId());
            info.setDepartmentName(d.getName());
        }
        
        List<Position> pos = u.getPositions();
        if (pos != null) {
            List<String> pids = new ArrayList<>();
            List<String> pnames = new ArrayList<>();
            for (Position p : pos) { pids.add(p.getId()); pnames.add(p.getName()); }
            info.setPositionIds(pids);
            info.setPositionNames(pnames);
        }
        
        List<Role> roles = u.getRoles();
        if (roles != null) {
            List<String> rids = new ArrayList<>();
            List<String> rnames = new ArrayList<>();
            for (Role role : roles) { rids.add(role.getId()); rnames.add(role.getName()); }
            info.setRoleIds(rids);
            info.setRoleNames(rnames);
        }
        return info;
    }
}
