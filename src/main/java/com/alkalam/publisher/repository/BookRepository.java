package com.alkalam.publisher.repository;

import com.alkalam.publisher.entity.Book;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {

    //write a method to get the top 5 books by bo_id desc
    List<Book> findTop5ByOrderByBookIdDesc();

    Page<Book> findAll(Pageable pageable);

    Page<Book> findByBookTitleEnContainingIgnoreCase(String name, Pageable pageable);
    Page<Book> findByBookTitleArContainingIgnoreCase(String name, Pageable pageable);
    Page<Book> findByBookTitleArContainingIgnoreCaseAndBookCompanyId(String name, int bookCompanyId,Pageable pageable);
    Page<Book> findByBookCompanyId(int bookCompanyId,Pageable pageable);
}
