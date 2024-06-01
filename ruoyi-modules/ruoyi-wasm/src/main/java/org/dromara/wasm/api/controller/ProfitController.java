package org.dromara.wasm.api.controller;

import lombok.RequiredArgsConstructor;
import org.dromara.common.web.core.BaseController;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/profit")
public class ProfitController extends BaseController {


    public void profit(String url) {

    }
}
