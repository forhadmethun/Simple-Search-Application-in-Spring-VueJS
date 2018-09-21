package com.forhadmethun.simplesearchapplication.language;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LanguageRepository extends JpaRepository<LanguageEntity,Long> {
    List<LanguageEntity> findByCodeLike(String code);
}
