package com.fmall.service.impl;

import com.fmall.common.Const;
import com.fmall.common.ServerResponse;
import com.fmall.dao.CollectionMapper;
import com.fmall.dao.ProductMapper;
import com.fmall.pojo.Collection;
import com.fmall.pojo.Product;
import com.fmall.service.IProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service("iProductService")
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CollectionMapper collectionMapper;

    public ServerResponse<String> uploadProduct(Product product){
        int resultCount = productMapper.insert(product);
        if(resultCount == 0){
            return ServerResponse.createByErrorMessage("商品上传失败");
        }
        return ServerResponse.createBySuccessMessage("商品上传成功");
    }

    /**
     * 按不同参数展示商品展示商品
     * @param pn
     * @return
     */
    public ServerResponse<PageInfo> selectProductByChoice(Integer type,Integer categoryId,Integer pn){

        PageHelper.startPage(pn,12);
        List<Product> productList;
        if(type == Const.Type.DEFAULT){
            // 默认查询
            productList = productMapper.selectProductBySelective(categoryId);
        }else if(type == Const.Type.CATEGORY){
            // 按肉分类查询
            productList = productMapper.selectProductBySelective(categoryId);
        }else{
            return ServerResponse.createBySuccessMessage("参数错误");
        }

        PageInfo pageInfo = new PageInfo(productList);
        return ServerResponse.createBySuccess(pageInfo);
    }

    public Product showProductById(Integer productId){
        Product product = productMapper.selectByPrimaryKey(productId);
        return product;
    }

    public ServerResponse<String> addCollection(Integer userId,Integer productId){
        Collection collection = new Collection();
        collection.setUserId(userId);
        collection.setProductId(productId);
        int resultCount = collectionMapper.insert(collection);
        if(resultCount > 0){
            return ServerResponse.createBySuccessMessage("收藏成功");
        }
        return ServerResponse.createByErrorMessage("收藏失败");
    }

}

