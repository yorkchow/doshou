package me.doshou.web.repository;

import me.doshou.web.domain.Category;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Category Repository
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 17:28
 */
public interface CategoryRepository extends JpaRepository<Category, Long> {

    @Cacheable("cats")
    List<Category> findByIsShow(Boolean isShow, Sort sort);
}
