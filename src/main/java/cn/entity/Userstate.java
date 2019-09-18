package cn.entity;

public class Userstate {
    private Integer userstateid;

    private String userstatename;

    public Integer getUserstateid() {
        return userstateid;
    }

    public void setUserstateid(Integer userstateid) {
        this.userstateid = userstateid;
    }

    public String getUserstatename() {
        return userstatename;
    }

    public void setUserstatename(String userstatename) {
        this.userstatename = userstatename == null ? null : userstatename.trim();
    }
}