package cn.web;

import cn.service.kqglService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class kqglController {

    @Autowired
    private kqglService kqglService;

    @RequestMapping("qd")
    public String qd()
    {
        return "/qd";
    }


    @RequestMapping("ls")
    public String ls()
    {
        return "/ls";
    }


    @RequestMapping("tj")
    public String tj()
    {
        return "/tj";
    }

    //分页
    @RequestMapping(value="show",produces="application/json;charset=utf-8")
    @ResponseBody
    public Map show(@RequestParam("page")int page,@RequestParam("limit") int limit){
        Map map=new HashMap();
        //最大的总行数
        Integer total = kqglService.selTotal();
        int Maxtotal=(total-1)/limit+1;
        List<Map> list = kqglService.showAll((page-1)*limit,limit);
        map.put("data", list);
        map.put("code", 0);
        map.put("count",total);
        return  map;
    }
}
