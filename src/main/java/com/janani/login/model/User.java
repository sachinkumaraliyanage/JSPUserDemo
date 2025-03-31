package com.janani.login.model;

public class User {
    private String username;
    private String password;
    private boolean loginStatus;
    private String firstName;
    private String lastName;
    private String roles;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String firstName, String lastName, String roles) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.roles = roles;
        this.loginStatus = false;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        if (this.password == null) {
            return null;
        }
        String psw = "";
        for (int i = 0; i < this.password.length(); i++) {
            psw += "*" ;
        }
        return psw;
    }
    public boolean comparePassword(User u) {
        if (u.password == null) {
            return false;
        }
        return u.password.equals(this.password);
    }

    public String[] getCsvRow(){
        String[] row = new String[5];
        row[0] = this.username;
        row[1] = this.password;
        row[2] = this.firstName;
        row[3] = this.lastName;
        row[4] = this.roles;
        return row;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public boolean isLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(boolean loginStatus) {
        this.loginStatus = loginStatus;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
