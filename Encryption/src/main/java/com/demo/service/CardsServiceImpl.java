package com.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.demo.controller.DebitAndCreditCardController;
import com.demo.ml.DebitCard;
import com.demo.ml.EncryptionBean;
import com.demo.repo.CardsRepository;
import com.demo.repo.RepositoryInterface;

@Service
public class CardsServiceImpl implements CardsServiceInterface{
	@Autowired
	private CardsRepository cardsRepo;

	@Override
	public List<DebitCard> getCardsDetails() {
		return cardsRepo.findAll();
	}

	@Override
	public void saveCard(DebitCard bean) {
		cardsRepo.save(bean);
	}

	@Override
	public DebitCard getCardById(Long id) {
		return cardsRepo.findById(id).orElseThrow(() -> new RuntimeException("Entity not found with id: " + id));
	}

	@Override
	public void updateCard(DebitCard bean, Long id) {
		Optional<DebitCard> existingEntity = cardsRepo.findById(id);
		if (existingEntity.isPresent()) {
			DebitCard existingBean = existingEntity.get();
			cardsRepo.save(existingBean);
		} else {
			throw new RuntimeException("Entity not found with id: " + id);
		}
	}

	@Override
	public void deleteCardById(Long id) {
		if (!cardsRepo.existsById(id)) {
			throw new RuntimeException("Entity not found with id: " + id);
		}
		cardsRepo.deleteById(id);
	}

	@Override
	public Page<DebitCard> getPaginatedSignUpDetails(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}
}
