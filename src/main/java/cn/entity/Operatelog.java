package cn.entity;

import java.util.Date;

public class Operatelog {
    private Integer operateid;

    private String userid;

    private String operatename;

    private String objectid;

    private String operatedesc;

    private Date operatetime;

    public Integer getOperateid() {
        return operateid;
    }

    public void setOperateid(Integer operateid) {
        this.operateid = operateid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getOperatename() {
        return operatename;
    }

    public void setOperatename(String operatename) {
        this.operatename = operatename == null ? null : operatename.trim();
    }

    public String getObjectid() {
        return objectid;
    }

    public void setObjectid(String objectid) {
        this.objectid = objectid;
    }

    public String getOperatedesc() {
        return operatedesc;
    }

    public void setOperatedesc(String operatedesc) {
        this.operatedesc = operatedesc == null ? null : operatedesc.trim();
    }

    public Date getOperatetime() {
        return operatetime;
    }

    public void setOperatetime(Date operatetime) {
        this.operatetime = operatetime;
    }
}