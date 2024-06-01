package org.dromara.common.mybatis.core.mapper;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.AbstractLambdaWrapper;
import com.baomidou.mybatisplus.core.conditions.SharedString;
import com.baomidou.mybatisplus.core.conditions.query.Query;
import com.baomidou.mybatisplus.core.conditions.segments.MergeSegments;
import com.baomidou.mybatisplus.core.metadata.TableFieldInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Predicate;

/**
 * @author Lion Li 参考LambdaQueryWrapper
 */
@SuppressWarnings("serial")
public class PlusLambdaQueryWrapper<T> extends AbstractLambdaWrapper<T, PlusLambdaQueryWrapper<T>>
        implements Query<PlusLambdaQueryWrapper<T>, T, SFunction<T, ?>> {

    /**
     * 查询字段
     */
    private SharedString sqlSelect = new SharedString();

    public PlusLambdaQueryWrapper() {
        this((T) null);
    }

    public PlusLambdaQueryWrapper(T entity) {
        super.setEntity(entity);
        super.initNeed();
    }

    public PlusLambdaQueryWrapper(Class<T> entityClass) {
        super.setEntityClass(entityClass);
        super.initNeed();
    }

    PlusLambdaQueryWrapper(T entity, Class<T> entityClass, SharedString sqlSelect, AtomicInteger paramNameSeq,
                           Map<String, Object> paramNameValuePairs, MergeSegments mergeSegments, SharedString paramAlias,
                           SharedString lastSql, SharedString sqlComment, SharedString sqlFirst) {
        super.setEntity(entity);
        super.setEntityClass(entityClass);
        this.paramNameSeq = paramNameSeq;
        this.paramNameValuePairs = paramNameValuePairs;
        this.expression = mergeSegments;
        this.sqlSelect = sqlSelect;
        this.paramAlias = paramAlias;
        this.lastSql = lastSql;
        this.sqlComment = sqlComment;
        this.sqlFirst = sqlFirst;
    }

    /**
     * SELECT 部分 SQL 设置
     *
     * @param columns 查询字段
     */
    @SafeVarargs
    @Override
    public final PlusLambdaQueryWrapper<T> select(SFunction<T, ?>... columns) {
        return select(Arrays.asList(columns));
    }

    @Override
    public PlusLambdaQueryWrapper<T> select(List<SFunction<T, ?>> columns) {
        if (CollectionUtils.isNotEmpty(columns)) {
            this.sqlSelect.setStringValue(columnsToString(false, columns));
        }
        return typedThis;
    }

    @Override
    public PlusLambdaQueryWrapper<T> select(boolean condition, List<SFunction<T, ?>> columns) {
        if (condition && CollectionUtils.isNotEmpty(columns)) {
            this.sqlSelect.setStringValue(columnsToString(false, columns));
        }
        return typedThis;
    }

    /**
     * 过滤查询的字段信息(主键除外!)
     * <p>例1: 只要 java 字段名以 "test" 开头的             -> select(i -&gt; i.getProperty().startsWith("test"))</p>
     * <p>例2: 只要 java 字段属性是 CharSequence 类型的     -> select(TableFieldInfo::isCharSequence)</p>
     * <p>例3: 只要 java 字段没有填充策略的                 -> select(i -&gt; i.getFieldFill() == FieldFill.DEFAULT)</p>
     * <p>例4: 要全部字段                                   -> select(i -&gt; true)</p>
     * <p>例5: 只要主键字段                                 -> select(i -&gt; false)</p>
     *
     * @param predicate 过滤方式
     * @return this
     */
    @Override
    public PlusLambdaQueryWrapper<T> select(Class<T> entityClass, Predicate<TableFieldInfo> predicate) {
        if (entityClass == null) {
            entityClass = getEntityClass();
        } else {
            setEntityClass(entityClass);
        }
        Assert.notNull(entityClass, "entityClass can not be null");
        this.sqlSelect.setStringValue(TableInfoHelper.getTableInfo(entityClass).chooseSelect(predicate));
        return typedThis;
    }

    @Override
    public String getSqlSelect() {
        return sqlSelect.getStringValue();
    }

    /**
     * 用于生成嵌套 sql
     * <p>故 sqlSelect 不向下传递</p>
     */
    @Override
    protected PlusLambdaQueryWrapper<T> instance() {
        return new PlusLambdaQueryWrapper<>(getEntity(), getEntityClass(), null, paramNameSeq, paramNameValuePairs,
                new MergeSegments(), paramAlias, SharedString.emptyString(), SharedString.emptyString(), SharedString.emptyString());
    }

    @Override
    public void clear() {
        super.clear();
        sqlSelect.toNull();
    }

    /**
     * 聚合函数 sum
     */
    public PlusLambdaQueryWrapper<T> sum(SFunction<T, ?> source) {
        aggfunc("sum", source, null);
        return typedThis;
    }

    /**
     * 聚合函数 sum
     */
    public PlusLambdaQueryWrapper<T> sum(SFunction<T, ?> source, SFunction<T, ?> func) {
        aggfunc("sum", source, func);
        return typedThis;
    }

    /**
     * 聚合函数 min
     */
    public PlusLambdaQueryWrapper<T> min(SFunction<T, ?> source) {
        aggfunc("min", source, null);
        return typedThis;
    }

    /**
     * 聚合函数 min
     */
    public PlusLambdaQueryWrapper<T> min(SFunction<T, ?> source, SFunction<T, ?> func) {
        aggfunc("min", source, func);
        return typedThis;
    }

    /**
     * 聚合函数 max
     */
    public PlusLambdaQueryWrapper<T> max(SFunction<T, ?> source) {
        aggfunc("max", source, null);
        return typedThis;
    }

    /**
     * 聚合函数 max
     */
    public PlusLambdaQueryWrapper<T> max(SFunction<T, ?> source, SFunction<T, ?> func) {
        aggfunc("max", source, func);
        return typedThis;
    }

    /**
     * 聚合函数 count
     */
    public PlusLambdaQueryWrapper<T> count(SFunction<T, ?> source) {
        aggfunc("count", source, null);
        return typedThis;
    }

    /**
     * 聚合函数 count
     */
    public PlusLambdaQueryWrapper<T> count(SFunction<T, ?> source, SFunction<T, ?> func) {
        aggfunc("count", source, func);
        return typedThis;
    }

    /**
     * 聚合函数 avg
     */
    public PlusLambdaQueryWrapper<T> avg(SFunction<T, ?> source, SFunction<T, ?> func) {
        aggfunc("avg", source, func);
        return typedThis;
    }

    /**
     * 聚合函数
     */
    public PlusLambdaQueryWrapper<T> aggfunc(String name, SFunction<T, ?> source, SFunction<T, ?> func) {
        String agg = (StringUtils.isBlank(this.sqlSelect.getStringValue()) ?
                "" : this.sqlSelect.getStringValue() + ", ") +
                name + " (" + columnToString(source) + ") as " +
                (ObjectUtil.isNull(func) ? columnToString(source) + "_" + name : columnToString(func));
        this.sqlSelect.setStringValue(agg);
        return typedThis;
    }
}
