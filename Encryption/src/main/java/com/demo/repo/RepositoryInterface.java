package com.demo.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.ml.EncryptionBean;

public interface RepositoryInterface extends JpaRepository<EncryptionBean, Long> {
	@Query("SELECT e FROM EncryptionBean e WHERE e.isActive = 'Y'")
	List<EncryptionBean> findAllActive();
	
	@Query("SELECT e FROM EncryptionBean e WHERE e.isActive = 'Y'")
	Page<EncryptionBean> findAllActive(Pageable pageable);
	
	 @Query("SELECT e FROM EncryptionBean e WHERE e.username = :username AND e.password = :password AND e.isActive = 'Y'")
	 Optional<EncryptionBean> findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
	
	 @Query("SELECT e.filePath FROM EncryptionBean e WHERE e.accountId = :accountId AND e.isActive = 'Y'")
	 String getFilePath(@Param("accountId") Long id);
	 
	 @Query("SELECT s FROM EncryptionBean s WHERE " +
	           "LOWER(s.bankName) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
	           "CAST(s.password AS string) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
	           "CAST(s.aadhaarNumber AS string) LIKE CONCAT('%', :query, '%') OR " +
	           "CAST(s.mobileNumber AS string) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
	           "LOWER(s.bankName) LIKE LOWER(CONCAT('%', :query, '%'))")
	 List<EncryptionBean> findByKeyword(String query);
}
