package me.doshou.web.service;

import me.doshou.common.service.BaseService;
import me.doshou.web.domain.Category;
import me.doshou.web.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<Category> findCategories() {
        return categoryRepository.findAll();
    }

    public List<Category> findCategoriesWithSort(Sort sort) {
        return categoryRepository.findAll(sort);
    }

    public List<Category> findByIsShowWithSort(Boolean isShow, Sort sort) {
        return categoryRepository.findByIsShow(isShow, sort);
    }

    public Category findOne(Long catId) {
        return categoryRepository.getOne(catId);
    }

    /**
     * 过滤仅获取可显示的数据
     * @param categories
     */
    public void filterForCanShow(List<Category> categories) {
        for (Category category : categories) {
            if (category == null || Boolean.FALSE.equals(category.getIsShow())) {
                categories.remove(category);
            }
        }
    }
}
