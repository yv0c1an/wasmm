package org.dromara.wasm.api.util;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import org.dromara.wasm.api.model.RawData;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class CryptoUtil {


    /**
     * 获取市场数据
     */
    public static Map<String, RawData>  getMarketDataOld() {
        try {
            String res = HttpUtil.get("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH,TRX&tsyms=USD");
            JSONObject jo = JSONUtil.parseObj(res);

            JSONObject ethData = jo.getJSONObject("RAW").getJSONObject("ETH").getJSONObject("USD");
            JSONObject trxData = jo.getJSONObject("RAW").getJSONObject("TRX").getJSONObject("USD");

            BigDecimal ethPrice = ethData.getBigDecimal("PRICE").setScale(2);
            BigDecimal ethQuoteChange = ethData.getBigDecimal("CHANGEPCT24HOUR").setScale(3);

            BigDecimal trxPrice = trxData.getBigDecimal("PRICE").setScale(2);
            BigDecimal trxQuoteChange = trxData.getBigDecimal("CHANGEPCT24HOUR").setScale(3);

            Map<String, RawData> map = new HashMap<>();
            map.put("ETH", new RawData(ethPrice, ethQuoteChange));
            map.put("TRX", new RawData(trxPrice, trxQuoteChange));
            return map;
        } catch (Exception e) {
            Map<String, RawData> map = new HashMap<>();
            map.put("ETH", new RawData(BigDecimal.valueOf(3916.66), BigDecimal.valueOf(6.815)));
            map.put("TRX", new RawData(BigDecimal.valueOf(0.12), BigDecimal.valueOf(-2.669)));
            return map;
        }
    }

    /**
     * 获取市场数据
     */
    public static Map<String, Map<String, BigDecimal>>  getMarketData() {
        try {
            String res = HttpUtil.get("https://min-api.cryptocompare.com/data/pricemulti?fsyms=ETH,TRX&tsyms=USD");
            JSONObject jo = JSONUtil.parseObj(res);
            BigDecimal ethRata = jo.getJSONObject("ETH").getBigDecimal("USD").setScale(2);
            BigDecimal trxRata = jo.getJSONObject("TRX").getBigDecimal("USD").setScale(2);
            return makeDataOldResult(ethRata, trxRata);
        } catch (Exception e) {
            return makeDataOldResult(BigDecimal.valueOf(3916.66), BigDecimal.valueOf(0.12));

        }
    }

    public static BigDecimal getRate(String coin){
        try {
            String res = HttpUtil.get("https://min-api.cryptocompare.com/data/pricemulti?fsyms="+coin+"&tsyms=USD");
            JSONObject jo = JSONUtil.parseObj(res);
            BigDecimal rate = jo.getJSONObject(coin).getBigDecimal("USD").setScale(2);
            return rate;
        } catch (Exception e) {
            return BigDecimal.valueOf(0.00);
        }
    }




    private static Map<String, Map<String, BigDecimal>> makeDataResult(BigDecimal ethRate, BigDecimal trxRate) {
        // 使用匿名内部类的方式模拟对象字面量
        Map<String, BigDecimal> ethData = new HashMap<String, BigDecimal>() {{
            put("rate", ethRate);
        }};
        Map<String, BigDecimal> trxData = new HashMap<String, BigDecimal>() {{
            put("rate", trxRate);
        }};
        Map<String, Map<String, BigDecimal>> result = new HashMap<>();
        result.put("eth", ethData);
        result.put("trx", trxData);
        return result;
    }


}
