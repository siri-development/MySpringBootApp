package com.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.demo.ml.DebitCard;
import com.demo.ml.EncryptionBean;

@Component
public interface ServiceInterface {
	List<EncryptionBean> getAllSignUpDetails();
	Optional<EncryptionBean> authenticate(String username, String password);
	void save(EncryptionBean custBean);
	void updateCust(EncryptionBean cust,Long id);
	EncryptionBean getCustById(Long id);
	void deleteById(Long accountId);
	Page<EncryptionBean> getPaginatedSignUpDetails(Pageable pageable);
	void store(MultipartFile file,EncryptionBean b);
	Resource loadAsResource(String filename);
	//void sendSimpleMessage(String string, String string2, String string3);
	String getFileNameById(Long id);
	List<EncryptionBean> searchSignUpDetails(String searchQuery);

}
