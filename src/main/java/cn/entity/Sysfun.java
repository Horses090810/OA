package cn.entity;

public class Sysfun {
    private Integer nodeid;

    private String displayname;

    private String nodeurl;

    private Integer displayorder;

    private Integer parentnodeid;

    public Integer getNodeid() {
        return nodeid;
    }

    public void setNodeid(Integer nodeid) {
        this.nodeid = nodeid;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname == null ? null : displayname.trim();
    }

    public String getNodeurl() {
        return nodeurl;
    }

    public void setNodeurl(String nodeurl) {
        this.nodeurl = nodeurl == null ? null : nodeurl.trim();
    }

    public Integer getDisplayorder() {
        return displayorder;
    }

    public void setDisplayorder(Integer displayorder) {
        this.displayorder = displayorder;
    }

    public Integer getParentnodeid() {
        return parentnodeid;
    }

    public void setParentnodeid(Integer parentnodeid) {
        this.parentnodeid = parentnodeid;
    }
}