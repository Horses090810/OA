package cn.web;

import cn.service.FileinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/** @Author: songshiwen @Date: 2019/9/1919:41 @Description: */
@Controller
public class DepartmentController {
  @Autowired private FileinfoService fileinfoService;

  @RequestMapping("department")
  public String department(HttpServletRequest req) {
    List<Map> list = fileinfoService.findWj(0);
    System.out.println("------------" + list.toString());
    System.out.println(list.toString());
    for (Map s : list) {
      wjmzff(s);
      //      s.put("children", "[" + maps.toString() + "]");
      //      s.put("open", true);
      //      s.put("nocheck", true);
      s = maps;
    }
    String ss = list.toString().replace("=", ":");
    System.out.println(ss);
    req.setAttribute("ss", ss);
    return "/department";
  }
  // '<tr class="no-records-found"><td>s</td><td>d</td> <td>s</td></tr>'
  @RequestMapping("findWjId")
  public void findWjId(String id, HttpServletResponse resq) throws IOException {
    resq.setContentType("test/html;charset=utf-8");
    List<Map> list = fileinfoService.findIdWj(Integer.parseInt(id));
    System.out.println("----------" + list);
    PrintWriter out = resq.getWriter();
    out.write(list.toString().replace("=", ":"));
    out.flush();
    out.close();
  }

  private Map maps;

  private void wjmzff(Map s) {
    List<Map> map = fileinfoService.findWj(Integer.parseInt(s.get("fileid").toString()));
    if (map.size() > 0) {
      for (Map m : map) {
        wjmzff(m);
      }
      s.put("children", map == null ? "[]" : map);
      s.put("open", true);
      s.put("nocheck", true);
      maps = s;
    } else {
      s.put("children", map == null ? "[]" : map);
      s.put("open", true);
      s.put("nocheck", true);
      maps = s;
      return;
    }
  }
}
