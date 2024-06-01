package org.dromara.wasm.notices.mapper;

import org.dromara.wasm.notices.domain.WasmNotices;
import org.dromara.wasm.notices.domain.vo.WasmNoticesVo;
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
 * 通知公告Mapper接口
 *
 * @author ruoyi
 */
public interface WasmNoticesMapper extends BaseMapperPlus<WasmNotices, WasmNoticesVo> {

    /**
    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    List<WasmNotices> selectList(IPage<WasmNotices> page, @Param(Constants.WRAPPER) Wrapper<WasmNotices> queryWrapper);


    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int updateById(@Param(Constants.ENTITY) WasmNotices entity);

    @Override
    @DataPermission({
        @DataColumn(key = "deptName", value = "create_dept"),
        @DataColumn(key = "username", value = "create_by")
    })
    int deleteBatchIds(@Param(Constants.COLL) Collection<?> idList);
    */
}
