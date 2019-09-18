package cn.entity;

import java.util.Date;

public class Schedule {
    private Integer scheduleid;

    private String title;

    private String address;

    private Integer meetingid;

    private Date bigintime;

    private Date endtime;

    private String schcontent;

    private Integer createuser;

    private Date createtime;

    private Integer ifprivate;

    public Integer getScheduleid() {
        return scheduleid;
    }

    public void setScheduleid(Integer scheduleid) {
        this.scheduleid = scheduleid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    public Date getBigintime() {
        return bigintime;
    }

    public void setBigintime(Date bigintime) {
        this.bigintime = bigintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getSchcontent() {
        return schcontent;
    }

    public void setSchcontent(String schcontent) {
        this.schcontent = schcontent == null ? null : schcontent.trim();
    }

    public Integer getCreateuser() {
        return createuser;
    }

    public void setCreateuser(Integer createuser) {
        this.createuser = createuser;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getIfprivate() {
        return ifprivate;
    }

    public void setIfprivate(Integer ifprivate) {
        this.ifprivate = ifprivate;
    }
}