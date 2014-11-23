package me.doshou.web.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.web.domain.Category;
import me.doshou.web.domain.Product;
import org.springframework.data.domain.Sort;

import java.util.List;

/**
 * Product Repository
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 23:24
 */
public interface ProductRepository extends BaseRepository<Product, Long> {

    List<Product> findByIsShow(Boolean isShow, Sort sort);

    List<Product> findByCategoryAndIsShow(Category category, Boolean isShow, Sort sort);
}
