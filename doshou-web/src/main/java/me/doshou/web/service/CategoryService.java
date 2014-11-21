package me.doshou.web.service;

import me.doshou.common.service.BaseService;
import me.doshou.web.domain.Category;
import me.doshou.web.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Category Service
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 22:30
 */
@Service
public class CategoryService extends BaseService<Category, Long> {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> findCategories() {
        return categoryRepository.findAll();
    }

    public Category findOne(Long catId) {
        return categoryRepository.getOne(catId);
    }
}
