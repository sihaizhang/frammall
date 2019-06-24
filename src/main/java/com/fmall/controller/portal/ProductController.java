package com.fmall.controller.portal;

import com.alibaba.fastjson.JSONObject;
import com.fmall.common.Const;
import com.fmall.common.ResponseCode;
import com.fmall.common.ServerResponse;
import com.fmall.pojo.Product;
import com.fmall.pojo.User;
import com.fmall.service.IFileService;
import com.fmall.service.IProductService;
import com.fmall.service.IUserService;
import com.fmall.util.PropertiesUtil;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.apache.bcel.generic.MULTIANEWARRAY;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private IProductService iProductService;

    @Autowired
    private IUserService iUserService;

    @Autowired
    private IFileService iFileService;

    /**
     * 上传产品
     */
    @RequestMapping(value = "release_product.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> releaseProduct(HttpSession session, Product product, @RequestParam(value = "file", required = false)MultipartFile file
            , HttpServletRequest request){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，请登录管理员");
        }
        // 判断是否为卖家
        if(iUserService.checkAdminRole(user.getUsername()).isSuccess()){
            // 填充业务
            // 先填写其他信息
            product.setUserId(user.getId());
            // 上传主图和副图
            // 上传主图
            String path = request.getSession().getServletContext().getRealPath("upload");
            System.out.println(path);
            if(file != null){
                String targetFileName = iFileService.upload(file,path);
                String url = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileName;
                // 提交给product
                product.setMainImage(url);
            }else{
                product.setMainImage("null");
            }
            // 上传副图
            CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            // 判断是否有文件上传
            if(commonsMultipartResolver.isMultipart(request)){
               // System.out.println("到了这里了！！！");
                MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFileList = multipartHttpServletRequest.getFiles("subImageFiles");
                String subImgUrls = "";
                for(MultipartFile img:multipartFileList){
                   // System.out.println("文件名："+img.getOriginalFilename());
                   // System.out.println("subImages:"+img);
                    String targetFileNames = iFileService.upload(img,path);
                    String urls = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFileNames;
                    subImgUrls = urls+","+subImgUrls;
                }
                product.setSubImages(subImgUrls);
            }

            ServerResponse<String> stringServerResponse = iProductService.uploadProduct(product);
            return stringServerResponse;
        }else{
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }


    // todo 主页展示产品
    @RequestMapping(value = "show_product.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<PageInfo> showProduct(@RequestParam(value = "type",defaultValue = "1") Integer type
            ,@RequestParam(value = "categoryId",defaultValue = "0") Integer categoryId
            ,@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        ServerResponse<PageInfo> serverResponse = iProductService.selectProductByChoice(type, categoryId, pn);
        return serverResponse;
    }

    // 获取产品信息，在session中储存，在另一个页面展示，只需要返回成功或者失败
    @RequestMapping(value = "show_product_by_id.do",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse showProductById(HttpSession session,Integer productId){
        Product product = iProductService.showProductById(productId);
        if(product == null){
            return ServerResponse.createByError();
        }
        System.out.println(product);
        // 将查询出来的产品信息存到数据库中
        session.setAttribute(Const.CURRENT_PRODUCT,product);
        return ServerResponse.createBySuccessMessage("查询成功");
    }

    @RequestMapping(value = "add_collection.do",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> addCollection(HttpSession session,Integer productId){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，请登录管理员");
        }
        // 收藏商品
        ServerResponse<String> serverResponse = iProductService.addCollection(user.getId(), productId);
        return serverResponse;
    }


}
