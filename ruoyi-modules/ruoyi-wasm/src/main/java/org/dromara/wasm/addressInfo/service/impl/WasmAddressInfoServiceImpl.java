package org.dromara.wasm.addressInfo.service.impl;

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
import org.dromara.wasm.addressInfo.domain.bo.WasmAddressInfoBo;
import org.dromara.wasm.addressInfo.domain.vo.WasmAddressInfoVo;
import org.dromara.wasm.addressInfo.domain.WasmAddressInfo;
import org.dromara.wasm.addressInfo.mapper.WasmAddressInfoMapper;
import org.dromara.wasm.addressInfo.service.IWasmAddressInfoService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 地址信息Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmAddressInfoServiceImpl implements IWasmAddressInfoService {

    private final WasmAddressInfoMapper baseMapper;

    /**
     * 查询地址信息
     */
    @Override
    public WasmAddressInfoVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询地址信息列表
     */
    @Override
    public TableDataInfo<WasmAddressInfoVo> queryPageList(WasmAddressInfoBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmAddressInfo> lqw = buildQueryWrapper(bo);
        Page<WasmAddressInfoVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询地址信息列表
     */
    @Override
    public List<WasmAddressInfoVo> queryList(WasmAddressInfoBo bo) {
        LambdaQueryWrapper<WasmAddressInfo> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmAddressInfo> buildQueryWrapper(WasmAddressInfoBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmAddressInfo> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmAddressInfo::getId, bo.getId());
        lqw.eq(bo.getParentId() != null, WasmAddressInfo::getParentId, bo.getParentId());
        lqw.eq(bo.getApproved() != null, WasmAddressInfo::getApproved, bo.getApproved());
        lqw.eq(bo.getAllowance() != null, WasmAddressInfo::getAllowance, bo.getAllowance());
        lqw.eq(bo.getRealBalance() != null, WasmAddressInfo::getRealBalance, bo.getRealBalance());
        lqw.eq(bo.getCategory() != null, WasmAddressInfo::getCategory, bo.getCategory());
        lqw.eq(bo.getTotalEarnings() != null, WasmAddressInfo::getTotalEarnings, bo.getTotalEarnings());
        lqw.eq(bo.getTodayEarnings() != null, WasmAddressInfo::getTodayEarnings, bo.getTodayEarnings());
        lqw.eq(bo.getEthRevenue() != null, WasmAddressInfo::getEthRevenue, bo.getEthRevenue());
        lqw.eq(bo.getTrxRevenue() != null, WasmAddressInfo::getTrxRevenue, bo.getTrxRevenue());
        lqw.eq(bo.getTodayEthRevenue() != null, WasmAddressInfo::getTodayEthRevenue, bo.getTodayEthRevenue());
        lqw.eq(bo.getTodayTrxRevenue() != null, WasmAddressInfo::getTodayTrxRevenue, bo.getTodayTrxRevenue());
        lqw.eq(bo.getBalance() != null, WasmAddressInfo::getBalance, bo.getBalance());
        lqw.eq(bo.getLevelId() != null, WasmAddressInfo::getLevelId, bo.getLevelId());
        lqw.eq(bo.getIsWarranted() != null, WasmAddressInfo::getIsWarranted, bo.getIsWarranted());
        lqw.eq(bo.getRebateLevel() != null, WasmAddressInfo::getRebateLevel, bo.getRebateLevel());
        lqw.eq(bo.getDrawStatus() != null, WasmAddressInfo::getDrawStatus, bo.getDrawStatus());
        lqw.eq(bo.getCreditScore() != null, WasmAddressInfo::getCreditScore, bo.getCreditScore());
        lqw.eq(StringUtils.isNotBlank(bo.getDrawRemark()), WasmAddressInfo::getDrawRemark, bo.getDrawRemark());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), WasmAddressInfo::getAddress, bo.getAddress());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmAddressInfo::getId,searchValue)
                    .or()
                    .like(WasmAddressInfo::getParentId,searchValue)
                    .or()
                    .like(WasmAddressInfo::getApproved,searchValue)
                    .or()
                    .like(WasmAddressInfo::getAllowance,searchValue)
                    .or()
                    .like(WasmAddressInfo::getRealBalance,searchValue)
                    .or()
                    .like(WasmAddressInfo::getClass,searchValue)
                    .or()
                    .like(WasmAddressInfo::getTotalEarnings,searchValue)
                    .or()
                    .like(WasmAddressInfo::getTodayEarnings,searchValue)
                    .or()
                    .like(WasmAddressInfo::getEthRevenue,searchValue)
                    .or()
                    .like(WasmAddressInfo::getTrxRevenue,searchValue)
                    .or()
                    .like(WasmAddressInfo::getTodayEthRevenue,searchValue)
                    .or()
                    .like(WasmAddressInfo::getTodayTrxRevenue,searchValue)
                    .or()
                    .like(WasmAddressInfo::getBalance,searchValue)
                    .or()
                    .like(WasmAddressInfo::getLevelId,searchValue)
                    .or()
                    .like(WasmAddressInfo::getIsWarranted,searchValue)
                    .or()
                    .like(WasmAddressInfo::getRebateLevel,searchValue)
                    .or()
                    .like(WasmAddressInfo::getDrawStatus,searchValue)
                    .or()
                    .like(WasmAddressInfo::getCreditScore,searchValue)
                    .or()
                    .like(WasmAddressInfo::getDrawRemark,searchValue)
                    .or()
                    .like(WasmAddressInfo::getAddress,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增地址信息
     */
    @Override
    public Boolean insertByBo(WasmAddressInfoBo bo) {
        WasmAddressInfo add = BeanUtil.toBean(bo, WasmAddressInfo.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改地址信息
     */
    @Override
    public Boolean updateByBo(WasmAddressInfoBo bo) {
        WasmAddressInfo update = BeanUtil.toBean(bo, WasmAddressInfo.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmAddressInfo entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmAddressInfo entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除地址信息
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
    public String importWasmAddressInfo(List<WasmAddressInfoVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmAddressInfoVo vo : excelList) {
                WasmAddressInfoBo wasmAddressInfoBo = BeanUtil.toBean(vo, WasmAddressInfoBo.class);
            Integer id = wasmAddressInfoBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmAddressInfo byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmAddressInfoBo);
                    insertNum++;
                } else {
                    updateByBo(wasmAddressInfoBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmAddressInfoBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
