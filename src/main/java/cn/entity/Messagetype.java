package cn.entity;

public class Messagetype {
    private Integer messagetypeid;

    private String messagetypename;

    private String messagetypedesc;

    public Integer getMessagetypeid() {
        return messagetypeid;
    }

    public void setMessagetypeid(Integer messagetypeid) {
        this.messagetypeid = messagetypeid;
    }

    public String getMessagetypename() {
        return messagetypename;
    }

    public void setMessagetypename(String messagetypename) {
        this.messagetypename = messagetypename == null ? null : messagetypename.trim();
    }

    public String getMessagetypedesc() {
        return messagetypedesc;
    }

    public void setMessagetypedesc(String messagetypedesc) {
        this.messagetypedesc = messagetypedesc == null ? null : messagetypedesc.trim();
    }
}