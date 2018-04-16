package onlinemarket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.groups.Default;

import onlinemarket.form.filter.FilterForm;
import onlinemarket.model.Post;
import onlinemarket.model.Product;
import onlinemarket.model.ProductCategory;
import onlinemarket.model.User;
import onlinemarket.result.ResultObject;
import onlinemarket.service.EventService;
import onlinemarket.service.PostService;
import onlinemarket.service.ProductService;
import onlinemarket.util.exception.productCategory.ProductCategoryNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import onlinemarket.model.other.AdvancedValidation;
import onlinemarket.service.ProvinceService;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("")
public class HomeController extends MainController {

	@Autowired
	ProductService productService;

	@Autowired
	ProvinceService provinceService;

	@Autowired
	EventService eventService;

	@Autowired
	PostService postService;

	@ModelAttribute
	public ModelMap populateAttribute(ModelMap model) {

		generateBreadcrumbs();

		return model;
	}

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {

		FilterForm filterForm = new FilterForm();

		FilterForm filterForm1 = new FilterForm();
		filterForm1.getGroupSearch().put("state", "0");
		filterForm1.setSize(5);
		filterForm1.setOrder("desc");
		filterForm1.setOrderBy("numberOrder");
		model.put("productBestSellerList",productService.list(filterForm1).getList());

		filterForm1.setSize(5);
		filterForm1.setOrder("desc");
		filterForm1.setOrderBy("productViewsStatistic.total");
		model.put("productBestViewing",productService.list(filterForm1).getList());

		filterForm1.setSize(5);
		filterForm1.setOrder("desc");
		filterForm1.setOrderBy("ratingStatistic.totalScore");
		model.put("productBestRating",productService.list(filterForm1).getList());

		filterForm.setOrderBy("releaseDate");
		filterForm.setOrder("desc");

		filterForm.setSize(10);
		filterForm.setOrder("desc");
		filterForm.setOrderBy("numberOrder");
		model.put("productBestSellerList",productService.list(filterForm).getList());

		filterForm.setOrderBy("productViewsStatistic.total");
		model.put("productBestViewing",productService.list(filterForm).getList());

		filterForm.setOrderBy("ratingStatistic.totalScore");
		model.put("productBestRating",productService.list(filterForm).getList());

		Map<ProductCategory,ResultObject<Product>> resultObjectList = new HashMap<>();
		filterForm.setOrderBy("releaseDate");
		for(ProductCategory productCategory : productCategoryList){
			try {
				ResultObject<Product> resultObject = productService.listByProductCategory(productCategory,filterForm);
				if(!resultObject.getList().isEmpty())
					resultObjectList.put(productCategory, resultObject);
			} catch (ProductCategoryNotFoundException e) {

			}
		}
		filterForm.getGroupSearch().remove("state");
		filterForm.getGroupSearch().put("status", "0");
		filterForm.setSize(3);
		filterForm.setOrderBy("createDate");

		model.put("eventList", eventService.list(filterForm).getList());
		model.put("resultObjectList", resultObjectList);
		model.put("pageTitle", "Home");
		return "frontend/index";
	}

	@RequestMapping(value = "/{postType:(?:post|page)}/{slug:[\\d\\w-]+}", method = RequestMethod.GET)
	public String postPage(@PathVariable("postType") String postType, @PathVariable("slug") String slug
			, ModelMap model) throws NoHandlerFoundException {
		relativePath = "/"+postType+"/"+slug;
		Post post = postService.getByDeclaration("slug", slug);
		if(post == null || post.getStatus() != 0) throw new NoHandlerFoundException(null,null,null);

		if(postType.equals("post"))
			breadcrumbs.add(new String[]{"/post-category", "List post"});

		breadcrumbs.add(new String[]{ relativePath, post.getTitle()});

		model.put("pageTile", post.getTitle());
		model.put("postTYpe", postType);
		model.put("post", post);


		return "frontend/post";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap model) {
		breadcrumbs.add(new String[]{"/login", "Login"});

		if (currentUser.getId() != null)
			return "redirect:/";
		model.put("pageTile", "Login");
		return "frontend/login";

	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String registerPage(ModelMap model) {
		breadcrumbs.add(new String[]{"/register", "Register"});

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
		breadcrumbs.add(new String[]{"/login", "Login"});
		model.put("pageTitle", "Register");
		model.put("provinceList", provinceService.list());

		return "frontend/register";

	}

	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public String contactPage(){
		return "frontend/about-us";
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
