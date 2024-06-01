package org.dromara.wasm.profits.service.impl;

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
import org.dromara.wasm.profits.domain.bo.WasmProfitsBo;
import org.dromara.wasm.profits.domain.vo.WasmProfitsVo;
import org.dromara.wasm.profits.domain.WasmProfits;
import org.dromara.wasm.profits.mapper.WasmProfitsMapper;
import org.dromara.wasm.profits.service.IWasmProfitsService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 利润记录Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmProfitsServiceImpl implements IWasmProfitsService {

    private final WasmProfitsMapper baseMapper;

    /**
     * 查询利润记录
     */
    @Override
    public WasmProfitsVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询利润记录列表
     */
    @Override
    public TableDataInfo<WasmProfitsVo> queryPageList(WasmProfitsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmProfits> lqw = buildQueryWrapper(bo);
        Page<WasmProfitsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询利润记录列表
     */
    @Override
    public List<WasmProfitsVo> queryList(WasmProfitsBo bo) {
        LambdaQueryWrapper<WasmProfits> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmProfits> buildQueryWrapper(WasmProfitsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmProfits> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmProfits::getId, bo.getId());
        lqw.eq(bo.getAmount() != null, WasmProfits::getAmount, bo.getAmount());
        lqw.eq(StringUtils.isNotBlank(bo.getCoin()), WasmProfits::getCoin, bo.getCoin());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmProfits::getAddress, bo.getAddress());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmProfits::getId,searchValue)
                    .or()
                    .like(WasmProfits::getAmount,searchValue)
                    .or()
                    .like(WasmProfits::getCoin,searchValue)
                    .or()
                    .like(WasmProfits::getAddress,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增利润记录
     */
    @Override
    public Boolean insertByBo(WasmProfitsBo bo) {
        WasmProfits add = BeanUtil.toBean(bo, WasmProfits.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改利润记录
     */
    @Override
    public Boolean updateByBo(WasmProfitsBo bo) {
        WasmProfits update = BeanUtil.toBean(bo, WasmProfits.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmProfits entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmProfits entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除利润记录
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
    public String importWasmProfits(List<WasmProfitsVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmProfitsVo vo : excelList) {
                WasmProfitsBo wasmProfitsBo = BeanUtil.toBean(vo, WasmProfitsBo.class);
            Integer id = wasmProfitsBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmProfits byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmProfitsBo);
                    insertNum++;
                } else {
                    updateByBo(wasmProfitsBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmProfitsBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
