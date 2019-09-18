package cn.entity;

import java.util.Date;

public class Message {
    private Integer messageid;

    private String title;

    private String content;

    private Integer type;

    private Date bigintime;

    private Date endtime;

    private Integer fromuserid;

    private Integer ifpublish;

    private Date recordtime;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Integer getFromuserid() {
        return fromuserid;
    }

    public void setFromuserid(Integer fromuserid) {
        this.fromuserid = fromuserid;
    }

    public Integer getIfpublish() {
        return ifpublish;
    }

    public void setIfpublish(Integer ifpublish) {
        this.ifpublish = ifpublish;
    }

    public Date getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(Date recordtime) {
        this.recordtime = recordtime;
    }
}