package com.alkalam.publisher.controller;

import com.alkalam.publisher.entity.Book;
import com.alkalam.publisher.entity.Company;
import com.alkalam.publisher.service.CompanyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DashboardController {

    private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

    @Autowired
    private CompanyService companyService;

    @GetMapping("/company")
    public String reports(Model model) {
        // Add dynamic data to the model
        List<Company> allCompany = companyService.findAll();

        model.addAttribute("reportTitle", "Monthly Sales Report");
        model.addAttribute("reportData", List.of("January: $1000", "February: $1500", "March: $2000"));

        model.addAttribute("allCompany", allCompany);


        return "pages/company";
    }

    @GetMapping("/book")
    public String bookPage(Model model) {
        // Add dynamic data to the model
        List<Company> allCompany = companyService.findAll();
        model.addAttribute("companies", allCompany);
        model.addAttribute("companyId", 0);

        model.addAttribute("bookList", List.of());
        model.addAttribute("currentPage", 0);
        model.addAttribute("totalPages", 0);
        model.addAttribute("totalItems", 0L);
        model.addAttribute("size", 0);
        model.addAttribute("searchTerm", "");

        return "pages/book";
    }

    @PostMapping("/book")
    public String bookPage(@RequestParam(defaultValue = "0") int page,
                             @RequestParam(defaultValue = "10") int size,
                            @RequestParam(required = false) String search,
                           @RequestParam(required = false) Integer companyId,
            Model model) {
        // Add dynamic data to the model
        Pageable pageable = PageRequest.of(page, size);
        Page<Book> bookPage;
        if (search != null && !search.isEmpty()) {
            if(companyId==null || companyId==0){
            //bookPage = companyService.findByBookTitleEnContainingIgnoreCase(search, pageable); // Search by name
            bookPage = companyService.findByBookTitleArContainingIgnoreCase(search, pageable); // Search by name
        } else {
                bookPage = companyService.findByBookTitleArContainingIgnoreCaseAndBookCompanyId(search,companyId,pageable); // Fetch all books
            }

        }
        else {
            if(companyId==null || companyId==0){
            bookPage = companyService.findAllPageBook(pageable); // Fetch all books
            }else {
                bookPage = companyService.findByBookCompanyId(companyId,pageable);
            }// Fetch all books
        }


       // Page<Book> bookPage = companyService.findAllPageBook(pageable);
        List<Company> allCompany = companyService.findAll();

        model.addAttribute("bookList", bookPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", bookPage.getTotalPages());
        model.addAttribute("totalItems", bookPage.getTotalElements());
        model.addAttribute("size", size);
        model.addAttribute("searchTerm", search);
        model.addAttribute("companies", allCompany);
        model.addAttribute("companyId", companyId);
        // List<Book> bookList = companyService.findAllBook();
       // model.addAttribute("bookList", bookList);


        return "pages/book";
    }
}
