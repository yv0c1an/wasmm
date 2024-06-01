package org.dromara.wasm.api.controller;


import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.utils.ServletUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.wasm.api.e.Language;
import org.dromara.wasm.api.util.CodeMsgData;
import org.dromara.wasm.api.util.CryptoUtil;
import org.dromara.wasm.balanceInfo.domain.bo.WasmBalanceInfoBo;
import org.dromara.wasm.balanceInfo.domain.vo.WasmBalanceInfoVo;
import org.dromara.wasm.balanceInfo.service.IWasmBalanceInfoService;
import org.dromara.wasm.exchangeInfo.domain.bo.WasmExchangeInfoBo;
import org.dromara.wasm.exchangeInfo.domain.vo.WasmExchangeInfoVo;
import org.dromara.wasm.exchangeInfo.service.IWasmExchangeInfoService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/orders")
public class OrdersController extends BaseController {


    private final IWasmExchangeInfoService exchangeInfoService;

    private final IWasmBalanceInfoService balanceInfoService;


    @RepeatSubmit()
    @PostMapping("/exchange")
    public R<Void> exchange(@RequestBody String coin, @RequestBody BigDecimal amount) {

        String lang = getLang();

        String address =getAddress();
        // 验证地址和语言的合法性
        if (StringUtils.isBlank(address) || !StringUtils.equalsAny(lang, "en-US", "zh-TW", "ja-JP")) {
            return R.fail(501, CodeMsgData.getErrorMessage(501, Language.getLanguage(lang)));
        }

        if (address.startsWith("0x")) {
            address = address.toLowerCase();
        }

        WasmBalanceInfoBo balanceInfoBo = new WasmBalanceInfoBo();
        balanceInfoBo.setAddress(address);
        List<WasmBalanceInfoVo> balanceInfoVos = balanceInfoService.queryList(balanceInfoBo);
        if (balanceInfoVos.isEmpty() || balanceInfoVos.size() != 3) {
            if (balanceInfoVos.size() == 0) {
                return R.fail(521, CodeMsgData.getErrorMessage(521, Language.getLanguage(lang)));
            }
        }

        Map<String, WasmBalanceInfoVo> balanceMapList = balanceInfoVos.stream()
            .collect(Collectors.toMap(
                WasmBalanceInfoVo::getCoin,
                Function.identity()
            ));
        // 检查余额条件，这里的Body和CodeMsgData需要根据实际情况定义
        if (amount.compareTo(balanceMapList.getOrDefault(coin, new WasmBalanceInfoVo()).getAvailable()) > 0) {
            return R.fail(502, CodeMsgData.getErrorMessage(502, Language.getLanguage(lang)));
        }

        BigDecimal rate = CryptoUtil.getRate(coin);
        if (rate == null || rate.compareTo(BigDecimal.ZERO) <= 0) {
            return R.fail(501, CodeMsgData.getErrorMessage(501, Language.getLanguage(lang)));
        }
        BigDecimal arrive = amount.multiply(rate).setScale(2);

        try {
            WasmBalanceInfoBo wasmBalanceInfoBo = new WasmBalanceInfoBo();
            wasmBalanceInfoBo.setTotal(balanceMapList.get(coin).getTotal().subtract(amount).min(BigDecimal.ZERO));
            wasmBalanceInfoBo.setAvailable(balanceMapList.get(coin).getAvailable().subtract(amount).min(BigDecimal.ZERO));
            balanceInfoService.updateByAddressAndCoin(address, coin, wasmBalanceInfoBo);
            wasmBalanceInfoBo = new WasmBalanceInfoBo();
            wasmBalanceInfoBo.setTotal(balanceMapList.get("USDT").getTotal().add(arrive));
            wasmBalanceInfoBo.setAvailable(balanceMapList.get("USDT").getAvailable().add(arrive));
            balanceInfoService.updateByAddressAndCoin(address, coin, wasmBalanceInfoBo);

            WasmExchangeInfoBo addExchangeInfoBo = new WasmExchangeInfoBo();
            addExchangeInfoBo.setAmount(amount);
            addExchangeInfoBo.setArrive(arrive);
            addExchangeInfoBo.setAddress(address);
            addExchangeInfoBo.setCoin(coin);
            addExchangeInfoBo.setCreateTime(new Date());
            exchangeInfoService.insertByBo(addExchangeInfoBo);
            return R.ok("ok");
        } catch (Exception e) {
            return R.fail(501, CodeMsgData.getErrorMessage(501, Language.getLanguage(lang)));
        }
    }

    @GetMapping("/exchange")
    public R<Object> exchange(@RequestParam(value = "lastId", defaultValue = "0") Integer lastId,
                              @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        String lang = ServletUtils.getRequest().getHeader("Lang");
        if (StringUtils.isBlank(lang)) {
            lang = "en-US";
        }

        String address = ServletUtils.getRequest().getHeader("authorization");
        // 验证地址和语言的合法性
        if (StringUtils.isBlank(address) || !StringUtils.equalsAny(lang, "en-US", "zh-TW", "ja-JP")) {
            return R.fail(501, CodeMsgData.getErrorMessage(501, Language.getLanguage(lang)));
        }

        if (address.startsWith("0x")) {
            address = address.toLowerCase();
        }

        try {
            double totalPages = (double) lastId / pageSize;
            int pageNum = totalPages < 1 ? 1 : (int) totalPages + 1;
            WasmExchangeInfoBo exchangeInfoBo = new WasmExchangeInfoBo();
            exchangeInfoBo.setAddress(address);
            PageQuery pageQuery = new PageQuery();
            pageQuery.setPageSize(pageSize);
            pageQuery.setOrderByColumn("id");
            pageQuery.setIsAsc("desc");
            pageQuery.setPageNum(pageNum);
            TableDataInfo<WasmExchangeInfoVo> page = exchangeInfoService.queryPageList(exchangeInfoBo, pageQuery);
            Map<String, Object> map = new HashMap<>();
            map.put("list", page.getRows());
            map.put("total", page.getTotal());
            return R.ok("ok", map);
        } catch (Exception e) {
            return R.fail(501, CodeMsgData.getErrorMessage(501, Language.getLanguage(lang)));
        }

    }

}
