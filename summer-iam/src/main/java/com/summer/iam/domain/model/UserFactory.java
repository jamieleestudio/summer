package com.summer.iam.domain.model;

import java.util.List;

public final class UserFactory {
    private UserFactory() {}

    public static User create(
            String firstName,
            String lastName,
            String account,
            String encodedPassword,
            String email,
            String phone,
            Integer gender,
            String avatar,
            String description,
            Boolean enable,
            Department department,
            List<Position> positions,
            List<Role> roles
    ) {
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setAccount(account);
        user.setPassword(encodedPassword);
        user.setEmail(email);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAvatar(avatar);
        user.setDescription(description);
        user.setEnable(enable != null ? enable : Boolean.TRUE);
        user.setDepartment(department);
        user.setPositions(positions);
        user.setRoles(roles);
        return user;
    }
}
