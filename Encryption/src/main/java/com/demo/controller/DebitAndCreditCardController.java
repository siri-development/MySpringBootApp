package com.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.ml.DebitCard;
import com.demo.ml.EncryptionBean;
import com.demo.service.CardsServiceInterface;
import com.demo.service.ServiceInterface;
import com.demo.util.EncryptionUtils;
import com.demo.util.StringUtil;

public class DebitAndCreditCardController {
	@Autowired
	private CardsServiceInterface service;
	
	@PostMapping("/saveCardDetails")
	public String saveCardDetails(DebitCard bean, Model model) throws Exception {
		try {
			if (bean != null) {
				EncryptionUtils.processEncryption(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.saveCard(bean);
		DebitCard dc = service.getCardById(1L);
		if (dc!= null) {
			EncryptionUtils.processDecryption(dc);
		}
		return "redirect:/addBank";
	}

	@GetMapping("/getCardsDetail")
	public String getCardsDetails( @RequestParam("accountId") Long id,Model model) {
		DebitCard dc= service.getCardById(id);
		if (dc!= null) {
			try {
				EncryptionUtils.processDecryption(dc);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("dc",dc);
		return "getCardsDetails";
	}

}
