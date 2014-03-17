#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.tutorial;

import static com.ogaclejapan.webmvc.util.WebPageUtils.*;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ogaclejapan.webmvc.AlertBuilder;
import com.ogaclejapan.webmvc.AlertIfHandler;
import com.ogaclejapan.webmvc.Entity;
import com.ogaclejapan.webmvc.ToastBuilder;
import com.ogaclejapan.webmvc.ToastIfHandler;
import com.ogaclejapan.webmvc.WebException;
import com.ogaclejapan.webmvc.util.WebEntityUtils;

@Controller
@RequestMapping("/tutorial")
public class TutorialController {
	
	private static final String PAGE_TUTORIAL = "tutorial";
	
	@RequestMapping(value={"", "/"}, method=RequestMethod.GET)
	public ModelAndView top() {
		return redirect301("/tutorial/step1");
	}
	
	@RequestMapping(value="/step1", method=RequestMethod.GET)
	public ModelAndView tryStep1(@RequestParam(required=false) String text) throws WebException {
		final String message = text;
		return ok(PAGE_TUTORIAL)
				.data("step1", true)
				.data("text", message)
				.alertIf(StringUtils.hasText(message), new AlertIfHandler() {
					@Override
					public void apply(AlertBuilder builder) {
						builder.alert(message);
					}
				});
	}
	
	@RequestMapping(value="/step1", method=RequestMethod.POST)
	public ModelAndView submitStep1(@RequestParam String text) throws Exception {
		return redirect("/tutorial/step1").queryParam("text", text);
	}
	
	@RequestMapping(value="/step2", method=RequestMethod.GET)
	public ModelAndView tryStep2(@RequestParam(required=false) String text) throws WebException {
		final String message = text;
		return ok(PAGE_TUTORIAL)
				.data("step2", true)
				.data("text", message)
				.toastIf(StringUtils.hasText(message), new ToastIfHandler() {
					@Override
					public void apply(ToastBuilder builder) {
						builder.toast(message);
					}
				});
	}
	
	@RequestMapping(value="/step2", method=RequestMethod.POST)
	public ModelAndView step2(@RequestParam String text) throws Exception {
		return redirect("/tutorial/step2").queryParam("text", text);
	}
	
	@RequestMapping(value="/step3", method=RequestMethod.GET)
	public ModelAndView tryStep3() throws WebException {
		return ok(PAGE_TUTORIAL).data("step3", true);
	}
	
	@RequestMapping(value="/step3", method=RequestMethod.POST)
	@ResponseBody
	public Entity step3(@RequestParam String text) throws Exception {
		final String message = text;
		return WebEntityUtils.ok().toastIf(StringUtils.hasText(message), new ToastIfHandler() {
			@Override
			public void apply(ToastBuilder builder) {
				builder.toast(message);
			}
		});
	}

}
