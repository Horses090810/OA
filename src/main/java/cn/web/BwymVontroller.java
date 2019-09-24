package cn.web;

import cn.entity.Mynote;
import cn.entity.Userinfo;
import cn.service.MynoteService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: songshiwen
 * @Date: 2019/9/2314:38
 * @Description:
 */
@Controller
public class BwymVontroller {
        @Autowired
        private MynoteService mynoteService;
        @RequestMapping("bwym")
        public String bwym(HttpServletRequest req, HttpSession ses){
                List<Map> list=mynoteService.findId(((Userinfo)ses.getAttribute("userinfo")).getUserid());
                for (Map s:list){
                        if(s.get("notetitle").toString().length()>12){
                                s.put("notetitle",s.get("notetitle").toString().substring(0,12)+"...");
                        }
                }
                req.setAttribute("list",list);
                return  "/bwym";
        }

        @RequestMapping("bwymId/{id}")
        public  String bwymId(@PathVariable("id") String id,HttpServletRequest req){
                Map list =mynoteService.findBwId(id);
                req.setAttribute("list",list);
                return "/bwxqym";
        }

        @RequestMapping("bwxqym")
        public  String bwxqym( Mynote my,HttpServletRequest req,HttpSession ses){

                if(my.getNoteid()==null){
                        my.setCreatetime(new Date());
                        my.setCreateuser(((Userinfo)ses.getAttribute("userinfo")).getUserid());
                        mynoteService.add(my);
                }else{
                        mynoteService.uq(my);
                }
                return "redirect:/bwym.do";
        }
        @RequestMapping("scff/{id}")
        public  String scff(@PathVariable("id") String id){
                 mynoteService.del(id);
                return "redirect:/bwym.do";
        }
}
