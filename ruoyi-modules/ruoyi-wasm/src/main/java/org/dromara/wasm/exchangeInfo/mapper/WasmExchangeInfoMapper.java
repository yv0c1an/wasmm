package org.dromara.wasm.exchangeInfo.mapper;

import org.dromara.wasm.exchangeInfo.domain.WasmExchangeInfo;
import org.dromara.wasm.exchangeInfo.domain.vo.WasmExchangeInfoVo;
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
 * 交易记录Mapper接口
 *
 * @author ruoyi
 */
public interface WasmExchangeInfoMapper extends BaseMapperPlus<WasmExchangeInfo, WasmExchangeInfoVo> {

    /**
    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    List<WasmExchangeInfo> selectList(IPage<WasmExchangeInfo> page, @Param(Constants.WRAPPER) Wrapper<WasmExchangeInfo> queryWrapper);


    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int updateById(@Param(Constants.ENTITY) WasmExchangeInfo entity);

    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int deleteBatchIds(@Param(Constants.COLL) Collection<?> idList);
    */
}
