package OnlineMarket.form.config;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import OnlineMarket.validation.StringContain;

public class UploadForm {
	
	private List<MultipartFile> files;
	
	@NotEmpty
	@StringContain(acceptedValues= {"site", "post", "page", "product", "brand", "event", "user", "page"})
	private String uploadType;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}
	
}
