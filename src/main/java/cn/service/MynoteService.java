package cn.service;

import cn.entity.Mynote;

import java.util.List;
import java.util.Map;

public interface MynoteService {
        List<Map> findId(int id);
        Map findBwId(String id);
        void add(Mynote my);
        void uq(Mynote my);
        void del(String id);
}
