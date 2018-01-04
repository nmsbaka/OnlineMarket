package onlinemarket.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import onlinemarket.form.config.ContactConfig;
import onlinemarket.form.config.EmailSystemConfig;
import onlinemarket.form.config.GeneralConfig;
import onlinemarket.form.config.LogoConfig;
import onlinemarket.form.config.SocialConfig;
import onlinemarket.form.config.UploadConfig;
import onlinemarket.model.User;
import onlinemarket.service.UserService;
import onlinemarket.service.config.ConfigurationService;


@Controller
@RequestMapping("/admin/config")
public class ConfigurationController{
	
	@Autowired
	private ConfigurationService configurationService;
	
	@Autowired
	private UserService userService;
	
	private User currentUser;

	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
	
	@ModelAttribute
	public void populateMetaPage(ModelMap model) {
		model.put("general", configurationService.getGeneral());
		model.put("logo", configurationService.getLogo());
		model.put("upload", configurationService.getUpload());
		model.put("contact", configurationService.getContag());
		model.put("pageTitle", "Thiết lập");
		model.put("configPage", true);
		model.put("social", configurationService.getSocial());
	}
	
	@ModelAttribute("currentUser")
	public User getCurrentUser() {
		String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        
        currentUser = userService.getByEmail(userName);
        if(currentUser == null) {
            currentUser = new User();
            currentUser.setEmail(userName);
        } 
        return currentUser;
	}
	
	@RequestMapping(value = { "" }, method = RequestMethod.GET)
	public String configPage(@ModelAttribute("general") GeneralConfig general,ModelMap model) {
		model.put("path", "general");
		model.put("subTitlePage", "Cơ bản");
		model.put("generalConfig", general);
		model.put("description", "Thiết đặt một số thuộc tính cơ bản của ứng dụng.");
		return "backend/config";
	}
	
	@RequestMapping(value = { "" }, method = RequestMethod.POST)
	public String submitConfigPage(@Valid @ModelAttribute("general") GeneralConfig generalConfig, BindingResult result, ModelMap model) {
		model.put("path", "general");
		model.put("subPageTitle", "Cơ bản");
		model.put("description", "Thiết đặt một số thuộc tính cơ bản của ứng dụng.");
		if(!result.hasErrors()) {
			configurationService.saveGeneralConfig(generalConfig);
		}
		return "redirect:/admin/config?success";
	}
	
	@RequestMapping(value = { "upload" }, method = RequestMethod.GET)
	public String configUploadPage(@ModelAttribute("upload") UploadConfig upload, ModelMap model) {
		model.put("path", "upload");
		model.put("subPageTitle", "Truyền tải");
		model.put("description", "Thiết đặt các giới hạn truyền tải.");
		model.put("uploadConfig", upload);
		return "backend/config";
		
	}
	
	@RequestMapping(value = { "upload" }, method = RequestMethod.POST)
	public String submitUploadPage(@ModelAttribute("uploadConfig") UploadConfig upload, BindingResult result, ModelMap model) {
		model.put("path", "upload");
		model.put("subPageTitle", "Truyền tải");
		model.put("description", "Thiết đặt các giới hạn truyền tải.");
		if(!result.hasErrors()) {
			configurationService.saveUploadconfig(upload);
		}
		return "redirect:/admin/config/upload?success";
	}
	
	@RequestMapping(value = { "logo" }, method = RequestMethod.GET)
	public String configLogoPage(@ModelAttribute("logo") LogoConfig logo, ModelMap model) {
		model.put("path", "logo");
		model.put("subPageTitle", "Logo - Biểu tượng");
		model.put("description", "Thiết đặt hình ảnh biểu tượng của ứng dụng cũng như thương hiệu cửa hàng.");
		model.put("logoConfig", logo);
		return "backend/config"; 
	}
	
	@RequestMapping( value = {"contact"}, method = RequestMethod.GET)
	public String configContactPage(@ModelAttribute("contact") ContactConfig contact, ModelMap model) {
		model.put("path", "contact");
		model.put("subPageTitle", "Liên hệ");
		model.put("contactConfig", contact);
		model.put("description", "Thiết lập địa chỉ của cửa hàng giúp khách hàng nắm rõ nơi cửa hàng được đặt.");
		return "backend/config";
	}
	
	@RequestMapping( value = {"contact"}, method = RequestMethod.POST)
	public String submitContactPage(@ModelAttribute("contactConfig") ContactConfig contact,BindingResult result, ModelMap model) {
		
		model.put("path", "contact");
		model.put("subPageTitle", "Liên hệ");
		model.put("description", "Thiết lập địa chỉ của cửa hàng giúp khách hàng nắm rõ nơi cửa hàng được đặt.");
		if(!result.hasErrors()) {
			configurationService.saveContactConfig(contact);
		}
		return "redirect:/admin/config/contact?success";
	}
	
	@RequestMapping( value = {"social"}, method = RequestMethod.GET)
	public String configSocialPage(@ModelAttribute("social") SocialConfig social, ModelMap model) {
		
		model.put("path", "social");
		model.put("subPageTitle", "Mạng xã hội");
		model.put("description", "Thiết đặt các URL của trang mạng xã hội, hiển thị các ứng dụng của mạng xã hội.");
		model.put("socialConfig", social);
		
		return "backend/config";
	}
	
	@RequestMapping( value = {"social"}, method = RequestMethod.POST)
	public String submitSocialPage(@ModelAttribute("socialConfig") SocialConfig social,BindingResult result, ModelMap model) {
		
		model.put("path", "social");
		model.put("subPageTitle", "Mạng xã hội");
		model.put("description", "Thiết đặt các URL của trang mạng xã hội, hiển thị các ứng dụng của mạng xã hội.");
		if(!result.hasErrors()) {
			configurationService.saveSocialConfig(social);
		}
		return "redirect:/admin/config/social?success";
	}	
	
	@RequestMapping( value = {"emailsystem"}, method = RequestMethod.GET)
	public String configEmailSystemPage(@ModelAttribute("email") EmailSystemConfig email, ModelMap model) {
		
		model.put("path", "emailsystem");
		model.put("subPageTitle", "Hệ thống email");
		model.put("description", "Thiết đặt các thông số để ứng dụng có thể gửi thông báo đến khách hàng.");
		model.put("emailSystemConfig", configurationService.getEmail());
		
		return "backend/config";
	}
	
	@RequestMapping( value = {"emailsystem"}, method = RequestMethod.POST)
	public String submitEmailSystemPage(@ModelAttribute("emailSystemConfig") EmailSystemConfig email, BindingResult result, ModelMap model) {
		model.put("path", "emailsystem");
		model.put("subPageTitle", "Hệ thống email");
		model.put("description", "Thiết đặt các thông số để ứng dụng có thể gửi thông báo đến khách hàng.");
		if(!result.hasErrors()) {
			configurationService.saveEmailSystemConfig(email);
		}
		return "redirect:/admin/config/emailsystem?success";
	}
}