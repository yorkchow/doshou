/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package me.doshou.admin.maintain.keyvalue.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.maintain.keyvalue.entity.KeyValue;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:01
 */
public interface KeyValueRepository extends BaseRepository<KeyValue, Long> {

    KeyValue findByKey(String key);

}
