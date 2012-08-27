package ${package};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloController {
	
	private static final Logger log = LoggerFactory.getLogger(HelloController.class);
	private static final String view_id_hello = "hello";
	
	@RequestMapping(value="/hello", method=RequestMethod.GET)
	public String hello(Model model) {
		final String message = "Hello!";
		log.info(message);
		model.addAttribute("message", message);
		return view_id_hello;
	}

}
