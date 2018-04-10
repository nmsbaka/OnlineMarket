package onlinemarket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.groups.Default;

import onlinemarket.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import onlinemarket.model.other.AdvancedValidation;
import onlinemarket.service.ProvinceService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("")
public class HomeController extends MainController {

	@Autowired
	ProvinceService provinceService;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {

		model.put("pageTitle", "Home");
		return "frontend/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {

		if (currentUser.getId() != null)
			return "redirect:/";
		model.put("pageTile", "Login");
		return "frontend/login";

	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String registerPage(ModelMap model) {

		if (currentUser.getId() != null)
			return "redirect:/";

		model.put("pageTitle", "Register");
		model.put("provinceList", provinceService.list());
		model.put("user", new User());

		return "frontend/register";

	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public String processRegister(@ModelAttribute("user") @Validated(value = { Default.class,
			AdvancedValidation.CheckEmail.class, AdvancedValidation.Register.class })User user, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {

		// User and address are valid.
		if (!result.hasErrors()) {
			userService.save(user);
			redirectAttributes.addFlashAttribute("success", true);
			return "redirect:/login";
		}

		model.put("pageTitle", "Register");
		model.put("provinceList", provinceService.list());

		return "frontend/register";

	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	@ResponseStatus(code = HttpStatus.UNAUTHORIZED)
	public ModelAndView handleError401(HttpServletRequest request) {
		ModelAndView errorPage = new ModelAndView("backend/error");
		int httpErrorCode = 401;
		errorPage.addObject("pageTitle", httpErrorCode + " Error");
		errorPage.addObject("errorMsg", "You do not have permission to access here!");
		errorPage.addObject("code", httpErrorCode);
		return errorPage;

	}

}
