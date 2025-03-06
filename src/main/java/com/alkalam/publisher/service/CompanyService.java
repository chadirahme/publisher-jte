package com.alkalam.publisher.service;

import java.util.List;

import com.alkalam.publisher.entity.Book;
import com.alkalam.publisher.entity.Company;
import com.alkalam.publisher.repository.BookRepository;
import com.alkalam.publisher.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private BookRepository bookRepository;

    public List<Company> findAll() {
        return companyRepository.findAll();
    }

    public List<Book> findAllBook() {
        return bookRepository.findTop5ByOrderByBookIdDesc();
    }

    public Page<Book> findAllPageBook(Pageable pageable ) {
        return bookRepository.findAll(pageable);
    }

    public Page<Book> findByBookTitleEnContainingIgnoreCase(String name, Pageable pageable) {
        return bookRepository.findByBookTitleEnContainingIgnoreCase(name,pageable);
    }

    public Page<Book> findByBookTitleArContainingIgnoreCase(String name, Pageable pageable) {
        return bookRepository.findByBookTitleArContainingIgnoreCase(name,pageable);
    }

    public Page<Book> findByBookTitleArContainingIgnoreCaseAndBookCompanyId(String name,int companyId, Pageable pageable) {
        return bookRepository.findByBookTitleArContainingIgnoreCaseAndBookCompanyId(name,companyId,pageable);
    }

    public Page<Book> findByBookCompanyId(int companyId, Pageable pageable) {
        return bookRepository.findByBookCompanyId(companyId,pageable);
    }

}
