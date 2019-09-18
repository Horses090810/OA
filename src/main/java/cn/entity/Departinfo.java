package cn.entity;

public class Departinfo {

    public Departinfo() {
    }

    public Departinfo(Integer departid, String departname, Integer principaluser, String connecttelno, String connectmobiletelno, String faxes, Integer branchid) {
        this.departid = departid;
        this.departname = departname;
        this.principaluser = principaluser;
        this.connecttelno = connecttelno;
        this.connectmobiletelno = connectmobiletelno;
        this.faxes = faxes;
        this.branchid = branchid;
    }

    private Integer departid;

    private String departname;

    private Integer principaluser;

    private String connecttelno;

    private String connectmobiletelno;

    private String faxes;

    private Integer branchid;

    public Integer getDepartid() {
        return departid;
    }

    public void setDepartid(Integer departid) {
        this.departid = departid;
    }

    public String getDepartname() {
        return departname;
    }

    public void setDepartname(String departname) {
        this.departname = departname == null ? null : departname.trim();
    }

    public Integer getPrincipaluser() {
        return principaluser;
    }

    public void setPrincipaluser(Integer principaluser) {
        this.principaluser = principaluser;
    }

    public String getConnecttelno() {
        return connecttelno;
    }

    public void setConnecttelno(String connecttelno) {
        this.connecttelno = connecttelno == null ? null : connecttelno.trim();
    }

    public String getConnectmobiletelno() {
        return connectmobiletelno;
    }

    public void setConnectmobiletelno(String connectmobiletelno) {
        this.connectmobiletelno = connectmobiletelno == null ? null : connectmobiletelno.trim();
    }

    public String getFaxes() {
        return faxes;
    }

    public void setFaxes(String faxes) {
        this.faxes = faxes == null ? null : faxes.trim();
    }

    public Integer getBranchid() {
        return branchid;
    }

    public void setBranchid(Integer branchid) {
        this.branchid = branchid;
    }
}