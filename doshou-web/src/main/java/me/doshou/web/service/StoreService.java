package me.doshou.web.service;

import me.doshou.web.domain.Category;
import me.doshou.web.domain.Store;
import me.doshou.web.repository.StoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Store Service
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/27
 * Time: 21:44
 */
@Service
public class StoreService {

    @Autowired
    private StoreRepository storeRepository;

    public List<Store> findByIsShowWithSort(Boolean isShow, Sort sort) {
        return storeRepository.findByIsShow(isShow, sort);
    }

    public List<Store> findStoresByCategoryAndIsShowWithSort(Category category, Boolean isShow, Sort sort) {
        return storeRepository.findByCategoryAndIsShow(category, isShow, sort);
    }
}
