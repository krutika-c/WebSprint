package com.websprint.backend.Model;

/**
 * Matches the field names used in signup.html's <form> (fullName, email,
 * password, confirmPassword). Kept separate from MyAppUser so the entity's
 * columns (full_name, password_hash, ...) never have to change.
 */
public class SignupRequest {

    private String fullName;
    private String email;
    private String password;
    private String confirmPassword;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}