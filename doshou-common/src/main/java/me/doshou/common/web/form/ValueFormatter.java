package me.doshou.common.web.form;

import org.springframework.util.ObjectUtils;
import org.springframework.web.util.HtmlUtils;
/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/21
 * Time: 23:57
 */
public class ValueFormatter {

    public static String getDisplayString(Object value, boolean htmlEscape) {
        String displayValue = ObjectUtils.getDisplayString(value);
        return (htmlEscape ? HtmlUtils.htmlEscape(displayValue) : displayValue);
    }
}
