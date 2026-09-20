package com.websprint.backend.Model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MyAppUserRepository extends JpaRepository<MyAppUser, Long>{

    Optional<MyAppUser> findByEmail(String email);

    Optional<MyAppUser> findByUsername(String username);

    boolean existsByUsername(String username);
}