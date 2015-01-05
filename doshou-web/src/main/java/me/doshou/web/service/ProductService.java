package me.doshou.web.service;

import me.doshou.web.domain.Category;
import me.doshou.web.domain.Product;
import me.doshou.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Product Service
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 23:25
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> findProducts() {
        return productRepository.findAll();
    }

    public List<Product> findProductsWithSort(Sort sort) {
        return productRepository.findAll(sort);
    }

    public List<Product> findByIsShowWithSort(Boolean isShow, Sort sort) {
        return productRepository.findByIsShow(isShow, sort);
    }

    public List<Product> findProductsByCategoryAndIsShowWithSort(Category category, Boolean isShow, Sort sort) {
        return productRepository.findByCategoryAndIsShow(category, isShow, sort);
    }

    /**
     * 过滤仅获取可显示的数据
     * @param products
     */
    public void filterForCanShow(List<Product> products) {
        for (Product product : products) {
            if (product == null || Boolean.FALSE.equals(product.getIsShow())) {
                products.remove(product);
            }
        }
    }
}
