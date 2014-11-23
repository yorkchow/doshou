package me.doshou.web.controller;

import me.doshou.common.Constants;
import me.doshou.common.controller.BaseController;
import me.doshou.web.domain.Category;
import me.doshou.web.domain.Product;
import me.doshou.web.service.CategoryService;
import me.doshou.web.service.ConfigService;
import me.doshou.web.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Product Controller
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 23:32
 */
@Controller
@RequestMapping(value = "/")
public class ProductController extends BaseController<Product, Long> {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ConfigService configService;

    @RequestMapping(value = {""})
    String index(Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE));
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS));
        /*
        List<Category> categories = this.categoryService.findCategoriesWithSort(new Sort(Sort.Direction.ASC, "sortOrder"));
        this.categoryService.filterForCanShow(categories);
        */
        List<Category> categories = this.categoryService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("cats", categories);

        List<Product> products = this.productService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        //this.productService.filterForCanShow(products);
        model.addAttribute("products", products);
        return "products";
    }

    @RequestMapping(value = "all")
    String listAll(Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE));
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS));

        List<Category> categories = this.categoryService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("cats", categories);

        List<Product> products = this.productService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        //this.productService.filterForCanShow(products);
        model.addAttribute("products", products);
        return "products";
    }

    @RequestMapping(value="cat/{catId}")
    String show(@PathVariable(value="catId") Long catId, Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE));
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS));

        List<Category> categories = this.categoryService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("cats", categories);

        Category category = this.categoryService.findOne(catId);
        List<Product> products = this.productService.findProductsByCategoryAndIsShowWithSort(category, Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        //this.productService.filterForCanShow(products);
        model.addAttribute("products", products);
        return "products";
    }
}
