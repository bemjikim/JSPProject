package com.member.common;

import com.member.bean.MemberVO;
import com.member.dao.MemberDAO;
import com.member.util.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;


public class FileUpload {

    public static void deleteFile(HttpServletRequest request, String filename)
    {
        String filePath = request.getServletContext().getRealPath("upload");
        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
    public MemberVO uploadPhoto(HttpServletRequest request)
    {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
System.out.println("실행중!");
        File dir = new File(realPath);
        if(!dir.exists())
        {
            dir.mkdirs();
        }

        MemberVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");
            System.out.println("filename: " + filename);
            one = new MemberVO();
            String sid = multipartRequest.getParameter("sid");
            if(sid != null && !sid.equals(""))
            {
                one.setSid(Integer.parseInt(sid));
            }
            one.setUserid(multipartRequest.getParameter("userid"));
            one.setUsername(multipartRequest.getParameter("username"));
            one.setPassword(multipartRequest.getParameter("password"));
            one.setEmail(multipartRequest.getParameter("email"));
            one.setDetail(multipartRequest.getParameter("detail"));

            if(sid != null && !sid.equals(""))
            {
                MemberDAO dao = new MemberDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if(filename != null && oldfilename != null)
                {
                    FileUpload.deleteFile(request, oldfilename);
                }
                else if(filename == null && oldfilename != null)
                {
                    filename = oldfilename;
                }
            }
            one.setPhoto(filename);

        }catch(IOException e){
            e.printStackTrace();
        }
        return one;
    }


}