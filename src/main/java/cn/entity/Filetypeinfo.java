package cn.entity;

public class Filetypeinfo {
    private Integer filetypeid;

    private String filetypename;

    private String filetypeimage;

    private String filetypesuffix;

    public Integer getFiletypeid() {
        return filetypeid;
    }

    public void setFiletypeid(Integer filetypeid) {
        this.filetypeid = filetypeid;
    }

    public String getFiletypename() {
        return filetypename;
    }

    public void setFiletypename(String filetypename) {
        this.filetypename = filetypename == null ? null : filetypename.trim();
    }

    public String getFiletypeimage() {
        return filetypeimage;
    }

    public void setFiletypeimage(String filetypeimage) {
        this.filetypeimage = filetypeimage == null ? null : filetypeimage.trim();
    }

    public String getFiletypesuffix() {
        return filetypesuffix;
    }

    public void setFiletypesuffix(String filetypesuffix) {
        this.filetypesuffix = filetypesuffix == null ? null : filetypesuffix.trim();
    }
}