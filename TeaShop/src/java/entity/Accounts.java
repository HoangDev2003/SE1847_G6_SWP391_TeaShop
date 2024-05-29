/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Huyen Tranq
 */
public class Accounts {
    
    private int account_id;
    private String user_name;
    private String pass_word;
    private int role_id;
    private String email;
    private int status_id;
    private String gender;
    private String address;
    private String phone_number;
    private Date created_at;

    public Accounts() {
    }

    public Accounts(int account_id, String user_name, String pass_word, int role_id, String email, int status_id, String gender, String address, String phone_number, Date created_at) {
        this.account_id = account_id;
        this.user_name = user_name;
        this.pass_word = pass_word;
        this.role_id = role_id;
        this.email = email;
        this.status_id = status_id;
        this.gender = gender;
        this.address = address;
        this.phone_number = phone_number;
        this.created_at = created_at;
    }

   
    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPass_word() {
        return pass_word;
    }

    public void setPass_word(String pass_word) {
        this.pass_word = pass_word;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Accounts{" + "account_id=" + account_id + ", user_name=" + user_name + ", pass_word=" + pass_word + ", role_id=" + role_id + ", email=" + email + ", status_id=" + status_id + ", gender=" + gender + ", address=" + address + ", phone_number=" + phone_number + ", created_at=" + created_at + '}';
    }

   
    
    
}
