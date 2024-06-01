package org.dromara.test;

import cn.hutool.core.lang.Console;
import org.dromara.common.core.config.RuoYiConfig;
import org.dromara.common.redis.utils.RedisUtils;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 单元测试案例
 *
 * @author Lion Li
 */
@SpringBootTest // 此注解只能在 springboot 主包下使用 需包含 main 方法与 yml 配置文件
@DisplayName("单元测试案例")
public class DemoUnitTest {

    @Autowired
    private RuoYiConfig ruoYiConfig;

    @DisplayName("测试lua脚本执行")
    @Test
    public void testLua() {
        // Lua 脚本内容
        String luaScript = "local key = KEYS[1]\n" +
            "local value = redis.call('GET', key)\n" +
            "return value";
        List<String> keys = Collections.singletonList("swsp:global:Authorization:login:token-session:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJhcHBfdXNlcjoxNzk0MTg4NjQ3NDU1Njc4NDY2Iiwicm5TdHIiOiIyWU5JaXNJYmVIaHRveFE3dVI2WUllTW5KU3NINkE0YSIsImNsaWVudGlkIjoiNDI4YTgzMTBjZDQ0Mjc1N2FlNjk5ZGY1ZDg5NGYwNTEiLCJ0ZW5hbnRJZCI6IjAwMDAwMCIsInVzZXJJZCI6MTc5NDE4ODY0NzQ1NTY3ODQ2NiwidXNlck5hbWUiOiJvRU41VDQzakphIn0.LXyRnQU10bmqfFdA7GXuyKsJHp8jNP5JNDXrkYdxxrY");
        Object test = RedisUtils.executeLua(luaScript, keys);
        Console.log("test:{}", test);
    }

    @DisplayName("测试 @SpringBootTest @Test @DisplayName 注解")
    @Test
    public void testTest() {
        System.out.println(ruoYiConfig);
    }

    @Disabled
    @DisplayName("测试 @Disabled 注解")
    @Test
    public void testDisabled() {
        System.out.println(ruoYiConfig);
    }

    @Timeout(value = 2L, unit = TimeUnit.SECONDS)
    @DisplayName("测试 @Timeout 注解")
    @Test
    public void testTimeout() throws InterruptedException {
        Thread.sleep(3000);
        System.out.println(ruoYiConfig);
    }


    @DisplayName("测试 @RepeatedTest 注解")
    @RepeatedTest(3)
    public void testRepeatedTest() {
        System.out.println(666);
    }

    @BeforeAll
    public static void testBeforeAll() {
        System.out.println("@BeforeAll ==================");
    }

    @BeforeEach
    public void testBeforeEach() {
        System.out.println("@BeforeEach ==================");
    }

    @AfterEach
    public void testAfterEach() {
        System.out.println("@AfterEach ==================");
    }

    @AfterAll
    public static void testAfterAll() {
        System.out.println("@AfterAll ==================");
    }

}
