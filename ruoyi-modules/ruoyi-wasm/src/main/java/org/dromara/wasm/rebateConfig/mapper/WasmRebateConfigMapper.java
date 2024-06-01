package org.dromara.wasm.rebateConfig.mapper;

import org.dromara.wasm.rebateConfig.domain.WasmRebateConfig;
import org.dromara.wasm.rebateConfig.domain.vo.WasmRebateConfigVo;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.dromara.common.mybatis.annotation.DataColumn;
import org.dromara.common.mybatis.annotation.DataPermission;
import org.apache.ibatis.annotations.Param;
import java.util.Collection;
import java.util.List;

/**
 * 返利配置Mapper接口
 *
 * @author ruoyi
 */
public interface WasmRebateConfigMapper extends BaseMapperPlus<WasmRebateConfig, WasmRebateConfigVo> {

    /**
    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    List<WasmRebateConfig> selectList(IPage<WasmRebateConfig> page, @Param(Constants.WRAPPER) Wrapper<WasmRebateConfig> queryWrapper);


    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int updateById(@Param(Constants.ENTITY) WasmRebateConfig entity);

    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int deleteBatchIds(@Param(Constants.COLL) Collection<?> idList);
    */
}
