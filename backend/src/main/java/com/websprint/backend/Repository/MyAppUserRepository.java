package com.websprint.backend.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.MyAppUser;

public interface MyAppUserRepository extends JpaRepository<MyAppUser, Long>{

    Optional<MyAppUser> findByEmail(String email);

    Optional<MyAppUser> findByUsername(String username);

    boolean existsByUsername(String username);
}