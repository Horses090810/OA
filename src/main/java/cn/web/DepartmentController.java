package cn.web;

import cn.entity.Accessoryfile;
import cn.entity.Fileinfo;
import cn.entity.Userinfo;
import cn.service.FileinfoService;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
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
  @ResponseBody
  public List<Map> findWjId(String id, HttpServletResponse resq) throws IOException {
    resq.setContentType("test/html;charset=utf-8");
    List<Map> list = fileinfoService.findIdWj(Integer.parseInt(id));
    System.out.println("----------" + list);
    for (Map s : list) {
      s.put("createdate", s.get("createdate").toString());
    }
    return list;
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

  @RequestMapping("department_tails/{id}/{filepath}")
  public String department_tails(
      @PathVariable("filepath") String filepath,
      @PathVariable("id") String id,
      HttpServletRequest req) {
    if (id.equals("0")) {
      Map id1 = fileinfoService.findId(filepath);
      String ss = id1.get("filepath") + "\\" + id1.get("filename");
      Map list = new HashMap();
      list.put("filepath", ss);
      list.put("parentid", id1.get("fileid"));
      req.setAttribute("list", list);
    } else {
      List<Map> idWj = fileinfoService.findIdWjs(Integer.parseInt(id));
      req.setAttribute("list", idWj.get(0));
    }

    return "/department_tails";
  }

  @RequestMapping("department_tail/{id}/{filepath}")
  public String department_tail(
      @PathVariable("filepath") String filepath,
      @PathVariable("id") String id,
      HttpServletRequest req) {
    System.err.println("1111111111----" + filepath);
    System.err.println("1111111111----" + id);
    if (filepath.equals("null")) {
      Map id1 = fileinfoService.findId(id);
      filepath = id1.get("filepath").toString();
    } else {
      fileinfoService.del();
      fileinfoService.upIdAc();
    }
    List<Map> map = fileinfoService.findFu();
    req.setAttribute("map", map);
    if (id.equals("0")) {
      Map id1 = fileinfoService.findId(filepath);
      String ss = id1.get("filepath") + "\\" + id1.get("filename");
      Map list = new HashMap();
      list.put("filepath", ss);
      list.put("parentid", id1.get("fileid"));
      req.setAttribute("list", list);
    } else {
      List<Map> idWj = fileinfoService.findIdWjs(Integer.parseInt(id));
      req.setAttribute("list", idWj.get(0));
      List<Map> lists = fileinfoService.findFjId(idWj.get(0).get("fileid").toString());
      System.out.println(lists.toString());
      req.setAttribute("lists", lists);
    }

    return "/department_tail";
  }

  @RequestMapping("wjjtj")
  public String wjjtj(Fileinfo f, HttpSession ses) {
    System.out.println("****1ss1=1==========");

    if (f.getFileid() != null) {
      f.setFiletype(1);
      fileinfoService.up(f);

    } else {

      f.setCreatedate(new Date());
      f.setFiletype(1);
      System.out.println(((Userinfo) ses.getAttribute("userinfo")).getRoleid());

      f.setFileowner(((Userinfo) ses.getAttribute("userinfo")).getUsername());
      fileinfoService.add(f);
    }
    File file = new File(f.getFilepath() + "\\" + f.getFilename());
    if (!file.exists()) file.mkdirs();
    return "/ss";
  }

  @RequestMapping("wjtj")
  public String wjtj(Fileinfo f, HttpSession ses) {
    fileinfoService.delId();
    if (f.getFileid() != null) {
      fileinfoService.up(f);
      fileinfoService.upId(f.getFileid());

    } else {
      System.err.println("s*******" + f.getFiletype());
      f.setCreatedate(new Date());
      f.setFileowner(((Userinfo) ses.getAttribute("userinfo")).getUsername());
      fileinfoService.add(f);
      fileinfoService.upWjId();
    }
    File file = new File(f.getFilepath() + "\\" + f.getFilename());

    return "/ss";
  }

  @RequestMapping(value = "file", method = RequestMethod.POST)
  public String file(
      @RequestParam(required = false) MultipartFile file,
      String ff,
      String fileid,
      String filepath,
      HttpServletRequest req)
      throws ServletException, IOException, FileUploadException {
    int begin = file.getOriginalFilename().indexOf(".");
    int last = file.getOriginalFilename().length();
    // 获得文件后缀名
    String a = file.getOriginalFilename().substring(begin, last);
    String wj = "1";

    String fileName = file.getOriginalFilename();
    System.out.println(fileName);
    System.out.println(filepath + "\\" + fileName);
    int index = fileName.lastIndexOf("\\");
    File dest = new File(filepath + "\\" + fileName);
    System.out.println(dest.getParentFile().exists());
    if (!dest.getParentFile().exists()) {
      dest.getParentFile().mkdirs();
    }
    fileinfoService.addFu(
        new Accessoryfile(
            0,
            null,
            fileName,
            Integer.parseInt(file.getSize() + ""),
            Integer.parseInt(wj),
            new Date(),
            filepath));
    file.transferTo(dest);
    return "redirect:/department_tail/" + fileid + "/null.do";
  }

  @RequestMapping("sc/{s}/{s1}")
  public String sc(@PathVariable("s1") String fileid, @PathVariable("s") String id) {
    fileinfoService.upAcId(id);
    return "redirect:/department_tail/" + fileid + "/null.do";
  }

  @RequestMapping("scffss/{id}")
  public String scffss(@PathVariable("id") String id) {
    fileinfoService.delFId(id);
    return "redirect:/department.do";
  }

  @RequestMapping("hszym")
  public String hszym(HttpServletRequest req) {
    List<Map> list = fileinfoService.findHsz();
    req.setAttribute("list", list);
    return "/hszym";
  }

  @RequestMapping("hyId/{id}")
  public String hyId(@PathVariable("id") String id) {
    fileinfoService.upHyId(id);
    return "redirect:/hszym.do";
  }

  @RequestMapping("scId/{id}")
  public String scId(@PathVariable("id") String id) {
    fileinfoService.delHyId(id);
    return "redirect:/hszym.do";
  }

  @RequestMapping("sstjff")
  public String sstjff(
      HttpServletRequest req, String name, String fj, String xm, String xsj, String dsj) {
    Map map = new HashMap();
    map.put("name", name);
    map.put("fj", fj);
    map.put("xm", xm);
    map.put("xsj", xsj.toString());
    map.put("dsj", dsj.toString());
    System.err.println(map.toString());
    req.setAttribute("map", map);
    List<Map> list = fileinfoService.findTj(map);
    req.setAttribute("list", list);
    return "/wjcxym";
  }
}
