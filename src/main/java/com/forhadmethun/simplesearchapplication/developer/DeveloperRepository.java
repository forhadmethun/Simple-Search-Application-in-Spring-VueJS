package com.forhadmethun.simplesearchapplication.developer;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeveloperRepository extends JpaRepository<DeveloperEntity,Long> {
    List<DeveloperEntity> findByEmailLike(String email);
}
