package me.doshou.web.service;

import me.doshou.common.service.BaseService;
import me.doshou.web.domain.Category;
import me.doshou.web.domain.Product;
import me.doshou.web.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Function details
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 23:25
 */
@Service
public class ProductService extends BaseService<Product, Long> {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> findProducts() {
        return productRepository.findAll();
    }

    public List<Product> findProductsByCategory(Category category) {
        return productRepository.findByCategory(category);
    }
}
