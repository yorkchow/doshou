package me.doshou.admin.maintain.dynamictask.service;

import me.doshou.admin.maintain.dynamictask.entity.TaskDefinition;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 23:01
 */
public interface DynamicTaskApi {

    public void addTaskDefinition(TaskDefinition taskDefinition);
    public void updateTaskDefinition(TaskDefinition taskDefinition);
    public void deleteTaskDefinition(boolean forceTermination, Long... taskDefinitionIds);


    public void startTask(Long... taskDefinitionIds);
    public void stopTask(boolean forceTermination, Long... taskDefinitionId);


}
