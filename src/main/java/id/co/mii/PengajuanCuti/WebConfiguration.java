package id.co.mii.PengajuanCuti;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 *
 * @author Juang Nasution
 */
@Configuration
@EnableAutoConfiguration
@EnableJpaRepositories("id.co.mii.PengajuanCuti.repo")

public class WebConfiguration {
    
}
