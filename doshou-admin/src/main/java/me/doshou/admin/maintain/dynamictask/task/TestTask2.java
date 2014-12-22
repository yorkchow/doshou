package me.doshou.admin.maintain.dynamictask.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:01
 */
public class TestTask2 {

    @Autowired
    private ApplicationContext ctx;

    public void run() {
        System.out.println("====hello test task2::" + ctx);
    }
}
