package com.example.moggojiserver.repository;

import com.example.moggojiserver.model.AnswerItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AnswerRepository extends JpaRepository<AnswerItem, String> {
    Optional<AnswerItem> findById(String respondent);

}
