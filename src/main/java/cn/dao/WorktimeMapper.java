package cn.dao;

import cn.entity.Worktime;

public interface WorktimeMapper {
    Worktime selectByPrimaryKey(Integer worktimeid);
}