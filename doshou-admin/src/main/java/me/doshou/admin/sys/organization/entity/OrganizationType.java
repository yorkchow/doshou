package me.doshou.admin.sys.organization.entity;

/**
 * 组织机构类型
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/11/30
 * Time: 20:32
 */
public enum OrganizationType {

    bloc("集团"), branch_office("分公司"), department("部门"), group("部门小组");

    private final String info;

    private OrganizationType(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
