package com.summer.iam.domain.model;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Getter
@NoArgsConstructor
@Embeddable
public class Username {
    private String firstName;
    private String lastName;

    public Username(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public String getFullName() {
        String ln = lastName == null ? "" : lastName;
        String fn = firstName == null ? "" : firstName;
        return ln + fn;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Username)) return false;
        Username username1 = (Username) o;
        return Objects.equals(firstName, username1.firstName) && Objects.equals(lastName, username1.lastName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName);
    }
}
