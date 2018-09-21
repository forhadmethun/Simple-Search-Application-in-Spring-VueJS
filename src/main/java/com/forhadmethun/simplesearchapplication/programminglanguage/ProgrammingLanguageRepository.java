package com.forhadmethun.simplesearchapplication.programminglanguage;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProgrammingLanguageRepository extends JpaRepository<ProgrammingLanguageEntity,Long> {
    List<ProgrammingLanguageEntity> findByNameLike(String name);
}
