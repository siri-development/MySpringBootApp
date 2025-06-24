package com.demo.service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.demo.repo.CardsRepository;
import com.demo.repo.RepositoryInterface;
import com.demo.util.StringUtil;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import com.demo.ml.EncryptionBean;

@Service
public class ServiceImpl implements ServiceInterface {

	@Autowired
	private RepositoryInterface repo;
	@Autowired
	private CardsRepository cardsRepo;

	@Override
	public List<EncryptionBean> getAllSignUpDetails() {
		return repo.findAllActive();
	}
	@Override
	public Optional<EncryptionBean> authenticate(String username, String password) {
	        return repo.findByUsernameAndPassword(username, password);
	}
	@Override
	public void save(EncryptionBean bean) {
		repo.save(bean);
	}

	@Override
	public EncryptionBean getCustById(Long id) {
		return repo.findById(id).orElse(null);
	}

	@Override
	public void updateCust(EncryptionBean bean, Long id) {
		Optional<EncryptionBean> existingEntity = repo.findById(id);
		if (existingEntity.isPresent()) {
			EncryptionBean existingBean = existingEntity.get();
			repo.save(existingBean);
		} else {
			throw new RuntimeException("Entity not found with id: " + id);
		}
	}

	@Override
	public void deleteById(Long id) {
		 Optional<EncryptionBean> optionalBank = repo.findById(id);

		    if (optionalBank.isEmpty()) {
		        throw new RuntimeException("Bank not found with id: " + id);
		    }

		    EncryptionBean bank = optionalBank.get();
		    bank.setIsActive("N"); // Assuming isActive is a String field
		    repo.save(bank);       // Save the updated record
	}

	@Override
	public Page<EncryptionBean> getPaginatedSignUpDetails(Pageable pageable) {
		return repo.findAllActive(pageable);
	}

	private final Path fileStorageLocation = Paths.get("D:/ProjectPics").toAbsolutePath().normalize();

	/*
	 * public ServiceImpl() { try { Files.createDirectories(fileStorageLocation); }
	 * catch (Exception ex) { throw new
	 * RuntimeException("Could not create the directory where the uploaded files will be stored."
	 * , ex); } }
	 */
	@Override
	public void store(MultipartFile file,EncryptionBean b) {
	    if (file.isEmpty()) {
	        throw new RuntimeException("Failed to store empty file.");
	    }
	    String originalFileName = StringUtil.cleanPath(file.getOriginalFilename());
	    if (originalFileName.contains("..")) {
	        throw new RuntimeException("Sorry! Filename contains invalid path sequence " + originalFileName);
	    }
	    
	    Path cleanedPath = Paths.get(originalFileName).normalize();
	    if (cleanedPath.startsWith("..")) {
	        throw new RuntimeException("Invalid file path sequence: " + originalFileName);
	    }
	    
	    String fileExtension = "";
	    int index = originalFileName.lastIndexOf('.');
	    if (index > 0) {
	        fileExtension = originalFileName.substring(index);
	    }
	    if (!fileExtension.isEmpty() && !fileExtension.matches("\\.[a-zA-Z0-9]+")) {
	        throw new RuntimeException("Invalid file extension: " + fileExtension);
	    }
	    
	    String newFileName = System.currentTimeMillis() +fileExtension;
	    
	    try {
	    	if (!Files.exists(fileStorageLocation)) {
	            Files.createDirectories(fileStorageLocation);
	            System.out.println("Directory created at: " + fileStorageLocation);
	        }
	    	else {
	    		System.out.println("fileStorageLocation Directory Exist*************");
	    	}
	    	Path targetLocation = fileStorageLocation.resolve(newFileName);
	    	System.out.println(":::::::::PATH::::::::::"+targetLocation);
	        try (InputStream inputStream = file.getInputStream()) {
	            Files.copy(inputStream, targetLocation, StandardCopyOption.REPLACE_EXISTING);
	            b.setFilePath(originalFileName);
	            cardsRepo.updateFilePath(targetLocation.toString(),b.getAccountId());
	        }
	    } catch (IOException ex) {
	        throw new RuntimeException("Could not store file " + originalFileName + ". Please try again!", ex);
	    }
	}


	@Override
	public Resource loadAsResource(String filename) {
		try {
			Path filePath = fileStorageLocation.resolve(filename).normalize();
			Resource resource = new UrlResource(filePath.toUri());
			if (resource.exists()) {
				return resource;
			} else {
				throw new RuntimeException("File not found " + filename);
			}
		} catch (Exception e) {
			throw new RuntimeException("File not found " + filename, e);
		}
	}
	@Autowired
	    private JavaMailSender emailSender;
	@Override
	public void sendSimpleMessage(String to, String subject, String text) {
        MimeMessage message = emailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
            emailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
	@Override
	public String getFileNameById(Long id) {
		return repo.getFilePath(id);
	}
	@Override
	public List<EncryptionBean> searchSignUpDetails(String searchQuery){
		return repo.findByKeyword(searchQuery);
	}
}
