package org.dromara.system.errorLog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.model.LoginUser;
import org.dromara.common.core.enums.UserType;
import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.satoken.core.event.ErrorLogEvent;
import org.dromara.system.errorLog.domain.ErrorLog;
import org.dromara.system.errorLog.domain.bo.ErrorLogBo;
import org.dromara.system.errorLog.domain.vo.ErrorLogVo;
import org.dromara.system.errorLog.mapper.ErrorLogMapper;
import org.dromara.system.errorLog.service.IErrorLogService;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 错误日志Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class ErrorLogServiceImpl implements IErrorLogService {

    private final ErrorLogMapper baseMapper;

    @EventListener
    @Async
    public void saveErrorLog(ErrorLogEvent event) {
        try {
            LoginUser loginUser = event.getLoginUser();
            HttpServletRequest request = event.getRequest();
            //参数
            String args = IoUtil.read(request.getReader());
            ErrorLog errorLog = new ErrorLog();
            //loginUser一般不会为空 为空不设置用户信息
            if (ObjectUtil.isNotNull(loginUser)) {
                //设置用户id
                errorLog.setUid(loginUser.getUserId());
                //设置昵称
                errorLog.setNickname(loginUser.getUsername());
                //1移动端 0PC端
                errorLog.setType(UserType.APP_USER.getUserType().equals(loginUser.getUserType()) ? "1" : "0");
            }
            //错误类型
            errorLog.setErrorType(event.getErrorType());
            //请求路径
            errorLog.setUrl(request.getRequestURI());
            //方法
            errorLog.setMethod(request.getMethod());
            //参数
            errorLog.setArgs(args);
            //错误信息
            errorLog.setError(event.getErrorMessage());
            baseMapper.insert(errorLog);
        } catch (Exception ignored) {
        }
    }

    /**
     * 查询错误日志
     */
    @Override
    public ErrorLogVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询错误日志列表
     */
    @Override
    public TableDataInfo<ErrorLogVo> queryPageList(ErrorLogBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErrorLog> lqw = buildQueryWrapper(bo);
        Page<ErrorLogVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询错误日志列表
     */
    @Override
    public List<ErrorLogVo> queryList(ErrorLogBo bo) {
        LambdaQueryWrapper<ErrorLog> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErrorLog> buildQueryWrapper(ErrorLogBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErrorLog> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, ErrorLog::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getType()), ErrorLog::getType, bo.getType());
        lqw.eq(StringUtils.isNotBlank(bo.getErrorType()), ErrorLog::getErrorType, bo.getErrorType());
        lqw.eq(bo.getUid() != null, ErrorLog::getUid, bo.getUid());
        lqw.like(StringUtils.isNotBlank(bo.getNickname()), ErrorLog::getNickname, bo.getNickname());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), ErrorLog::getUrl, bo.getUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getMethod()), ErrorLog::getMethod, bo.getMethod());
        lqw.eq(StringUtils.isNotBlank(bo.getArgs()), ErrorLog::getArgs, bo.getArgs());
        lqw.eq(StringUtils.isNotBlank(bo.getError()), ErrorLog::getError, bo.getError());
        lqw.eq(StringUtils.isNotBlank(bo.getRemark()), ErrorLog::getRemark, bo.getRemark());

        String searchValue = bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
            lqw.and(w -> w
                .or()
                .like(ErrorLog::getId, searchValue)
                .or()
                .like(ErrorLog::getType, searchValue)
                .or()
                .like(ErrorLog::getErrorType, searchValue)
                .or()
                .like(ErrorLog::getUid, searchValue)
                .or()
                .like(ErrorLog::getNickname, searchValue)
                .or()
                .like(ErrorLog::getUrl, searchValue)
                .or()
                .like(ErrorLog::getMethod, searchValue)
                .or()
                .like(ErrorLog::getArgs, searchValue)
                .or()
                .like(ErrorLog::getError, searchValue)
                .or()
                .like(ErrorLog::getRemark, searchValue)
            );
        }
        return lqw;
    }

    /**
     * 新增错误日志
     */
    @Override
    public Boolean insertByBo(ErrorLogBo bo) {
        ErrorLog add = BeanUtil.toBean(bo, ErrorLog.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改错误日志
     */
    @Override
    public Boolean updateByBo(ErrorLogBo bo) {
        ErrorLog update = BeanUtil.toBean(bo, ErrorLog.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的处理
     *
     * @param entity 实体类数据
     */
    private void handleBeforeSave(ErrorLog entity) {
        //如果有数据权限 将部门id和用户id存入

    }

    /**
     * 更新前的处理
     *
     * @param entity 实体类数据
     */
    private void handleBeforeUpdate(ErrorLog entity) {
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除错误日志
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public String importErrorLog(List<ErrorLogVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (ErrorLogVo vo : excelList) {
            ErrorLog errorLog = BeanUtil.toBean(vo, ErrorLog.class);
            Long id = errorLog.getId();
            if (ObjectUtil.isNotNull(id)) {
                ErrorLog byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    baseMapper.insert(errorLog);
                    insertNum++;
                } else {
                    baseMapper.updateById(errorLog);
                    updateNum++;
                }
            } else {
                baseMapper.insert(errorLog);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);
    }
}
