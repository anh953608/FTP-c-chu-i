package bath.group3.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bath.group3.dao.ImportDataDAO;
import bath.group3.model.FileUploadForm;
import bath.group3.model.Group;
import bath.group3.model.User;
import bath.group3.util.ReadFileCSVUtil;

@Controller
public class ImportDataFromFilesController{
	private static final String UPLOAD_DIRECTORY ="/storage";  
	Session se;
	@RequestMapping(value="/importdata",method=RequestMethod.GET)
	protected ModelAndView displayImportData(HttpServletRequest request){
		// TODO Auto-generated method stub
		ModelAndView modelAndView = null;
		HttpSession session=request.getSession(false);
		if(session==null){
			modelAndView  = new ModelAndView("login");
			modelAndView.addObject("notify","Bạn chưa đăng nhập!");
		}
		else{
			modelAndView = new ModelAndView("import_data_from_files");
		}
		return modelAndView;
		
	}
	@RequestMapping(value="/handlingFiles",method=RequestMethod.POST)
	public String handlingFiles(@ModelAttribute("uploadForm") FileUploadForm upload,
			HttpSession session,RedirectAttributes redirectAttributes){
		MultipartFile[] files = upload.getFiles();
		ServletContext context = session.getServletContext();
		ArrayList<String> listFileSave = new ArrayList<String>();
	    String path = context.getRealPath(UPLOAD_DIRECTORY);
	    for (MultipartFile multipartFile : upload.getFiles()) {
	    	String fileName = multipartFile.getOriginalFilename();
			//Handle file content - multipartFile.getInputStream()
			BufferedOutputStream stream = null;
		    byte[] bytes;
		    try {
				bytes = multipartFile.getBytes();
			    stream =new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + fileName)));
			    stream.write(bytes);
			    listFileSave.add(path + File.separator + fileName);
			} catch (IOException e) {
				redirectAttributes.addFlashAttribute("Error", "Upload thất bại vui lòng thử lại!");
				return "redirect:importdata";
			}  
		    finally {
		    	try {
					stream.close();
				} catch (IOException e) {
					redirectAttributes.addFlashAttribute("Error", "Upload thất bại vui lòng thử lại!");
					return "redirect:importdata";
				}  
			}
		}
		   String saveStatus = "Không thể thêm User có id: ";
		    for(String urlFile: listFileSave){
		    	for(String[] a : ReadFileCSVUtil.readFilesCSV(urlFile)){
		    		Group group = new Group();
		    		group.setId(a[4]);
		    		User user = new User(a[0], a[1], a[2], a[3], group);
		    		System.out.println(user.getId() +","+user.getFirstName()+","+user.getLastName()+","+user.getPassword()+","+user.getGroup().getId() );
		    		try {
			    		se = new ImportDataDAO().insertDataFormFile(user);
					} catch (Exception e) {
						// TODO: handle exception
						saveStatus += "[ "+a[0]+" ] ";
						e.printStackTrace();
					}
		    	}
		    	
		    }
		    
		    //redirectAttributes.addFlashAttribute("ErrorImportData", saveStatus);
			return "redirect:importdata";
	}
}
