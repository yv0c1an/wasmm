package org.dromara.wasm.api.model;

import lombok.Data;

import java.math.BigDecimal;


@Data
public class RawData {

    private BigDecimal rate;
    private BigDecimal quoteChange;

    public RawData() {
    }

    public RawData(BigDecimal rate, BigDecimal quoteChange) {
        this.rate = rate;
        this.quoteChange = quoteChange;
    }
}
