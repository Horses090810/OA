package cn.web;

import cn.entity.Loginlog;
import cn.entity.Userinfo;
import cn.service.UserinfoService;
import cn.service.systemService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/3
 * 描述
 */
@Controller
public class LoginController {

    @Autowired
    private HttpSession session;

    @Autowired
    private systemService systemservice;

    @RequestMapping("first")
    public String first(Model model, HttpSession session) throws Exception {
        Loginlog loginlog = new Loginlog();

        Subject subject = SecurityUtils.getSubject();
        Map<String, Object> principal = (Map<String, Object>) subject.getPrincipal();
        Userinfo userinfo = (Userinfo) principal.get("userinfo");
        List<Map<String, Object>> list = (List<Map<String, Object>>) principal.get("list");
        //用户信息
        System.out.println(userinfo.getUsername());
        model.addAttribute("userinfo", userinfo);
        session.setAttribute("userinfo",userinfo);

        loginlog.setUserid(userinfo.getUsername());
        InetAddress inetAddress = InetAddress.getLocalHost();
        String ip = inetAddress.getHostAddress();

        loginlog.setLoginuserip(ip);
        loginlog.setLogintime(new Date());
        loginlog.setIfsuccess(1);
        loginlog.setLogindesc(userinfo.getUsername()+"登录成功");
        systemservice.loginlogAdd(loginlog);
        //菜单集合
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request, Model model) throws Exception{
        System.out.println("bbb");
        String shiroLoginFailure = (String) request.getAttribute("shiroLoginFailure");

        System.out.println(shiroLoginFailure);

        Loginlog loginlog = new Loginlog();

        if(session.getAttribute("userid")!=null){
            String loginloguser=(String)session.getAttribute("userid");
            loginlog.setUserid(loginloguser);
        }

        InetAddress inetAddress = InetAddress.getLocalHost();
        String ip = inetAddress.getHostAddress();

        loginlog.setLoginuserip(ip);
        loginlog.setLogintime(new Date());
        loginlog.setIfsuccess(0);

        if (shiroLoginFailure == null) {
            System.out.println("用户未登录");
        } else if (shiroLoginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
            System.out.println("账号不存在");
            model.addAttribute("msg", "账号不存在");
            loginlog.setLogindesc("账号不存在");
        } else if (shiroLoginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
            System.out.println("密码错误");
            model.addAttribute("msg", "密码错误");
            loginlog.setLogindesc("密码错误");
        } else {
            System.out.println("账号已被屏蔽");
            model.addAttribute("msg", "账号已被屏蔽");
            loginlog.setLogindesc("账号已被屏蔽");
        }
        if(shiroLoginFailure!=null){
            systemservice.loginlogAdd(loginlog);
        }
        return "login";
    }

}
