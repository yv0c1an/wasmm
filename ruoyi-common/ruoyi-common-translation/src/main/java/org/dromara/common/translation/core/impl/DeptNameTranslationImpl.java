package org.dromara.common.translation.core.impl;

import org.dromara.common.core.service.DeptService;
import org.dromara.common.translation.annotation.TranslationType;
import org.dromara.common.translation.constant.TransConstant;
import org.dromara.common.translation.core.TranslationInterface;
import lombok.RequiredArgsConstructor;

/**
 * 部门翻译实现
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@TranslationType(type = TransConstant.DEPT_ID_TO_NAME)
public class DeptNameTranslationImpl implements TranslationInterface<String> {

    private final DeptService deptService;

    @Override
    public String translation(Object key, String other) {
        return deptService.selectDeptNameByIds(key.toString());
    }
}
