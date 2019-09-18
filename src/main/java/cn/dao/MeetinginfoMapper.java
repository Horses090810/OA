package cn.dao;

import cn.entity.Meetinginfo;

public interface MeetinginfoMapper {
    Meetinginfo selectByPrimaryKey(Integer meetingid);
}