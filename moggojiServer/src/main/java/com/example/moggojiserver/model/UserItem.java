package com.example.moggojiserver.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.*;

@Builder
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long number;

    // 회원 정보
    private String id;
    private String pwd;
    private String email;
    private String name;
    private String gender;
    protected int age;

    private long imageNumber;
}
