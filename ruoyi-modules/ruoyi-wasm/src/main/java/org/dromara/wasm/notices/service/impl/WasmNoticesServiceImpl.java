package org.dromara.wasm.notices.service.impl;

import org.dromara.common.core.exception.ServiceException;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.collection.CollUtil;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.dromara.wasm.notices.domain.bo.WasmNoticesBo;
import org.dromara.wasm.notices.domain.vo.WasmNoticesVo;
import org.dromara.wasm.notices.domain.WasmNotices;
import org.dromara.wasm.notices.mapper.WasmNoticesMapper;
import org.dromara.wasm.notices.service.IWasmNoticesService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 通知公告Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmNoticesServiceImpl implements IWasmNoticesService {

    private final WasmNoticesMapper baseMapper;

    /**
     * 查询通知公告
     */
    @Override
    public WasmNoticesVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询通知公告列表
     */
    @Override
    public TableDataInfo<WasmNoticesVo> queryPageList(WasmNoticesBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmNotices> lqw = buildQueryWrapper(bo);
        Page<WasmNoticesVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询通知公告列表
     */
    @Override
    public List<WasmNoticesVo> queryList(WasmNoticesBo bo) {
        LambdaQueryWrapper<WasmNotices> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmNotices> buildQueryWrapper(WasmNoticesBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmNotices> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmNotices::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getTitle()), WasmNotices::getTitle, bo.getTitle());
        lqw.eq(StringUtils.isNotBlank(bo.getContent()), WasmNotices::getContent, bo.getContent());
        lqw.eq(bo.getStatus() != null, WasmNotices::getStatus, bo.getStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmNotices::getAddress, bo.getAddress());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmNotices::getId,searchValue)
                    .or()
                    .like(WasmNotices::getTitle,searchValue)
                    .or()
                    .like(WasmNotices::getContent,searchValue)
                    .or()
                    .like(WasmNotices::getStatus,searchValue)
                    .or()
                    .like(WasmNotices::getAddress,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增通知公告
     */
    @Override
    public Boolean insertByBo(WasmNoticesBo bo) {
        WasmNotices add = BeanUtil.toBean(bo, WasmNotices.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改通知公告
     */
    @Override
    public Boolean updateByBo(WasmNoticesBo bo) {
        WasmNotices update = BeanUtil.toBean(bo, WasmNotices.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmNotices entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmNotices entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除通知公告
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量导入数据
     */
    @Override
    public String importWasmNotices(List<WasmNoticesVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmNoticesVo vo : excelList) {
                WasmNoticesBo wasmNoticesBo = BeanUtil.toBean(vo, WasmNoticesBo.class);
            Integer id = wasmNoticesBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmNotices byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmNoticesBo);
                    insertNum++;
                } else {
                    updateByBo(wasmNoticesBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmNoticesBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
