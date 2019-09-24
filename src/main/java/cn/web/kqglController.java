package cn.web;

import cn.service.kqglService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping("qd")
    public String qd()
    {
        return "/qd";
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



    @RequestMapping(value="inquire",produces ="application/json;charset=utf-8")
    @ResponseBody
    public Map inquire(@RequestParam("page")int page,@RequestParam("limit") int limit,
                       @RequestParam("name") String name ,@RequestParam("depid") String depid ,@RequestParam("geender") String geender  ){
        Map map=new HashMap();
        Integer count=kqglService.selTotal();
        int Max=(count-1)/limit+1;
        Map condition=new HashMap();
        condition.put("name", name);
        condition.put("depid", depid);
        condition.put("geender", geender);
        List<Map> list=kqglService.inquire((page-1)*limit,limit,condition);
        map.put("data",list);
        map.put("count",count);
        map.put("code",0);
        return  map;
    }


    //历史管理
    //分页
    @RequestMapping(value="show1",produces="application/json;charset=utf-8")
    @ResponseBody
    public Map show1(@RequestParam("page")int page,@RequestParam("limit") int limit){
        Map map=new HashMap();
        //最大的总行数
        Integer total = kqglService.selTotal1();
        int Maxtotal=(total-1)/limit+1;
        List<Map> list = kqglService.showAll1((page-1)*limit,limit);
        map.put("data", list);
        map.put("code", 0);
        map.put("count",total);
        return  map;
    }

    @RequestMapping(value="inquire1",produces ="application/json;charset=utf-8")
    @ResponseBody
    public Map inquire1(@RequestParam("page")int page,@RequestParam("limit") int limit,
                       @RequestParam("name") String name ,@RequestParam("depid") String depid ,@RequestParam("geender") String geender  ){
        Map map=new HashMap();
        Integer count=kqglService.selTotal1();
        int Max=(count-1)/limit+1;
        Map condition=new HashMap();
        condition.put("name", name);
        condition.put("depid", depid);
        condition.put("geender", geender);
        List<Map> list=kqglService.inquire1((page-1)*limit,limit,condition);
        map.put("data",list);
        map.put("count",count);
        map.put("code",0);
        return  map;
    }


    @RequestMapping("selectqd")
    public List selectqd(String name)
    {

        return kqglService.selectqd(name);
    }


}
