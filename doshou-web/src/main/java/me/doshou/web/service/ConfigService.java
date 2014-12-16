package me.doshou.web.service;

import me.doshou.web.domain.Config;
import me.doshou.web.repository.ConfigRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Config Service
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/22
 * Time: 21:07
 */
@Service
public class ConfigService {

    @Autowired
    private ConfigRepository configRepository;

    public Config getValue(String name) {
        return configRepository.findByName(name);
    }
}
