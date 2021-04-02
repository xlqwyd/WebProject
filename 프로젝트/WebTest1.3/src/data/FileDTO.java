package data;

public class FileDTO {  //파일관련 클래스 (미완성)
	String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public FileDTO(String fileName) {
		super();
		this.fileName = fileName;
	}

}
