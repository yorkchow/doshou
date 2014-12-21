/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package me.doshou.admin.maintain.keyvalue.repository;

import me.doshou.common.repository.BaseRepository;
import me.doshou.admin.maintain.keyvalue.entity.KeyValue;

/**
 * <p>User: Zhang Kaitao
 * <p>Date: 13-2-4 下午3:00
 * <p>Version: 1.0
 */
public interface KeyValueRepository extends BaseRepository<KeyValue, Long> {

    KeyValue findByKey(String key);

}
