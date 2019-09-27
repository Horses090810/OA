package cn.web;

import cn.entity.Userinfo;
import cn.service.kqglService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.management.openmbean.TabularDataSupport;
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

    LoginController LoginController=new LoginController();

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



    @RequestMapping(value = "addqd",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
    @ResponseBody
    public  String addqd(@RequestParam("name") String name,@RequestParam("bq") String bq) {

        Map trem = new HashMap();
        trem.put("name", name);
        trem.put("bq",bq);
        boolean flag = kqglService.addqd(trem);

        if (flag==true){
            return "签到成功";
        }else {
            return "添加失败";
        }
    }

    @RequestMapping(value = "addqt",method= RequestMethod.POST,produces="text/plain;charset=utf-8")
    @ResponseBody
    public  String addqt(@RequestParam("name") String name,@RequestParam("bq") String bq) {
        System.out.println("123");
        Map trem = new HashMap();
        trem.put("name", name);
        trem.put("bq",bq);
        boolean flag = kqglService.addqt(trem);
        if (flag==true){
            return "签退成功";
        }else {
            return "添加失败";
        }
    }


    @RequestMapping("selectqd")
    public List selectqd(String name)
    {
        Subject subject = SecurityUtils.getSubject();
        Map<String, Object> principal = (Map<String, Object>) subject.getPrincipal();
        Userinfo userinfo = (Userinfo) principal.get("userinfo");
        return kqglService.selectqd(userinfo.getUsername());
    }


    @RequestMapping("selectqt")
    public List selectqt(String name)
    {
        Subject subject = SecurityUtils.getSubject();
        Map<String, Object> principal = (Map<String, Object>) subject.getPrincipal();
        Userinfo userinfo = (Userinfo) principal.get("userinfo");
        return kqglService.selectqt(userinfo.getUsername());
    }

}
