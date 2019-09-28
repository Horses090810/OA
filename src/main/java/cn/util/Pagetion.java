package cn.util;

import java.util.List;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/5
 * 描述
 */
public class Pagetion<T> {

    private Integer pageNo = 1;
    private  Integer pageSize = 5;
    private  Integer totle;
    private List<T> list;
    private  T t;

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public Integer getPageCount(){
        return (totle-1)/pageSize+1;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotle() {
        return totle;
    }

    public void setTotle(Integer totle) {
        this.totle = totle;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "Pagetion{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", totle=" + totle +
                ", list=" + list +
                ", t=" + t +
                '}';
    }
}
