package com.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import com.demo.ml.DebitCard;

@Component
public interface CardsServiceInterface {
	List<DebitCard> getCardsDetails();
	void saveCard(DebitCard custBean);
	void updateCard(DebitCard cust,Long id);
	DebitCard getCardById(Long id);
	void deleteCardById(Long accountId);
	Page<DebitCard> getPaginatedSignUpDetails(Pageable pageable);

}
