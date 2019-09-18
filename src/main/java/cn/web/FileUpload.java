package cn.web;

import cn.entity.Userinfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Iterator;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/10
 * 描述
 */
@Controller
public class FileUpload {

    @RequestMapping(value = "ajaxFileUpload")
    @ResponseBody
    public String ajaxFileUpload(String uname,HttpServletRequest request) throws Exception{
        MultipartRequest multipartRequest = (MultipartRequest) request;
        Iterator<MultipartFile> iterator = multipartRequest.getFileMap().values().iterator();
        String path=request.getSession().getServletContext().getRealPath("/upload");
        String username=uname+".jpg";
        System.out.println(username);
        if(iterator.hasNext()){
            MultipartFile file=iterator.next();
            File newfile=new File(path,username);
            file.transferTo(newfile);
        }
        return username;
    }
}
