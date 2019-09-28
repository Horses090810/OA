package cn.web;

import cn.entity.Loginlog;
import cn.entity.Operatelog;
import cn.entity.Roleinfo;
import cn.entity.Roleright;
import cn.service.systemService;
import cn.util.Pagetion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/28
 * 描述
 */
@Controller
public class systemController {

    @Autowired
    private systemService systemservice;

    @RequestMapping("part")
    public String port(Model model){
        List<Roleinfo> roleAll = systemservice.findRoleAll();
        model.addAttribute("roleAll",roleAll);
        return "/system/part";
    }

    @PostMapping("roleinfoadd")
    public String roleinfoadd(Roleinfo roleinfo){
        systemservice.roleinfoadd(roleinfo);
        return "redirect:/part.do";
    }

    @PostMapping("roleinfoupdate")
    public String roleinfoupdate(Roleinfo roleinfo){
        systemservice.roleinfoupdate(roleinfo);
        return "redirect:/part.do";
    }

    @GetMapping("roleinfodel/{roleid}")
    public String roleinfodel(@PathVariable("roleid") Integer roleid){
        systemservice.roleinfodel(roleid);
        systemservice.rolerightdel(roleid);
        return "redirect:/part.do";
    }

    @PostMapping("addroleright")
    public String addroleright(Integer roleid,Integer[] nodeid){
        System.out.println("***************************");
        System.out.println(roleid);

        systemservice.rolerightdel(roleid);

        Roleright roleright = new Roleright();
        roleright.setRoleid(roleid);

        for (int i = 0; i < nodeid.length; i++) {
            roleright.setNodeid(nodeid[i]);
            systemservice.rolerightadd(roleright);
        }
        return "redirect:/part.do";
    }

    @RequestMapping("loginlog")
    public String loginlog(Model model){
        List<Loginlog> loginlogAll = systemservice.findLoginlogAll();
        model.addAttribute("loginlogAll",loginlogAll);
        return "/system/loginlog";
    }

    @RequestMapping("selectLoginlog")
    public String selectLoginlog(@RequestParam Map<String,Object> map,Model model,Integer pageNo){
        Pagetion<Map<String,Object>> pagetion = new Pagetion<>();
        pagetion.setT(map);
        if(pageNo==null){
            pagetion.setPageNo(1);
        }else{
            pagetion.setPageNo(pageNo);
        }

        Integer totle = systemservice.loginlogcount(map);

        pagetion.setTotle(totle);
        map.put("pageNo",(pagetion.getPageNo()-1)*pagetion.getPageSize());

        List<Loginlog> loginlogAll = systemservice.selectLoginlog(map);
        model.addAttribute("loginlogAll",loginlogAll);
        model.addAttribute("map",map);
        model.addAttribute("page",pagetion);
        return "/system/loginlog";
    }

    @RequestMapping("systemLog")
    public String systemLog(@RequestParam Map<String,Object> map,Model model,Integer pageNo){
        Pagetion<Map<String,Object>> pagetion = new Pagetion<>();

        pagetion.setT(map);
        if(pageNo==null){
            pagetion.setPageNo(1);
        }else{
            pagetion.setPageNo(pageNo);
        }

        Integer totle = systemservice.operateCount(map);
        pagetion.setTotle(totle);

        map.put("pageNo",(pagetion.getPageNo()-1)*pagetion.getPageSize());
        List<Operatelog> operatelogAll = systemservice.findOperatelogAll(map);
        model.addAttribute("operatelogAll",operatelogAll);
        model.addAttribute("page",pagetion);
        model.addAttribute("map",map);

        return "/system/systemlog";
    }
}
