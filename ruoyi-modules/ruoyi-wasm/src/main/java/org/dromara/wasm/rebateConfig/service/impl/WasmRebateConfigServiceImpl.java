package org.dromara.wasm.rebateConfig.service.impl;

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
import org.dromara.wasm.rebateConfig.domain.bo.WasmRebateConfigBo;
import org.dromara.wasm.rebateConfig.domain.vo.WasmRebateConfigVo;
import org.dromara.wasm.rebateConfig.domain.WasmRebateConfig;
import org.dromara.wasm.rebateConfig.mapper.WasmRebateConfigMapper;
import org.dromara.wasm.rebateConfig.service.IWasmRebateConfigService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 返利配置Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmRebateConfigServiceImpl implements IWasmRebateConfigService {

    private final WasmRebateConfigMapper baseMapper;

    /**
     * 查询返利配置
     */
    @Override
    public WasmRebateConfigVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询返利配置列表
     */
    @Override
    public TableDataInfo<WasmRebateConfigVo> queryPageList(WasmRebateConfigBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmRebateConfig> lqw = buildQueryWrapper(bo);
        Page<WasmRebateConfigVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询返利配置列表
     */
    @Override
    public List<WasmRebateConfigVo> queryList(WasmRebateConfigBo bo) {
        LambdaQueryWrapper<WasmRebateConfig> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmRebateConfig> buildQueryWrapper(WasmRebateConfigBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmRebateConfig> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmRebateConfig::getId, bo.getId());
        lqw.eq(StringUtils.isNotBlank(bo.getEnName()), WasmRebateConfig::getEnName, bo.getEnName());
        lqw.eq(StringUtils.isNotBlank(bo.getJpName()), WasmRebateConfig::getJpName, bo.getJpName());
        lqw.eq(StringUtils.isNotBlank(bo.getTwName()), WasmRebateConfig::getTwName, bo.getTwName());
        lqw.eq(bo.getMinBalance() != null, WasmRebateConfig::getMinBalance, bo.getMinBalance());
        lqw.eq(bo.getLevel1() != null, WasmRebateConfig::getLevel1, bo.getLevel1());
        lqw.eq(bo.getLevel2() != null, WasmRebateConfig::getLevel2, bo.getLevel2());
        lqw.eq(bo.getLevel3() != null, WasmRebateConfig::getLevel3, bo.getLevel3());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmRebateConfig::getId,searchValue)
                    .or()
                    .like(WasmRebateConfig::getEnName,searchValue)
                    .or()
                    .like(WasmRebateConfig::getJpName,searchValue)
                    .or()
                    .like(WasmRebateConfig::getTwName,searchValue)
                    .or()
                    .like(WasmRebateConfig::getMinBalance,searchValue)
                    .or()
                    .like(WasmRebateConfig::getLevel1,searchValue)
                    .or()
                    .like(WasmRebateConfig::getLevel2,searchValue)
                    .or()
                    .like(WasmRebateConfig::getLevel3,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增返利配置
     */
    @Override
    public Boolean insertByBo(WasmRebateConfigBo bo) {
        WasmRebateConfig add = BeanUtil.toBean(bo, WasmRebateConfig.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改返利配置
     */
    @Override
    public Boolean updateByBo(WasmRebateConfigBo bo) {
        WasmRebateConfig update = BeanUtil.toBean(bo, WasmRebateConfig.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmRebateConfig entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmRebateConfig entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除返利配置
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
    public String importWasmRebateConfig(List<WasmRebateConfigVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmRebateConfigVo vo : excelList) {
                WasmRebateConfigBo wasmRebateConfigBo = BeanUtil.toBean(vo, WasmRebateConfigBo.class);
            Integer id = wasmRebateConfigBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmRebateConfig byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmRebateConfigBo);
                    insertNum++;
                } else {
                    updateByBo(wasmRebateConfigBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmRebateConfigBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
