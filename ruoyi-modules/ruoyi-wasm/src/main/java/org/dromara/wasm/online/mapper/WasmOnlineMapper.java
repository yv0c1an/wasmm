package org.dromara.wasm.online.mapper;

import org.dromara.wasm.online.domain.WasmOnline;
import org.dromara.wasm.online.domain.vo.WasmOnlineVo;
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
 * 在线用户信息Mapper接口
 *
 * @author ruoyi
 */
public interface WasmOnlineMapper extends BaseMapperPlus<WasmOnline, WasmOnlineVo> {

    /**
    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    List<WasmOnline> selectList(IPage<WasmOnline> page, @Param(Constants.WRAPPER) Wrapper<WasmOnline> queryWrapper);


    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int updateById(@Param(Constants.ENTITY) WasmOnline entity);

    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int deleteBatchIds(@Param(Constants.COLL) Collection<?> idList);
    */
}
