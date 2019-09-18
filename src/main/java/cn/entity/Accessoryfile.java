package cn.entity;

import java.util.Date;

public class Accessoryfile {
    private Integer accessoryid;

    private Integer fileid;

    private String accessoryname;

    private Integer accessorysize;

    private Integer accessorytype;

    private Date createdate;

    private String accessorypath;

    public Integer getAccessoryid() {
        return accessoryid;
    }

    public void setAccessoryid(Integer accessoryid) {
        this.accessoryid = accessoryid;
    }

    public Integer getFileid() {
        return fileid;
    }

    public void setFileid(Integer fileid) {
        this.fileid = fileid;
    }

    public String getAccessoryname() {
        return accessoryname;
    }

    public void setAccessoryname(String accessoryname) {
        this.accessoryname = accessoryname == null ? null : accessoryname.trim();
    }

    public Integer getAccessorysize() {
        return accessorysize;
    }

    public void setAccessorysize(Integer accessorysize) {
        this.accessorysize = accessorysize;
    }

    public Integer getAccessorytype() {
        return accessorytype;
    }

    public void setAccessorytype(Integer accessorytype) {
        this.accessorytype = accessorytype;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getAccessorypath() {
        return accessorypath;
    }

    public void setAccessorypath(String accessorypath) {
        this.accessorypath = accessorypath == null ? null : accessorypath.trim();
    }
}