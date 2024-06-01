package org.dromara.wasm.online.service.impl;

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
import org.dromara.wasm.online.domain.bo.WasmOnlineBo;
import org.dromara.wasm.online.domain.vo.WasmOnlineVo;
import org.dromara.wasm.online.domain.WasmOnline;
import org.dromara.wasm.online.mapper.WasmOnlineMapper;
import org.dromara.wasm.online.service.IWasmOnlineService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 在线用户信息Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmOnlineServiceImpl implements IWasmOnlineService {

    private final WasmOnlineMapper baseMapper;

    /**
     * 查询在线用户信息
     */
    @Override
    public WasmOnlineVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询在线用户信息列表
     */
    @Override
    public TableDataInfo<WasmOnlineVo> queryPageList(WasmOnlineBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmOnline> lqw = buildQueryWrapper(bo);
        Page<WasmOnlineVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询在线用户信息列表
     */
    @Override
    public List<WasmOnlineVo> queryList(WasmOnlineBo bo) {
        LambdaQueryWrapper<WasmOnline> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmOnline> buildQueryWrapper(WasmOnlineBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmOnline> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmOnline::getId, bo.getId());
        lqw.eq(bo.getIsNew() != null, WasmOnline::getIsNew, bo.getIsNew());
        lqw.eq(StringUtils.isNotBlank(bo.getLanguage()), WasmOnline::getLanguage, bo.getLanguage());
        lqw.eq(StringUtils.isNotBlank(bo.getPlatform()), WasmOnline::getPlatform, bo.getPlatform());
        lqw.eq(StringUtils.isNotBlank(bo.getScreenInfo()), WasmOnline::getScreenInfo, bo.getScreenInfo());
        lqw.eq(StringUtils.isNotBlank(bo.getWalletAddress()), WasmOnline::getWalletAddress, bo.getWalletAddress());
        lqw.eq(StringUtils.isNotBlank(bo.getDeviceType()), WasmOnline::getDeviceType, bo.getDeviceType());
        lqw.between(params.get("beginTimestamp") != null && params.get("endTimestamp") != null,
            WasmOnline::getTimestamp ,params.get("beginTimestamp"), params.get("endTimestamp"));
        lqw.eq(StringUtils.isNotBlank(bo.getUserAddress()), WasmOnline::getUserAddress, bo.getUserAddress());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmOnline::getId,searchValue)
                    .or()
                    .like(WasmOnline::getIsNew,searchValue)
                    .or()
                    .like(WasmOnline::getLanguage,searchValue)
                    .or()
                    .like(WasmOnline::getPlatform,searchValue)
                    .or()
                    .like(WasmOnline::getScreenInfo,searchValue)
                    .or()
                    .like(WasmOnline::getWalletAddress,searchValue)
                    .or()
                    .like(WasmOnline::getDeviceType,searchValue)
                    .or()
                    .like(WasmOnline::getTimestamp,searchValue)
                    .or()
                    .like(WasmOnline::getUserAddress,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增在线用户信息
     */
    @Override
    public Boolean insertByBo(WasmOnlineBo bo) {
        WasmOnline add = BeanUtil.toBean(bo, WasmOnline.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改在线用户信息
     */
    @Override
    public Boolean updateByBo(WasmOnlineBo bo) {
        WasmOnline update = BeanUtil.toBean(bo, WasmOnline.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmOnline entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmOnline entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除在线用户信息
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
    public String importWasmOnline(List<WasmOnlineVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmOnlineVo vo : excelList) {
                WasmOnlineBo wasmOnlineBo = BeanUtil.toBean(vo, WasmOnlineBo.class);
            Integer id = wasmOnlineBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmOnline byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmOnlineBo);
                    insertNum++;
                } else {
                    updateByBo(wasmOnlineBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmOnlineBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
