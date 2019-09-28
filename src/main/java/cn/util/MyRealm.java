package cn.util;

import cn.entity.Userinfo;
import cn.service.UserinfoService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/3
 * 描述
 */
public class MyRealm extends AuthorizingRealm{

    @Autowired
    private UserinfoService userinfoService;

    @Autowired
    private HttpServletRequest request;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&设置用户权限");

        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String principal = (String) token.getPrincipal();

        request.getSession().setAttribute("userid",principal);

        System.out.println(principal);

        Userinfo userinfo = userinfoService.selectByUname(principal);

        if (userinfo == null) {
            return null;
        }

        if(userinfo.getUserstate()==0){
            return new SimpleAuthenticationInfo(null,null,"myrealm");
        }
        Map<String,Object> map = new HashMap<>();

        map.put("userinfo",userinfo);
        //查询当前用的菜单
        String userid = userinfo.getUserid().toString();

        List<Map<String, Object>> list = userinfoService.selectJurisdictionByUid(userid);
        map.put("list",list);

        String pwd = userinfo.getPassword();

        String salt = "kh";
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(map, pwd, ByteSource.Util.bytes(salt), "myrealm");
        return info;
    }
}
