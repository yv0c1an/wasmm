package org.dromara.wasm.power.service.impl;

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
import org.dromara.wasm.power.domain.bo.WasmPowerBo;
import org.dromara.wasm.power.domain.vo.WasmPowerVo;
import org.dromara.wasm.power.domain.WasmPower;
import org.dromara.wasm.power.mapper.WasmPowerMapper;
import org.dromara.wasm.power.service.IWasmPowerService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 挖矿收益设置Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmPowerServiceImpl implements IWasmPowerService {

    private final WasmPowerMapper baseMapper;

    /**
     * 查询挖矿收益设置
     */
    @Override
    public WasmPowerVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询挖矿收益设置列表
     */
    @Override
    public TableDataInfo<WasmPowerVo> queryPageList(WasmPowerBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmPower> lqw = buildQueryWrapper(bo);
        Page<WasmPowerVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询挖矿收益设置列表
     */
    @Override
    public List<WasmPowerVo> queryList(WasmPowerBo bo) {
        LambdaQueryWrapper<WasmPower> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmPower> buildQueryWrapper(WasmPowerBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmPower> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmPower::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getType()), WasmPower::getType, bo.getType());
        lqw.eq(bo.getMinAmount() != null, WasmPower::getMinAmount, bo.getMinAmount());
        lqw.eq(bo.getMaxAmount() != null, WasmPower::getMaxAmount, bo.getMaxAmount());
        lqw.eq(bo.getMinRate() != null, WasmPower::getMinRate, bo.getMinRate());
        lqw.eq(bo.getMaxRate() != null, WasmPower::getMaxRate, bo.getMaxRate());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmPower::getId,searchValue)
                    .or()
                    .like(WasmPower::getType,searchValue)
                    .or()
                    .like(WasmPower::getMinAmount,searchValue)
                    .or()
                    .like(WasmPower::getMaxAmount,searchValue)
                    .or()
                    .like(WasmPower::getMinRate,searchValue)
                    .or()
                    .like(WasmPower::getMaxRate,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增挖矿收益设置
     */
    @Override
    public Boolean insertByBo(WasmPowerBo bo) {
        WasmPower add = BeanUtil.toBean(bo, WasmPower.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改挖矿收益设置
     */
    @Override
    public Boolean updateByBo(WasmPowerBo bo) {
        WasmPower update = BeanUtil.toBean(bo, WasmPower.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmPower entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmPower entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除挖矿收益设置
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
    public String importWasmPower(List<WasmPowerVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmPowerVo vo : excelList) {
                WasmPowerBo wasmPowerBo = BeanUtil.toBean(vo, WasmPowerBo.class);
            Integer id = wasmPowerBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmPower byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmPowerBo);
                    insertNum++;
                } else {
                    updateByBo(wasmPowerBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmPowerBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
