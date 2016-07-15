package lyw.itcast.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Business;
import lyw.itcast.serivce.BusinessService;
import lyw.itcast.utils.UnifiedImage;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * 上传logo的action
 */
public class BusinessLogoAction extends ActionSupport {
    //上传的文件
    private File files;
    //struts2框架提供的上传的文件名
    private String filesFileName;
    //struts2框架提供的上传的文件类型
    private String filesContentType;
    //操作类型
    private String type;

    //返回的消息
    private String msg;
    //返回的结果，表示是否成功
    private boolean success;
    //返回的图片url
    private String logourl;

    //裁剪头像的类
    private UnifiedImage operateImage;

    /**
     * 保存文件在临时目录
     */
    public void saveTemp() {
        //新建服务
        BusinessService businessService = new BusinessService();
        //获取session中的商家
        Business business = businessService.getSessionBusiness();

        if (business != null) {
            //登录后才允许操作
            //在主机上的路径
            String realpath = ServletActionContext.getServletContext().getRealPath("/upload/temp/");
            //截取文件名的扩展名，例如变成 .jpg
            String newfilename = filesFileName.substring(filesFileName.lastIndexOf("."));
            newfilename = business.getId() + newfilename;

            //真正保存到磁盘上的文件
            File savefile = new File(new File(realpath), newfilename);

            File folder = savefile.getParentFile();
            if (!folder.exists()) {
                folder.mkdirs();//创建目录
            }

            //复制文件
            try {
                FileUtils.copyFile(files, savefile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            //将临时上传logo文件放到session中
            ActionContext.getContext().getSession().put("templogo", savefile.getAbsolutePath());

            success = true;
            msg = "文件上传成功";

            logourl = ServletActionContext.getRequest().getContextPath() + "/upload/temp/" + newfilename;


        } else {
            //没有登录
            logourl = "";
            success = false;
            msg = "请登录后上传";
        }

    }

    /**
     * 保存到真正的磁盘上
     */
    public void saveLogo() {
        //新建服务
        BusinessService businessService = new BusinessService();
        //获取session中的商家
        Business business = businessService.getSessionBusiness();

        if (business != null) {
            //登录后才允许操作
            String filepath = (String) ActionContext.getContext().getSession().get("templogo");
            //临时文件
            File templocalfile = new File(filepath);
            //真正要保存的文件
            if (templocalfile.exists()) {
                //存在临时图片文件再做下一步
                //在主机上的路径
                String realpath = ServletActionContext.getServletContext().getRealPath("/upload/business/");
                File realfile = new File(realpath, business.getId() + ".jpg");

                File folder = new File(realpath);
                if (!folder.exists()) {
                    folder.mkdirs();//创建目录
                }

                //开始裁剪图片
                operateImage.setSrcFile(templocalfile);
                operateImage.setDesFile(realfile);
                operateImage.cut();

                success = true;
                msg = "logo保存成功";

                //保存图片名字进数据库
                businessService.updatePuc(business.getId(), realfile.getName());
                logourl= ServletActionContext.getRequest().getContextPath() + "upload/business/" + realfile.getName();
                //final boolean delete = templocalfile.delete();//删除临时文件
                //System.out.println(delete);

            } else {
                success = false;
                msg = "请重新上传清晰的图片文件";
            }

        }else {
            //没有登录
            logourl = "";
            success = false;
            msg = "请登录后上传";

        }

    }


    @Override
    public String execute() {
        if (type.equals("upload")) {
            saveTemp();
        } else if (type.equals("save")) {
            saveLogo();
        }
        //D:\apache-tomcat-6.0.18\webapps\struts2_upload\images
        //System.out.println("realpath: " + realpath);
        //System.out.println("filename:"+files.getName());
        //System.out.println("savefile.getParentFile().getAbsolutePath():"+savefile.getParentFile().getAbsolutePath());
        return SUCCESS;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public UnifiedImage getOperateImage() {
        return operateImage;
    }

    public void setOperateImage(UnifiedImage operateImage) {
        this.operateImage = operateImage;
    }

    public File getFiles() {
        return files;
    }

    public void setFiles(File files) {
        this.files = files;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public String getLogourl() {
        return logourl;
    }

    public void setLogourl(String logourl) {
        this.logourl = logourl;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getFilesFileName() {
        return filesFileName;
    }

    public void setFilesFileName(String filesFileName) {
        this.filesFileName = filesFileName;
    }

    public String getFilesContentType() {
        return filesContentType;
    }

    public void setFilesContentType(String filesContentType) {
        this.filesContentType = filesContentType;
    }
}
