package org.dromara.wasm.withdraw.mapper;

import org.dromara.wasm.withdraw.domain.WasmWithdraw;
import org.dromara.wasm.withdraw.domain.vo.WasmWithdrawVo;
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
 * 提现Mapper接口
 *
 * @author ruoyi
 */
public interface WasmWithdrawMapper extends BaseMapperPlus<WasmWithdraw, WasmWithdrawVo> {

    /**
    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    List<WasmWithdraw> selectList(IPage<WasmWithdraw> page, @Param(Constants.WRAPPER) Wrapper<WasmWithdraw> queryWrapper);


    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int updateById(@Param(Constants.ENTITY) WasmWithdraw entity);

    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int deleteBatchIds(@Param(Constants.COLL) Collection<?> idList);
    */
}
