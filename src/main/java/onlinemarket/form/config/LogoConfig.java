package onlinemarket.form.config;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;


public class LogoConfig {
	
	@NotEmpty
	@Size(max=2048)
	@URL
	private String logo;
	
	@NotEmpty
	@Size(max=2048)
	@URL
	private String favicon;

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getFavicon() {
		return favicon;
	}

	public void setFavicon(String favicon) {
		this.favicon = favicon;
	}
	
}
