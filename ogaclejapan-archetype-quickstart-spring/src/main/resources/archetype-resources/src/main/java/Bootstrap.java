package ${package};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Bootstrap {
    
    private static final Logger log = LoggerFactory.getLogger(Bootstrap.class);

    /**
     * @param args
     */
    public static void main(String[] args) {
    	ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringConfig.class);
    	Bootstrap bootstrap = ctx.getBean(Bootstrap.class);
    	bootstrap.main(args);
    }
    
    public void main(String[] args) {
    	log.info("Hello world.");
    }

}
