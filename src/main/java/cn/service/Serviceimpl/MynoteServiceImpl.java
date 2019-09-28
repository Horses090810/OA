package cn.service.Serviceimpl;

import cn.dao.MynoteMapper;
import cn.entity.Mynote;
import cn.service.MynoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: songshiwen
 * @Date: 2019/9/2314:39
 * @Description:
 */
@Service
public class MynoteServiceImpl implements MynoteService {
        @Autowired
        private MynoteMapper mynoteMapper;

        @Override
        public Map findBwId(String id) {
                return mynoteMapper.findBwId(id);
        }

        @Override
        public void add(Mynote my) {
                mynoteMapper.add(my);
        }

        @Override
        public void uq(Mynote my) {
    System.out.println("==="+my.toString());
                mynoteMapper.uq(my);
        }

        @Override
        public List<Map> findTj(Map map) {
                return mynoteMapper.findTj(map);
        }

        @Override
        public List<Map> find() {

                return mynoteMapper.find();
        }

        @Override
        public List<Map> finds(String id) {
                return mynoteMapper.finds(Integer.parseInt(id)==0?null:Integer.parseInt(id));
        }

        @Override
        public void del(String id) {
                mynoteMapper.del(id);
        }

        @Override
        public List<Map> findId(int id) {

    System.out.println(id+"---------");
    return mynoteMapper.findId(id);
        }
}
