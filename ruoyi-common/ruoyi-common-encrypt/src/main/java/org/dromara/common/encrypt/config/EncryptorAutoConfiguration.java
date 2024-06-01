package org.dromara.common.encrypt.config;

import org.dromara.common.encrypt.core.EncryptorManager;
import org.dromara.common.encrypt.interceptor.MybatisDecryptInterceptor;
import org.dromara.common.encrypt.interceptor.MybatisEncryptInterceptor;
import org.dromara.common.encrypt.properties.EncryptorProperties;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * 加解密配置
 *
 * @author 老马
 * @version 4.6.0
 */
@RequiredArgsConstructor
@AutoConfiguration
@EnableConfigurationProperties(EncryptorProperties.class)
@ConditionalOnProperty(value = "mybatis-encryptor.enable", havingValue = "true")
public class EncryptorAutoConfiguration {

    private final EncryptorProperties properties;

    @Bean
    public EncryptorManager encryptorManager() {
        return new EncryptorManager();
    }

    @Bean
    public MybatisEncryptInterceptor mybatisEncryptInterceptor(EncryptorManager encryptorManager) {
        return new MybatisEncryptInterceptor(encryptorManager, properties);
    }

    @Bean
    public MybatisDecryptInterceptor mybatisDecryptInterceptor(EncryptorManager encryptorManager) {
        return new MybatisDecryptInterceptor(encryptorManager, properties);
    }
}
