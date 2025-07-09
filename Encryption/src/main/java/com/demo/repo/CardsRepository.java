package com.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.ml.DebitCard;

@Repository
public interface CardsRepository extends JpaRepository<DebitCard, Long> {

    @Modifying
    @Transactional
    @Query("UPDATE DebitCard d SET d.filePath = :filePath WHERE d.accountId = :accountId")
    int updateFilePath(@Param("filePath") String filePath, @Param("accountId") Long accountId);
}
