package me.doshou.common.web.filter;

import me.doshou.common.utils.LogUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * 记录访问日志
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/4
 * Time: 22:11
 */
public class AccessLogFilter extends BaseFilter {

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        LogUtils.logAccess(request);
        chain.doFilter(request, response);
    }
}
