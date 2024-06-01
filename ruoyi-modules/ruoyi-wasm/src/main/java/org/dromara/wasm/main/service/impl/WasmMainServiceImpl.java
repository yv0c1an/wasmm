package org.dromara.wasm.main.service.impl;

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
import org.dromara.wasm.main.domain.bo.WasmMainBo;
import org.dromara.wasm.main.domain.vo.WasmMainVo;
import org.dromara.wasm.main.domain.WasmMain;
import org.dromara.wasm.main.mapper.WasmMainMapper;
import org.dromara.wasm.main.service.IWasmMainService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 系统核心配置Service业务层处理
 *
 * @author ruoyi
 */
@RequiredArgsConstructor
@Service
public class WasmMainServiceImpl implements IWasmMainService {

    private final WasmMainMapper baseMapper;

    /**
     * 查询系统核心配置
     */
    @Override
    public WasmMainVo queryById(Integer id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询系统核心配置列表
     */
    @Override
    public TableDataInfo<WasmMainVo> queryPageList(WasmMainBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WasmMain> lqw = buildQueryWrapper(bo);
        Page<WasmMainVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询系统核心配置列表
     */
    @Override
    public List<WasmMainVo> queryList(WasmMainBo bo) {
        LambdaQueryWrapper<WasmMain> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<WasmMain> buildQueryWrapper(WasmMainBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<WasmMain> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getId() != null, WasmMain::getId, bo.getId());
        lqw.eq(bo.getIsShowShare() != null, WasmMain::getIsShowShare, bo.getIsShowShare());
        lqw.eq(bo.getIsShowService() != null, WasmMain::getIsShowService, bo.getIsShowService());
        lqw.eq(StringUtils.isNotBlank(bo.getAddressErc()), WasmMain::getAddressErc, bo.getAddressErc());
        lqw.eq(StringUtils.isNotBlank(bo.getAddressTrc()), WasmMain::getAddressTrc, bo.getAddressTrc());
        lqw.eq(StringUtils.isNotBlank(bo.getChatLink()), WasmMain::getChatLink, bo.getChatLink());
        lqw.eq(StringUtils.isNotBlank(bo.getHomeBgUrl()), WasmMain::getHomeBgUrl, bo.getHomeBgUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getName()), WasmMain::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getCoin()), WasmMain::getCoin, bo.getCoin());
        lqw.eq(bo.getOutputEth() != null, WasmMain::getOutputEth, bo.getOutputEth());
        lqw.eq(bo.getParticipant() != null, WasmMain::getParticipant, bo.getParticipant());
        lqw.eq(bo.getValidNode() != null, WasmMain::getValidNode, bo.getValidNode());
        lqw.eq(StringUtils.isNotBlank(bo.getRange()), WasmMain::getRange, bo.getRange());
        lqw.eq(bo.getTheme() != null, WasmMain::getTheme, bo.getTheme());
        lqw.eq(bo.getMode() != null, WasmMain::getMode, bo.getMode());
        lqw.eq(bo.getUsdtDecimal() != null, WasmMain::getUsdtDecimal, bo.getUsdtDecimal());
        lqw.eq(StringUtils.isNotBlank(bo.getLogoUri()), WasmMain::getLogoUri, bo.getLogoUri());
        lqw.eq(StringUtils.isNotBlank(bo.getWhitePaperUrl()), WasmMain::getWhitePaperUrl, bo.getWhitePaperUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getDefaultLang()), WasmMain::getDefaultLang, bo.getDefaultLang());
        lqw.eq(StringUtils.isNotBlank(bo.getSupportLangs()), WasmMain::getSupportLangs, bo.getSupportLangs());
        lqw.eq(bo.getRebateLevel() != null, WasmMain::getRebateLevel, bo.getRebateLevel());
        lqw.eq(bo.getIsEnableErc() != null, WasmMain::getIsEnableErc, bo.getIsEnableErc());
        lqw.eq(bo.getIsEnableTrc() != null, WasmMain::getIsEnableTrc, bo.getIsEnableTrc());
        lqw.eq(bo.getOutputTrx() != null, WasmMain::getOutputTrx, bo.getOutputTrx());
        lqw.eq(bo.getTrcValidNodes() != null, WasmMain::getTrcValidNodes, bo.getTrcValidNodes());
        lqw.eq(bo.getTrcMemberCount() != null, WasmMain::getTrcMemberCount, bo.getTrcMemberCount());
        lqw.eq(StringUtils.isNotBlank(bo.getTrcRange()), WasmMain::getTrcRange, bo.getTrcRange());
        lqw.eq(bo.getIsShowRebate() != null, WasmMain::getIsShowRebate, bo.getIsShowRebate());
        lqw.eq(bo.getIsEnableRebate() != null, WasmMain::getIsEnableRebate, bo.getIsEnableRebate());
        lqw.eq(bo.getIsShowLangSwitch() != null, WasmMain::getIsShowLangSwitch, bo.getIsShowLangSwitch());
        lqw.eq(bo.getIsAutoShowChat() != null, WasmMain::getIsAutoShowChat, bo.getIsAutoShowChat());
        lqw.eq(StringUtils.isNotBlank(bo.getChatGreetText()), WasmMain::getChatGreetText, bo.getChatGreetText());
        lqw.eq(StringUtils.isNotBlank(bo.getAuditReportUrl()), WasmMain::getAuditReportUrl, bo.getAuditReportUrl());
        lqw.eq(StringUtils.isNotBlank(bo.getWhatsapp()), WasmMain::getWhatsapp, bo.getWhatsapp());
        lqw.eq(bo.getIsShowDrawFee() != null, WasmMain::getIsShowDrawFee, bo.getIsShowDrawFee());
        lqw.eq(bo.getForceOpenInviteCode() != null, WasmMain::getForceOpenInviteCode, bo.getForceOpenInviteCode());
        lqw.eq(StringUtils.isNotBlank(bo.getTemplateBackgroundUrl()), WasmMain::getTemplateBackgroundUrl, bo.getTemplateBackgroundUrl());
        lqw.eq(bo.getDrawAuthOpen() != null, WasmMain::getDrawAuthOpen, bo.getDrawAuthOpen());
        lqw.eq(bo.getCreditOpen() != null, WasmMain::getCreditOpen, bo.getCreditOpen());
        lqw.eq(bo.getPledgeOpen() != null, WasmMain::getPledgeOpen, bo.getPledgeOpen());
        lqw.eq(StringUtils.isNotBlank(bo.getPledgeErc()), WasmMain::getPledgeErc, bo.getPledgeErc());
        lqw.eq(StringUtils.isNotBlank(bo.getPledgeTrc()), WasmMain::getPledgeTrc, bo.getPledgeTrc());
        lqw.eq(StringUtils.isNotBlank(bo.getWithdrawFee()), WasmMain::getWithdrawFee, bo.getWithdrawFee());
        lqw.eq(bo.getCreatTime() != null, WasmMain::getCreatTime, bo.getCreatTime());

        String searchValue=bo.getSearchValue();
        //模糊查询
        if (StringUtils.isNotEmpty(searchValue)) {
        lqw.and(w->w
                    .or()
                    .like(WasmMain::getId,searchValue)
                    .or()
                    .like(WasmMain::getIsShowShare,searchValue)
                    .or()
                    .like(WasmMain::getIsShowService,searchValue)
                    .or()
                    .like(WasmMain::getAddressErc,searchValue)
                    .or()
                    .like(WasmMain::getAddressTrc,searchValue)
                    .or()
                    .like(WasmMain::getChatLink,searchValue)
                    .or()
                    .like(WasmMain::getHomeBgUrl,searchValue)
                    .or()
                    .like(WasmMain::getName,searchValue)
                    .or()
                    .like(WasmMain::getCoin,searchValue)
                    .or()
                    .like(WasmMain::getOutputEth,searchValue)
                    .or()
                    .like(WasmMain::getParticipant,searchValue)
                    .or()
                    .like(WasmMain::getValidNode,searchValue)
                    .or()
                    .like(WasmMain::getRange,searchValue)
                    .or()
                    .like(WasmMain::getTheme,searchValue)
                    .or()
                    .like(WasmMain::getMode,searchValue)
                    .or()
                    .like(WasmMain::getUsdtDecimal,searchValue)
                    .or()
                    .like(WasmMain::getLogoUri,searchValue)
                    .or()
                    .like(WasmMain::getWhitePaperUrl,searchValue)
                    .or()
                    .like(WasmMain::getDefaultLang,searchValue)
                    .or()
                    .like(WasmMain::getSupportLangs,searchValue)
                    .or()
                    .like(WasmMain::getRebateLevel,searchValue)
                    .or()
                    .like(WasmMain::getIsEnableErc,searchValue)
                    .or()
                    .like(WasmMain::getIsEnableTrc,searchValue)
                    .or()
                    .like(WasmMain::getOutputTrx,searchValue)
                    .or()
                    .like(WasmMain::getTrcValidNodes,searchValue)
                    .or()
                    .like(WasmMain::getTrcMemberCount,searchValue)
                    .or()
                    .like(WasmMain::getTrcRange,searchValue)
                    .or()
                    .like(WasmMain::getIsShowRebate,searchValue)
                    .or()
                    .like(WasmMain::getIsEnableRebate,searchValue)
                    .or()
                    .like(WasmMain::getIsShowLangSwitch,searchValue)
                    .or()
                    .like(WasmMain::getIsAutoShowChat,searchValue)
                    .or()
                    .like(WasmMain::getChatGreetText,searchValue)
                    .or()
                    .like(WasmMain::getAuditReportUrl,searchValue)
                    .or()
                    .like(WasmMain::getWhatsapp,searchValue)
                    .or()
                    .like(WasmMain::getIsShowDrawFee,searchValue)
                    .or()
                    .like(WasmMain::getForceOpenInviteCode,searchValue)
                    .or()
                    .like(WasmMain::getTemplateBackgroundUrl,searchValue)
                    .or()
                    .like(WasmMain::getDrawAuthOpen,searchValue)
                    .or()
                    .like(WasmMain::getCreditOpen,searchValue)
                    .or()
                    .like(WasmMain::getPledgeOpen,searchValue)
                    .or()
                    .like(WasmMain::getPledgeErc,searchValue)
                    .or()
                    .like(WasmMain::getPledgeTrc,searchValue)
                    .or()
                    .like(WasmMain::getWithdrawFee,searchValue)
                    .or()
                    .like(WasmMain::getCreatTime,searchValue)
        );
        }
        return lqw;
    }

    /**
     * 新增系统核心配置
     */
    @Override
    public Boolean insertByBo(WasmMainBo bo) {
        WasmMain add = BeanUtil.toBean(bo, WasmMain.class);
        handleBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改系统核心配置
     */
    @Override
    public Boolean updateByBo(WasmMainBo bo) {
        WasmMain update = BeanUtil.toBean(bo, WasmMain.class);
        handleBeforeUpdate(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
      * 保存前的处理
      *
      */
    private void handleBeforeSave(WasmMain entity){
        //做一些数据校验,如唯一约束

    }

    /**
    * 更新前的处理
    *
    */
    private void handleBeforeUpdate(WasmMain entity){
        if (ObjectUtil.isNull(baseMapper.selectById(entity.getId()))) {
            //如果查不出这条数据 抛出异常
            throw new ServiceException("数据不存在");
        }

    }

    /**
     * 批量删除系统核心配置
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
    public String importWasmMain(List<WasmMainVo> excelList) {
        if (CollUtil.isEmpty(excelList)) {
            return "请提供需要导入的数据";
        }
        long insertNum = 0L;
        long updateNum = 0L;
        for (WasmMainVo vo : excelList) {
                WasmMainBo wasmMainBo = BeanUtil.toBean(vo, WasmMainBo.class);
            Integer id = wasmMainBo.getId();
            if (ObjectUtil.isNotNull(id)) {
                WasmMain byId = baseMapper.selectById(id);
                if (ObjectUtil.isNull(byId)) {
                    insertByBo(wasmMainBo);
                    insertNum++;
                } else {
                    updateByBo(wasmMainBo);
                    updateNum++;
                }
            } else {
                insertByBo(wasmMainBo);
                insertNum++;
            }
        }
        return StringUtils.format("恭喜您，共新增{}条数据,更新{}条数据", insertNum, updateNum);}
}
