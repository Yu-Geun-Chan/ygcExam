package com.example.demo.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.FaqService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Faq;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrFaqController {

	@Autowired
	private Rq rq;

	@Autowired
	private FaqService faqService;

	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "") String searchKeyword)
			throws IOException {

		Rq rq = (Rq) req.getAttribute("rq");

		int faqsCount = faqService.getQnasCount(searchKeyword);

		List<Faq> faqs = faqService.getForPrintQnas(searchKeyword);

		model.addAttribute("faqs", faqs);
		model.addAttribute("faqsCount", faqsCount);
		model.addAttribute("searchKeyword", searchKeyword);

		return "usr/faq/list";
	}
}
