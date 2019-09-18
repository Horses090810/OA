package cn.entity;

import java.util.Date;

public class Loginlog {
    private Integer loginid;

    private String userid;

    private Date logintime;

    private Integer ifsuccess;

    private String loginuserip;

    private String logindesc;

    public Integer getLoginid() {
        return loginid;
    }

    public void setLoginid(Integer loginid) {
        this.loginid = loginid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Date getLogintime() {
        return logintime;
    }

    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    public Integer getIfsuccess() {
        return ifsuccess;
    }

    public void setIfsuccess(Integer ifsuccess) {
        this.ifsuccess = ifsuccess;
    }

    public String getLoginuserip() {
        return loginuserip;
    }

    public void setLoginuserip(String loginuserip) {
        this.loginuserip = loginuserip == null ? null : loginuserip.trim();
    }

    public String getLogindesc() {
        return logindesc;
    }

    public void setLogindesc(String logindesc) {
        this.logindesc = logindesc == null ? null : logindesc.trim();
    }
}