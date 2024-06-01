package org.dromara.wasm.balanceInfo.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
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
import org.dromara.wasm.balanceInfo.domain.bo.WasmBalanceInfoBo;
import org.dromara.wasm.balanceInfo.domain.vo.WasmBalanceInfoVo;
import org.dromara.wasm.balanceInfo.domain.WasmBalanceInfo;
import org.dromara.wasm.balanceInfo.mapper.WasmBalanceInfoMapper;
import org.dromara.wasm.balanceInfo.service.IWasmBalanceInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 余额信息Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmBalanceInfoServiceImpl implements IWasmBalanceInfoService {

    private final WasmBalanceInfoMapper baseMapper;

    /**
     * 查询余额信息
     */
    @Override
    public WasmBalanceInfoVo queryById(Integer id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询余额信息列表
     */
    @Override
    public TableDataInfo<WasmBalanceInfoVo> queryPageList(WasmBalanceInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmBalanceInfo> lqw = buildQueryWrapper(bo);
        Page<WasmBalanceInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询余额信息列表
     */
    @Override
    public List<WasmBalanceInfoVo> queryList(WasmBalanceInfoBo bo) {
        LambdaQueryWrapper<WasmBalanceInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmBalanceInfo> buildQueryWrapper(WasmBalanceInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmBalanceInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmBalanceInfo::getId, bo.getId());
        lqw.eq(bo.getTotal() != null, WasmBalanceInfo::getTotal, bo.getTotal());
        lqw.eq(bo.getAvailable() != null, WasmBalanceInfo::getAvailable, bo.getAvailable());
        lqw.eq(bo.getFreezen() != null, WasmBalanceInfo::getFreezen, bo.getFreezen());
        lqw.eq(StringUtils.isNotBlank(bo.getCoin()), WasmBalanceInfo::getCoin, bo.getCoin());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmBalanceInfo::getAddress, bo.getAddress());

        String searchValue = bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
            lqw.and(w -> w
                .or()
                .like(WasmBalanceInfo::getId, searchValue)
                .or()
                .like(WasmBalanceInfo::getTotal, searchValue)
                .or()
                .like(WasmBalanceInfo::getAvailable, searchValue)
                .or()
                .like(WasmBalanceInfo::getFreezen, searchValue)
                .or()
                .like(WasmBalanceInfo::getCoin, searchValue)
                .or()
                .like(WasmBalanceInfo::getAddress, searchValue)
            );
        }
        return lqw;
    }

    /**
     * 新增余额信息
     */
    @Override
    public Boolean insertByBo(WasmBalanceInfoBo bo) {
        WasmBalanceInfo add = BeanUtil.toBean(bo, WasmBalanceInfo.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改余额信息
     */
    @Override
    public Boolean updateByBo(WasmBalanceInfoBo bo) {
        WasmBalanceInfo update = BeanUtil.toBean(bo, WasmBalanceInfo.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    @Override
    public Boolean updateByAddressAndCoin(String address, String coin, WasmBalanceInfoBo bo) {
        if (StringUtils.isAnyBlank(address, coin)){
//            log.error("address or coin is null");
            return false;
        }
        UpdateWrapper<WasmBalanceInfo> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("address", address)
            .eq("coin", coin);
        int rowsAffected = baseMapper.update(BeanUtil.toBean(bo, WasmBalanceInfo.class), updateWrapper);
        return rowsAffected > 0;
    }

    /**
     * 保存前的处理
     */
    private void handleBeforeSave(WasmBalanceInfo entity) {
        //做一些数据校验,如唯一约束

    }

    /**
     * 更新前的处理
     */
    private void handleBeforeUpdate(WasmBalanceInfo entity) {
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除余额信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量导入数据
     */
    @Override
    public String importWasmBalanceInfo(List<WasmBalanceInfoVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmBalanceInfoVo vo : excelList) {
            WasmBalanceInfoBo wasmBalanceInfoBo = BeanUtil.toBean(vo, WasmBalanceInfoBo.class);
            Integer id = wasmBalanceInfoBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmBalanceInfo byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmBalanceInfoBo);
                    insertNum++;
                } else {
                    updateByBo(wasmBalanceInfoBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmBalanceInfoBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);
    }
}
