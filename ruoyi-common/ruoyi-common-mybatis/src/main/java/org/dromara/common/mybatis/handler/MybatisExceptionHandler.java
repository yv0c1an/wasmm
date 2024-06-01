package org.dromara.common.mybatis.handler;

import org.dromara.common.core.domain.R;
import org.dromara.common.core.domain.model.LoginUser;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.satoken.core.event.ErrorLogEvent;
import org.dromara.common.satoken.utils.LoginHelper;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.MyBatisSystemException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * Mybatis异常处理器
 *
 * @author Lion Li
 */
@Slf4j
@RestControllerAdvice
public class MybatisExceptionHandler {

    /**
     * 主键或UNIQUE索引，数据重复异常
     */
    @ExceptionHandler(DuplicateKeyException.class)
    public R<Void> handleDuplicateKeyException(DuplicateKeyException e, HttpServletRequest request) {
        //记录异常
        recordException(e, request, "数据库中已存在记录");

        String requestURI = request.getRequestURI();
        log.error("请求地址'{}',数据库中已存在记录'{}'", requestURI, e.getMessage());
        return R.fail("数据库中已存在该记录，请联系管理员确认");
    }

    /**
     * Mybatis系统异常 通用处理
     */
    @ExceptionHandler(MyBatisSystemException.class)
    public R<Void> handleCannotFindDataSourceException(MyBatisSystemException e, HttpServletRequest request) {
        //记录异常
        recordException(e, request, "Mybatis系统异常");

        String requestURI = request.getRequestURI();
        String message = e.getMessage();
        if (message.contains("CannotFindDataSourceException")) {
            log.error("请求地址'{}', 未找到数据源", requestURI);
            return R.fail("未找到数据源，请联系管理员确认");
        }
        log.error("请求地址'{}', Mybatis系统异常", requestURI, e);
        return R.fail(message);
    }

    /**
     * 记录异常到错误日志
     */
    private void recordException(Exception e, HttpServletRequest request, String errorType) {
        try {
            LoginUser loginUser = LoginHelper.getLoginUser();
            SpringUtils.context().publishEvent(ErrorLogEvent.build(loginUser, errorType, e.getMessage(), request));
        } catch (Exception ignored) {
        }
    }

}
