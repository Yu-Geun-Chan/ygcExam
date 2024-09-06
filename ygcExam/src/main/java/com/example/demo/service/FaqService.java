package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.FaqRepository;
import com.example.demo.vo.Faq;

@Service
public class FaqService {
	
	@Autowired
	private FaqRepository faqRepository;

	public FaqService(FaqRepository faqRepository) {
		this.faqRepository = faqRepository;
	}

	public int getFaqsCount(String searchKeyword, String name) {
		return faqRepository.getFaqsCount(searchKeyword, name);
	}

	public List<Faq> getForPrintFaqs(String searchKeyword,String name) {
		return faqRepository.getForPrintFaqs(searchKeyword, name);
	}

}
