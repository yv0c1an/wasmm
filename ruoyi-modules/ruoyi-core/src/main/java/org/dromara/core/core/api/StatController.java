package org.dromara.core.core.api;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.constant.Constants;
import org.dromara.common.core.constant.UserConstants;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.utils.DateUtils;
import org.dromara.common.web.core.BaseController;
import org.dromara.core.core.api.vo.BetweenTime;
import org.dromara.core.core.api.vo.NodeVo;
import org.dromara.system.user.domain.vo.ChartVo;
import org.dromara.system.user.service.ISysUserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


/**
 * 统计控制器
 *
 * @author yecha
 */
@RestController
@RequestMapping(Constants.CHECK)
@RequiredArgsConstructor
public class StatController extends BaseController {

    private final ISysUserService sysUserService;

    @GetMapping("getBetweenTime")
    public R<BetweenTime> getBetweenTime(String type) {
        BetweenTime betweenTime = new BetweenTime();
        DateTime now = DateUtil.date();
        switch (type) {
            //今日
            case "1":
                betweenTime.setStart(DateUtils.dateTime(now));
                betweenTime.setEnd(DateUtils.dateTime(DateUtil.offsetDay(now, 1)));
                break;
            //昨日
            case "2":
                betweenTime.setStart(DateUtils.dateTime(DateUtil.offsetDay(now, -1)));
                betweenTime.setEnd(DateUtils.dateTime(now));
                break;
            //7日内
            case "3":
                betweenTime.setStart(DateUtils.dateTime(DateUtil.offsetDay(now, -6)));
                betweenTime.setEnd(DateUtils.dateTime(DateUtil.offsetDay(now, 1)));
                break;
            //当月
            case "4":
                betweenTime.setStart(DateUtils.dateTime(DateUtil.beginOfMonth(now)));
                betweenTime.setEnd(DateUtils.dateTime(DateUtil.offsetDay(now, 1)));
                break;
            default:
                return R.fail("参数有误");
        }

        return ok("查询成功", betweenTime);

    }

    /**
     * 首页用户统计(仅管理员)
     */
    @SaCheckRole(value = {UserConstants.ADMIN_ROLE_KEY}, mode = SaMode.OR)
    @GetMapping("statUser")
    public R<List<NodeVo>> statUser() {
        ArrayList<NodeVo> res = new ArrayList<>();
        res.add(NodeVo.build("今日新增", String.valueOf(
            sysUserService.countBetweenCreateTime(DateUtils.offsetDay(0), DateUtils.offsetDay(1)))));
        res.add(NodeVo.build("昨日新增", String.valueOf(
            sysUserService.countBetweenCreateTime(DateUtils.offsetDay(-1), DateUtils.offsetDay(0)))));
        res.add(NodeVo.build("七日新增", String.valueOf(
            sysUserService.countBetweenCreateTime(DateUtils.offsetDay(-6), DateUtils.offsetDay(1)))));
        res.add(NodeVo.build("累计新增", String.valueOf(
            sysUserService.countBetweenCreateTime(null, null))));
        return ok("查询成功", res);
    }

    /**
     * 统计活跃用户 最后登录时间记录在系统用户表
     */
    @SaCheckRole(value = {UserConstants.ADMIN_ROLE_KEY}, mode = SaMode.OR)
    @GetMapping("statActiveUser")
    public R<List<NodeVo>> statActiveUser() {
        ArrayList<NodeVo> res = new ArrayList<>();
        res.add(NodeVo.build("今日活跃",
            sysUserService.countBetweenLoginDate(DateUtils.offsetDay(0), DateUtils.offsetDay(1))));
        res.add(NodeVo.build("昨日活跃",
            sysUserService.countBetweenLoginDate(DateUtils.offsetDay(-1), DateUtils.offsetDay(1))));
        res.add(NodeVo.build("七日活跃",
            sysUserService.countBetweenLoginDate(DateUtils.offsetDay(-6), DateUtils.offsetDay(1))));
        res.add(NodeVo.build("本月活跃",
            sysUserService.countBetweenLoginDate(DateUtil.beginOfMonth(DateUtils.offsetDay(0)), DateUtils.offsetDay(1))));
        return ok("查询成功", res);
    }

    /**
     * 统计每小时新增用户
     */
    @SaCheckRole(value = {UserConstants.ADMIN_ROLE_KEY}, mode = SaMode.OR)
    @GetMapping("statHourNewUser")
    public R<List<ChartVo>> statHourNewUser() {
        return ok("查询成功", sysUserService.statHourNewUser());
    }
}
