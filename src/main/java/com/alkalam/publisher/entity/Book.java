package com.alkalam.publisher.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "p_books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bo_id")
    private Integer bookId;

    @Column(name = "bo_title_ar")
    private String bookTitleAr;

    @Column(name = "bo_title_fg")
    private String bookTitleEn;

    @Column(name = "bo_sub_desc")
    private String bookSubDesc;

    @Column(name = "bo_code")
    private String bookCode;

    //add relation to company
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "bo_com_id", referencedColumnName = "com_id")
    private Company company;

    @Column(name = "bo_com_id", insertable = false, updatable = false)
    private int bookCompanyId;


}
