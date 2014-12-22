/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package me.doshou.admin.maintain.keyvalue.service;

import me.doshou.common.service.BaseService;
import me.doshou.admin.maintain.keyvalue.entity.KeyValue;
import me.doshou.admin.maintain.keyvalue.repository.KeyValueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:01
 */
@Service
public class KeyValueService extends BaseService<KeyValue, Long> {

    private KeyValueRepository getKeyValueRepository() {
        return (KeyValueRepository) baseRepository;
    }


    public KeyValue findByKey(String key) {
        return getKeyValueRepository().findByKey(key);
    }

}
