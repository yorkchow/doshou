package me.doshou.common.web.form;

import me.doshou.common.web.form.bind.SearchBindStatus;
import org.springframework.web.servlet.support.BindStatus;

import javax.servlet.jsp.JspException;
/**
 * 取值时
 * 1、先取parameter
 * 2、如果找不到再找attribute (page--->request--->session--->application)
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/20
 * Time: 12:49
 */
public class CheckboxesTag extends org.springframework.web.servlet.tags.form.CheckboxesTag {

    private BindStatus bindStatus = null;

    @Override
    protected BindStatus getBindStatus() throws JspException {
        if (this.bindStatus == null) {
            this.bindStatus = SearchBindStatus.create(pageContext, getName(), getRequestContext(), false);
        }
        return this.bindStatus;
    }

    @Override
    protected String getPropertyPath() throws JspException {
        return getPath();
    }


    @Override
    public void doFinally() {
        super.doFinally();
        this.bindStatus = null;
    }
}
