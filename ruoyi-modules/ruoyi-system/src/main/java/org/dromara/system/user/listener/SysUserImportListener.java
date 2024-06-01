package org.dromara.system.user.listener;

import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.core.utils.ValidatorUtils;
import org.dromara.common.excel.core.ExcelListener;
import org.dromara.common.excel.core.ExcelResult;
import org.dromara.common.satoken.utils.LoginHelper;
import org.dromara.system.user.domain.bo.SysUserBo;
import org.dromara.system.user.domain.vo.SysUserImportVo;
import org.dromara.system.config.service.ISysConfigService;
import org.dromara.system.user.domain.vo.SysUserVo;
import org.dromara.system.user.service.ISysUserService;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

/**
 * 系统用户自定义导入
 *
 * @author Lion Li
 */
@Slf4j
public class SysUserImportListener extends AnalysisEventListener<SysUserImportVo> implements ExcelListener<SysUserImportVo> {

    private final ISysUserService userService;

    private final String password;

    private final Boolean isUpdateSupport;

    private final Long operUserId;

    private int successNum = 0;
    private int failureNum = 0;
    private final StringBuilder successMsg = new StringBuilder();
    private final StringBuilder failureMsg = new StringBuilder();

    public SysUserImportListener(Boolean isUpdateSupport) {
        String initPassword = SpringUtils.getBean(ISysConfigService.class).selectConfigByKey("sys.user.initPassword");
        this.userService = SpringUtils.getBean(ISysUserService.class);
        this.password = BCrypt.hashpw(initPassword);
        this.isUpdateSupport = isUpdateSupport;
        this.operUserId = LoginHelper.getUserId();
    }

    @Override
    public void invoke(SysUserImportVo userVo, AnalysisContext context) {
        SysUserVo sysUser = this.userService.selectUserByUsername(userVo.getUsername());
        try {
            // 验证是否存在这个用户
            if (ObjectUtil.isNull(sysUser)) {
                SysUserBo user = BeanUtil.toBean(userVo, SysUserBo.class);
                ValidatorUtils.validate(user);
                user.setPassword(password);
                user.setCreateBy(operUserId);
                userService.insertUser(user);
                successNum++;
                successMsg.append("<br/>").append(successNum).append("、账号 ").append(user.getUsername()).append(" 导入成功");
            } else if (isUpdateSupport) {
                Long userId = sysUser.getUserId();
                SysUserBo user = BeanUtil.toBean(userVo, SysUserBo.class);
                user.setUserId(userId);
                ValidatorUtils.validate(user);
                userService.checkUserAllowed(user.getUserId());
                userService.checkUserDataScope(user.getUserId());
                user.setUpdateBy(operUserId);
                userService.updateUser(user);
                successNum++;
                successMsg.append("<br/>").append(successNum).append("、账号 ").append(user.getUsername()).append(" 更新成功");
            } else {
                failureNum++;
                failureMsg.append("<br/>").append(failureNum).append("、账号 ").append(sysUser.getUsername()).append(" 已存在");
            }
        } catch (Exception e) {
            failureNum++;
            String msg = "<br/>" + failureNum + "、账号 " + sysUser.getUsername() + " 导入失败：";
            failureMsg.append(msg).append(e.getMessage());
            log.error(msg, e);
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {

    }

    @Override
    public ExcelResult<SysUserImportVo> getExcelResult() {
        return new ExcelResult<SysUserImportVo>() {

            @Override
            public String getAnalysis() {
                if (failureNum > 0) {
                    failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                    throw new ServiceException(failureMsg.toString());
                } else {
                    successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
                }
                return successMsg.toString();
            }
            @Override
            public Map<Integer, String> getHead() {
                return null;
            }
            @Override
            public List<SysUserImportVo> getList() {
                return null;
            }
            @Override
            public List<String> getErrorList() {
                return null;
            }
        };
    }
}
