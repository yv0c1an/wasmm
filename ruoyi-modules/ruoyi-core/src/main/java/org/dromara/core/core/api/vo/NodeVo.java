package org.dromara.core.core.api.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 父子节点
 * @author bkywksj
 */
@Data
public class NodeVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 标签
     */
    private String label;

    /**
     * 值
     */
    private Object value;

    /**
     * 兼容前端tag标签
     */
    private Raw raw = new Raw();

    /**
     * 子节点
     */
    private List<NodeVo> children;

    @Data
    public static class Raw {
        private String listClass = "default";
    }

    public static NodeVo build(String label, Object value) {
        NodeVo nodeVo = new NodeVo();
        nodeVo.setLabel(label);
        nodeVo.setValue(value);
        return nodeVo;
    }

    public static NodeVo build(String label, Object value, List<NodeVo> children) {
        NodeVo nodeVo = new NodeVo();
        nodeVo.setLabel(label);
        nodeVo.setValue(value);
        nodeVo.setChildren(children);
        return nodeVo;
    }
}
