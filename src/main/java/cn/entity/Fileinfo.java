package cn.entity;

import java.util.Date;

public class Fileinfo {
    private Integer fileid;

    private String filename;

    private Integer filetype;

    private String remark;

    private String fileowner;

    private Date createdate;

    private Integer parentid;

    private String filepath;

    private Integer ifdelete;

    public Integer getFileid() {
        return fileid;
    }

    public void setFileid(Integer fileid) {
        this.fileid = fileid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public Integer getFiletype() {
        return filetype;
    }

    public void setFiletype(Integer filetype) {
        this.filetype = filetype;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getFileowner() {
        return fileowner;
    }

    public void setFileowner(String fileowner) {
        this.fileowner = fileowner == null ? null : fileowner.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath == null ? null : filepath.trim();
    }

    public Integer getIfdelete() {
        return ifdelete;
    }

    public void setIfdelete(Integer ifdelete) {
        this.ifdelete = ifdelete;
    }
}