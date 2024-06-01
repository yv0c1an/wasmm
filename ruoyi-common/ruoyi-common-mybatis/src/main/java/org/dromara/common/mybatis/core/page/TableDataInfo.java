package org.dromara.common.mybatis.core.page;

import cn.hutool.http.HttpStatus;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.dromara.common.core.utils.BeanCopyUtils;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 表格分页数据对象
 *
 * @author Lion Li
 */

@Data
@NoArgsConstructor
@Accessors(chain = true)
public class TableDataInfo<T> implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 消息状态码
     */
    private int code;

    /**
     * 消息内容
     */
    private String msg;

    /**
     * 总记录数
     */
    private long total;

    /**
     * 是否最后一页
     */
    private Boolean isEnd;

    /**
     * 列表数据
     */
    private List<T> rows;

    /**
     * 分页
     *
     * @param list  列表数据
     * @param total 总记录数
     */
    public TableDataInfo(List<T> list, long total) {
        this.rows = list;
        this.total = total;
    }

    public static <T> TableDataInfo<T> build(Page<T> page) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setMsg("查询成功");
        rspData.setRows(page.getRecords());
        rspData.setTotal(page.getTotal());
        //是否最后一页
        rspData.setIsEnd(!page.hasNext());
        return rspData;
    }

    public static <T> TableDataInfo<T> build(List<T> list) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(list.size());
        return rspData;
    }

    public static <T> TableDataInfo<T> build() {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setMsg("查询成功");
        return rspData;
    }

    public static <T> TableDataInfo<T> convert(TableDataInfo<?> tableDataInfo, Class<T> clazz) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setIsEnd(tableDataInfo.getIsEnd());
        rspData.setTotal(tableDataInfo.getTotal());
        rspData.setCode(tableDataInfo.getCode());
        rspData.setMsg(tableDataInfo.getMsg());
        //传入clazz转换
        List<T> rows = BeanCopyUtils.copyList(tableDataInfo.getRows(), clazz);
        rspData.setRows(rows);
        return rspData;
    }

    public static <T> TableDataInfo<T> buildDataInfo(List<T> list, Integer pageNum, Integer pageSize) {
        TableDataInfo<T> rspData = new TableDataInfo<>();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setMsg("查询成功");
        if (pageNum == null || pageSize == null) {
            //没有值就赋一个初始值
            pageNum = 1;
            pageSize = 10;
        }
        //pageNum:1 pageSize:10
        //0
        int start = (pageNum - 1) * pageSize;
        //10
        int end = pageNum * pageSize;
        ArrayList<T> res = new ArrayList<>();
        for (int i = start; i < (Math.min(end, list.size())); i++) {
            res.add(list.get(i));
        }
        rspData.setRows(res);
        rspData.setTotal(list.size());
        //计算是否最后一页
        rspData.setIsEnd(end >= list.size());
        return rspData;
    }

}
