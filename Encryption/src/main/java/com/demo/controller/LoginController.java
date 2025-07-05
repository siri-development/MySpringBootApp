package com.demo.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.ml.DebitCard;
import com.demo.ml.EmailRequest;
import com.demo.ml.EncryptionBean;
import com.demo.service.CardsServiceInterface;
import com.demo.service.ServiceInterface;
import com.demo.util.EncryptionUtils;
import com.demo.util.StringUtil;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import java.nio.file.Files;
@org.springframework.stereotype.Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private ServiceInterface service;

	@GetMapping("/login")
	public String loginForm() {

		return "login";
	}

	@PostMapping("/login")
	public String loginSubmit(@RequestParam String username, @RequestParam String password, Model map) {
		
		  logger.info("Attempting to authenticate user with username: {}", username);
		  
		 Optional<EncryptionBean> user = service.authenticate(username, password);
	        if (user.isPresent()) {
	        	logger.info("Login successful for USER::::::: {}",user);
	        	 logger.info("Login successful for user: {} and password : {}", username,password);
	            return "welcome"; // Redirect to welcome page
	        }  else {
	        	 logger.warn("Login failed for user: {}", username);
			map.addAttribute("message", "Provided Username or Password is wrong, Please re-enter..!");
			return "login";
		}
	}
//new line
	@GetMapping("/getHomePage")
	public String getHomePage() {
		return "welcome";
	}

	@GetMapping("/getSignUpPage")
	public String getSignUpPage() {
		return "getSignUpPage";
	}

	@PostMapping("/saveSignUpDetails")
	public String saveSignUpDetails(EncryptionBean bean, Model model) throws Exception {
		try {
			if (bean != null) {
				EncryptionUtils.processEncryption(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.save(bean);
		List<EncryptionBean> list = service.getAllSignUpDetails();
		for (EncryptionBean data : list) {
			EncryptionUtils.processDecryption(data);
		}
		model.addAttribute("list", list);
		return "redirect:/login";
	}

	@GetMapping("/getSignUpDetails")
	public String getSignUpDetails(Model model, @RequestParam(defaultValue = "0") int page) {
		List<EncryptionBean> list = service.getAllSignUpDetails();
		int pageSize = 10;
		Pageable pageable = PageRequest.of(page, pageSize);
		Page<EncryptionBean> userPage = service.getPaginatedSignUpDetails(pageable);

		List<EncryptionBean> decryptedList = new ArrayList<>();
		for (EncryptionBean item : userPage.getContent()) {
			try {
				EncryptionUtils.processDecryption(item);
				String masked = StringUtil.maskAccountNumber(item.getAccountNumber());
				item.setAccountNumber(masked);
				decryptedList.add(item);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("list", userPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", userPage.getTotalPages());
		return "getSignUpDetails";
	}
	@GetMapping("/getByID")
	public String getByIDPage() {
		return "getSearchByIdPage";
	}

	@GetMapping("/getCustDetails")
	public String getDetailsById(@RequestParam("accountId") Long id, ModelMap map) {
    	logger.info("=========================:::::::::::id:::::::::::  {}",id);

		EncryptionBean details = service.getCustById(id);
		if (details != null  && details.getAccountId()!=null) {
			try {
				EncryptionUtils.processDecryption(details);
			} catch (Exception e) {
				e.printStackTrace();
			}
			map.put("details", details);
        	logger.info("=========================::::::::::::::::::::::  {}",details);
			return "getSingleBankAcntDetails";
		} else {
			map.addAttribute("message", "No details found for the provided Account ID.");
			//return "redirect:/getByID";
			return "getSearchByIdPage";

		}
	}

	@GetMapping("/addBank")
	public String getAddBankPage() {
		return "getAddBank";
	}

	@GetMapping("/editBank/{id}")
	public String editSignUpDetails(@PathVariable Long id, Model model) {
		EncryptionBean bank = service.getCustById(id);
		if (bank != null) {
			try {
				EncryptionUtils.processDecryption(bank);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("bank", bank);
			return "editBank";
		} else {
			return "redirect:/getSignUpDetails";
		}
	}

	@GetMapping("/deleteBank/{id}")
	public String deleteBankDetailsByID(@PathVariable Long id, Model model) throws Exception {
		service.deleteById(id);
		List<EncryptionBean> list = service.getAllSignUpDetails();
		for (EncryptionBean data : list) {
			EncryptionUtils.processDecryption(data);
		}
		model.addAttribute("list", list);
		return "getSignUpDetails";
	}

	@GetMapping("/uploadPage/{id}")
	public String getUploadPage(@PathVariable Long id, Model model) {
		model.addAttribute("accountId", id);
		return "uploadFilePage";
	}

	@PostMapping("/uploadFile")
	public String uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("accountId") Long id,
			RedirectAttributes redirectAttributes) {
		try {
			EncryptionBean b = new EncryptionBean();
			b.setAccountId(id);
			service.store(file, b);
			redirectAttributes.addFlashAttribute("message",
					"You successfully uploaded " + file.getOriginalFilename() + "!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "Failed to upload " + file.getOriginalFilename() + "!");
		}
		return "redirect:/getSignUpDetails";
	}

	@GetMapping("/files/{id}")
	public ResponseEntity<Resource> viewFile(@PathVariable Long id) throws MalformedURLException {
		System.out.println(id + "===============:::::id::::::::" + id);
		String filename = service.getFileNameById(id);
		Path fileStorageLocation = Paths.get(filename).toAbsolutePath().normalize();
		Resource file = new UrlResource(fileStorageLocation.toUri());

		if (filename == null || filename.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
		}
		if (!Files.exists(fileStorageLocation)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
		}

		if (!file.isReadable()) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
		System.out.println(id + "===============:::::filename::::::::" + filename);
		/*
		 * return ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, "image/jpeg")
		 * .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" +
		 * file.getFilename() + "\"").body(file);
		 * 
		 */
		String contentType = null;
	    try {
	        contentType = Files.probeContentType(fileStorageLocation);
	    } catch (IOException e) {
	        contentType = "application/octet-stream"; // Default to binary stream if the type can't be determined
	    }
		 return ResponseEntity.ok()
		            .header(HttpHeaders.CONTENT_TYPE, contentType != null ? contentType : "application/octet-stream")
		            .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + file.getFilename() + "\"")
		            .body(file);
	}
	 
	
	/*
	 * @GetMapping("/files/{id}") public String viewFile(@PathVariable Long id,
	 * Model model) throws MalformedURLException { String filename =
	 * service.getFileNameById(id); Path fileStorageLocation
	 * =Paths.get(filename).toAbsolutePath().normalize(); Resource file = new
	 * UrlResource(fileStorageLocation.toUri());
	 * 
	 * if (filename == null || filename.isEmpty()) { model.addAttribute("message",
	 * "File not found for accountId: " + id); return "fileStatusPage"; // JSP to
	 * show the status } if (!Files.exists(fileStorageLocation)) {
	 * model.addAttribute("message", "File does not exist on the server: " +
	 * filename); return "getSignUpDetails"; } if (!file.isReadable()) {
	 * model.addAttribute("message", "File exists but could not be read: " +
	 * filename); return "getSignUpDetails"; }
	 * 
	 * model.addAttribute("fileUrl",filename); // Adjust path if necessary return
	 * "getSignUpDetails"; // JSP to display the image }
	 */

	@Autowired
	private CardsServiceInterface cardService;

	/*
	 * @PostMapping("/saveCardDetails") public String saveCardDetails(DebitCard
	 * bean, Model model) throws Exception { try { if (bean != null) {
	 * EncryptionUtils.processEncryption(bean); } } catch (Exception e) {
	 * e.printStackTrace(); } cardService.saveCard(bean); DebitCard dc =
	 * cardService.getCardsDetails(); if (dc!= null) {
	 * EncryptionUtils.processDecryption(dc); } return "redirect:/addBank"; }
	 * 
	 * @GetMapping("/getCardsDetail") public String getCardsDetails(Model model) {
	 * DebitCard dc= cardService.getCardsDetails(); if (dc!= null) { try {
	 * EncryptionUtils.processDecryption(dc); } catch (Exception e) {
	 * e.printStackTrace(); } } model.addAttribute("dc",dc); return
	 * "getCardsDetails"; }
	 */
	@PostMapping("/saveCardDetails")
	public String saveCardDetails(DebitCard bean, Model model) throws Exception {
		try {
			if (bean != null) {
				EncryptionUtils.processEncryption(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		cardService.saveCard(bean);
		/*
		 * DebitCard dc = service.getCardById(1L); if (dc!= null) {
		 * EncryptionUtils.processDecryption(dc); }
		 */
		return "redirect:/addBank";
	}
	@GetMapping("/getCardsDetail")
	public String getCardsDetails( @RequestParam("accountId") Long id,Model model) {
		DebitCard dc= cardService.getCardById(id);
		if (dc!= null) {
			try {
				EncryptionUtils.processDecryption(dc);
				System.out.println(id + "===============@@@@@@@@@@@:::::getBankName::::::::" + dc.getNameOnCard()+"::::::::"+dc.getDebitCardNbr());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("dc",dc);
		return "getCardsDetails";
	}

	/*
	 * @PostMapping("/sendEmail") public String sendEmail(@RequestBody EmailRequest
	 * request) { service.sendSimpleMessage(request.getTo(),request.getSubject(),
	 * request.getMessage()); return "Email Sent Successfully!"; }
	 */
	 @GetMapping("/searchSignUpDetails")
	    public String searchSignUpDetails(@RequestParam("search") String searchQuery, Model model) {
	        List<EncryptionBean> results = service.searchSignUpDetails(searchQuery);
	    	List<EncryptionBean> decryptedList = new ArrayList<>();
			for (EncryptionBean item : results) {
				try {
					EncryptionUtils.processDecryption(item);
					String masked = StringUtil.maskAccountNumber(item.getAccountNumber());
					item.setAccountNumber(masked);
					decryptedList.add(item);
					System.out.println("===============:::::decryptedList::::::::" + decryptedList);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			model.addAttribute("list",decryptedList);
	        return "getSignUpDetails";
	    }
	 @GetMapping("/getforgotPage")
		public String getForgotPage() {

			return "getforgotPage";
		}
	 @GetMapping("/showPassbook")
		public String getPassBook() {

			return "passbook";
		}
	 
}
