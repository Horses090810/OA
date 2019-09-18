package cn.entity;

public class Worktime {
    private Integer worktimeid;

    private String ondutytime;

    private String offdutytime;

    public Integer getWorktimeid() {
        return worktimeid;
    }

    public void setWorktimeid(Integer worktimeid) {
        this.worktimeid = worktimeid;
    }

    public String getOndutytime() {
        return ondutytime;
    }

    public void setOndutytime(String ondutytime) {
        this.ondutytime = ondutytime == null ? null : ondutytime.trim();
    }

    public String getOffdutytime() {
        return offdutytime;
    }

    public void setOffdutytime(String offdutytime) {
        this.offdutytime = offdutytime == null ? null : offdutytime.trim();
    }
}