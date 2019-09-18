package cn.web;

import cn.entity.Userinfo;
import cn.service.UserinfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/3
 * 描述
 */
@Controller
public class LoginController {

    @RequestMapping("first")
    public String first(Model model, HttpSession session) {

        Subject subject = SecurityUtils.getSubject();
        Map<String, Object> principal = (Map<String, Object>) subject.getPrincipal();
        Userinfo userinfo = (Userinfo) principal.get("userinfo");
        List<Map<String, Object>> list = (List<Map<String, Object>>) principal.get("list");
        //用户信息
        model.addAttribute("userinfo", userinfo);
        session.setAttribute("userinfo",userinfo);
        //菜单集合
        model.addAttribute("list", list);
        return "index";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request, Model model) {
        System.out.println("bbb");
        String shiroLoginFailure = (String) request.getAttribute("shiroLoginFailure");

        System.out.println(shiroLoginFailure);

        if (shiroLoginFailure == null) {
            System.out.println("用户未登录");
        } else if (shiroLoginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
            System.out.println("账号不存在");
            model.addAttribute("msg", "账号不存在");
        } else if (shiroLoginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
            System.out.println("密码错误");
            model.addAttribute("msg", "密码错误");
        } else {
            System.out.println("账号已被屏蔽");
            model.addAttribute("msg", "账号已被屏蔽");
        }
        return "login";
    }

}
