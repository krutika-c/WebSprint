package com.websprint.backend.Service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Repository.UserLevelProgressRepository;
import com.websprint.backend.Repository.UserPlacementResultRepository;
import com.websprint.backend.Repository.UserStreakRepository;
import com.websprint.backend.Repository.XpEventRepository;


@Service
public class AccountService {

    private final UserLevelProgressRepository progressRepository;
    private final UserPlacementResultRepository placementResultRepository;
    private final XpEventRepository xpEventRepository;
    private final MyAppUserRepository userRepository;   
    private final UserStreakRepository userStreakRepository;

    public AccountService(UserLevelProgressRepository progressRepository,
                          UserPlacementResultRepository placementResultRepository,
                          XpEventRepository xpEventRepository,
                          MyAppUserRepository userRepository,
                          UserStreakRepository userStreakRepository) {
        this.progressRepository = progressRepository;
        this.placementResultRepository = placementResultRepository;
        this.xpEventRepository = xpEventRepository;
        this.userRepository = userRepository;
        this.userStreakRepository = userStreakRepository;
    }

    @Transactional
    public void deleteAccount(Long userId) {
        progressRepository.deleteForUser(userId);
        placementResultRepository.deleteForUser(userId);
        xpEventRepository.deleteForUser(userId);
        userStreakRepository.deleteForUser(userId);
        userRepository.deleteById(userId);  
    }
}
