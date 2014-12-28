package me.doshou.web.repository;

import me.doshou.web.domain.Category;
import me.doshou.web.domain.Store;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Store Repository
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/27
 * Time: 21:42
 */
public interface StoreRepository extends JpaRepository<Store, Long> {

    List<Store> findByIsShow(Boolean isShow, Sort sort);

    List<Store> findByCategoryAndIsShow(Category category, Boolean isShow, Sort sort);
}
