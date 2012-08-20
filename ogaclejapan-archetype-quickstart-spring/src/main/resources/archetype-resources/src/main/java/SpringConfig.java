package ${package};

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {
    
	@Bean
	public Bootstrap bootstrap() {
		return new Bootstrap();
	}

}
