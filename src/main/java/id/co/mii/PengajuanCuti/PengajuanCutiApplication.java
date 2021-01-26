package id.co.mii.PengajuanCuti;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

//@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@EnableAutoConfiguration
@EnableJpaRepositories("id.co.mii.PengajuanCuti.repo")
//@EnableJpaRepositories("id.co.mii.PengajuanCuti.services")
public class PengajuanCutiApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(PengajuanCutiApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(PengajuanCutiApplication.class, args);
    }

}
