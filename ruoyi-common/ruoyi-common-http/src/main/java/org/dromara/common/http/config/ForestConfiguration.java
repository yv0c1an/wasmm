package org.dromara.common.http.config;

import org.dromara.common.core.factory.YmlPropertySourceFactory;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.context.annotation.PropertySource;

/**
 * @author Feng
 */
@AutoConfiguration
@PropertySource(value = "classpath:common-forest.yml", factory = YmlPropertySourceFactory.class)
public class ForestConfiguration {
}
