package org.dromara.wasm.exchangeInfo.service.impl;

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
import org.dromara.wasm.exchangeInfo.domain.bo.WasmExchangeInfoBo;
import org.dromara.wasm.exchangeInfo.domain.vo.WasmExchangeInfoVo;
import org.dromara.wasm.exchangeInfo.domain.WasmExchangeInfo;
import org.dromara.wasm.exchangeInfo.mapper.WasmExchangeInfoMapper;
import org.dromara.wasm.exchangeInfo.service.IWasmExchangeInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 交易记录Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmExchangeInfoServiceImpl implements IWasmExchangeInfoService {

    private final WasmExchangeInfoMapper baseMapper;

    /**
     * 查询交易记录
     */
    @Override
    public WasmExchangeInfoVo queryById(Integer id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询交易记录列表
     */
    @Override
    public TableDataInfo<WasmExchangeInfoVo> queryPageList(WasmExchangeInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmExchangeInfo> lqw = buildQueryWrapper(bo);
        Page<WasmExchangeInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询交易记录列表
     */
    @Override
    public List<WasmExchangeInfoVo> queryList(WasmExchangeInfoBo bo) {
        LambdaQueryWrapper<WasmExchangeInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmExchangeInfo> buildQueryWrapper(WasmExchangeInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmExchangeInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmExchangeInfo::getId, bo.getId());
        lqw.eq(bo.getAmount() != null, WasmExchangeInfo::getAmount, bo.getAmount());
        lqw.eq(bo.getArrive() != null, WasmExchangeInfo::getArrive, bo.getArrive());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null,
            WasmExchangeInfo::getCreateTime, params.get("beginCreateTime"), params.get("endCreateTime"));
        lqw.eq(StringUtils.isNotBlank(bo.getCoin()), WasmExchangeInfo::getCoin, bo.getCoin());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmExchangeInfo::getAddress, bo.getAddress());

        String searchValue = bo.getSearchValue();
        if (params.get("lastId") != null) {
            Integer lastId = (Integer) params.get("lastId");
            if (lastId != 0) {
                lqw.lt(WasmExchangeInfo::getId, lastId);
            }
        }
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
            lqw.and(w -> w
                .or()
                .like(WasmExchangeInfo::getId, searchValue)
                .or()
                .like(WasmExchangeInfo::getAmount, searchValue)
                .or()
                .like(WasmExchangeInfo::getArrive, searchValue)
                .or()
                .like(WasmExchangeInfo::getCreateTime, searchValue)
                .or()
                .like(WasmExchangeInfo::getCoin, searchValue)
                .or()
                .like(WasmExchangeInfo::getAddress, searchValue)
            );
        }
        return lqw;
    }

    /**
     * 新增交易记录
     */
    @Override
    public Boolean insertByBo(WasmExchangeInfoBo bo) {
        WasmExchangeInfo add = BeanUtil.toBean(bo, WasmExchangeInfo.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改交易记录
     */
    @Override
    public Boolean updateByBo(WasmExchangeInfoBo bo) {
        WasmExchangeInfo update = BeanUtil.toBean(bo, WasmExchangeInfo.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的处理
     */
    private void handleBeforeSave(WasmExchangeInfo entity) {
        //做一些数据校验,如唯一约束

    }

    /**
     * 更新前的处理
     */
    private void handleBeforeUpdate(WasmExchangeInfo entity) {
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除交易记录
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
    public String importWasmExchangeInfo(List<WasmExchangeInfoVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmExchangeInfoVo vo : excelList) {
            WasmExchangeInfoBo wasmExchangeInfoBo = BeanUtil.toBean(vo, WasmExchangeInfoBo.class);
            Integer id = wasmExchangeInfoBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmExchangeInfo byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmExchangeInfoBo);
                    insertNum++;
                } else {
                    updateByBo(wasmExchangeInfoBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmExchangeInfoBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);
    }
}
