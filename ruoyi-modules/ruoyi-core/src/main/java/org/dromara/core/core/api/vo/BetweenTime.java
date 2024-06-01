package org.dromara.core.core.api.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 默认起始终止时间
 *
 * @author ye
 */
@Data
public class BetweenTime implements Serializable {

    private static final long serialVersionUID = 1L;

    private String start;

    private String end;
}
