package me.doshou.admin.sys.group.entity;

/**
 * 用户组分类
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:57
 */
public enum GroupType {

    user("用户组"), organization("组织机构组");

    private final String info;

    private GroupType(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
