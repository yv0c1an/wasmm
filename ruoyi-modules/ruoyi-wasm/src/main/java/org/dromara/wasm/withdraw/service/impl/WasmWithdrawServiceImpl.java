package org.dromara.wasm.withdraw.service.impl;

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
import org.dromara.wasm.withdraw.domain.bo.WasmWithdrawBo;
import org.dromara.wasm.withdraw.domain.vo.WasmWithdrawVo;
import org.dromara.wasm.withdraw.domain.WasmWithdraw;
import org.dromara.wasm.withdraw.mapper.WasmWithdrawMapper;
import org.dromara.wasm.withdraw.service.IWasmWithdrawService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 提现Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmWithdrawServiceImpl implements IWasmWithdrawService {

    private final WasmWithdrawMapper baseMapper;

    /**
     * 查询提现
     */
    @Override
    public WasmWithdrawVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询提现列表
     */
    @Override
    public TableDataInfo<WasmWithdrawVo> queryPageList(WasmWithdrawBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmWithdraw> lqw = buildQueryWrapper(bo);
        Page<WasmWithdrawVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询提现列表
     */
    @Override
    public List<WasmWithdrawVo> queryList(WasmWithdrawBo bo) {
        LambdaQueryWrapper<WasmWithdraw> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmWithdraw> buildQueryWrapper(WasmWithdrawBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmWithdraw> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmWithdraw::getId, bo.getId());
        lqw.eq(bo.getAmount() != null, WasmWithdraw::getAmount, bo.getAmount());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null,
            WasmWithdraw::getCreateTime ,params.get("beginCreateTime"), params.get("endCreateTime"));
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), WasmWithdraw::getStatus, bo.getStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmWithdraw::getAddress, bo.getAddress());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmWithdraw::getId,searchValue)
                    .or()
                    .like(WasmWithdraw::getAmount,searchValue)
                    .or()
                    .like(WasmWithdraw::getCreateTime,searchValue)
                    .or()
                    .like(WasmWithdraw::getStatus,searchValue)
                    .or()
                    .like(WasmWithdraw::getAddress,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增提现
     */
    @Override
    public Boolean insertByBo(WasmWithdrawBo bo) {
        WasmWithdraw add = BeanUtil.toBean(bo, WasmWithdraw.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改提现
     */
    @Override
    public Boolean updateByBo(WasmWithdrawBo bo) {
        WasmWithdraw update = BeanUtil.toBean(bo, WasmWithdraw.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmWithdraw entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmWithdraw entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除提现
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 批量导入数据
     */
    @Override
    public String importWasmWithdraw(List<WasmWithdrawVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmWithdrawVo vo : excelList) {
                WasmWithdrawBo wasmWithdrawBo = BeanUtil.toBean(vo, WasmWithdrawBo.class);
            Long id = wasmWithdrawBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmWithdraw byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmWithdrawBo);
                    insertNum++;
                } else {
                    updateByBo(wasmWithdrawBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmWithdrawBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
