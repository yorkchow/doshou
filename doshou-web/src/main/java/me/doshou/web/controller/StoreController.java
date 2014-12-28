package me.doshou.web.controller;

import me.doshou.web.Constants;
import me.doshou.web.domain.Category;
import me.doshou.web.domain.Store;
import me.doshou.web.service.CategoryService;
import me.doshou.web.service.ConfigService;
import me.doshou.web.service.StoreService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Store Controller
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/27
 * Time: 21:47
 */
@Controller
@RequestMapping(value = "/store")
public class StoreController {

    private static final Logger log = LoggerFactory.getLogger(StoreController.class);

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ConfigService configService;

    @Autowired
    private StoreService storeService;

    @RequestMapping(value = {""})
    String index(Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE));
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS));

        List<Category> categories = this.categoryService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("cats", categories);
        log.info("Request URL: [/], cats: {}", categories);

        List<Store> stores = this.storeService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("stores", stores);
        log.info("Request URL: [/], stores: {}", stores);
        return "stores";
    }

    @RequestMapping(value="cat/{catId}")
    String show(@PathVariable(value="catId") Long catId, Model model) {
        model.addAttribute("title", this.configService.getValue(Constants.WEBSITE_TITLE));
        model.addAttribute("keywords", this.configService.getValue(Constants.WEBSITE_KEYWORDS));

        List<Category> categories = this.categoryService.findByIsShowWithSort(Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("cats", categories);
        log.info("Request URL: [/cat/{}], cats: {}", catId, categories);

        Category category = this.categoryService.findOne(catId);

        List<Store> stores = this.storeService.findStoresByCategoryAndIsShowWithSort(category, Boolean.TRUE,
                new Sort(Sort.Direction.ASC, "sortOrder"));
        model.addAttribute("stores", stores);
        log.info("Request URL: [/cat/{}], stores: {}", catId, stores);
        return "stores";
    }
}
