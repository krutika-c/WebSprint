package com.websprint.backend.Service;

import java.time.LocalDate;
import java.time.ZoneOffset;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websprint.backend.Model.UserStreak;
import com.websprint.backend.Repository.UserStreakRepository;

@Service
public class StreakService {

    private final UserStreakRepository streakRepository;

    public StreakService(UserStreakRepository streakRepository) {
        this.streakRepository = streakRepository;
    }

    public record StreakResult(UserStreak streak, boolean extendedToday) {
    }

    public record StreakView(int current, int longest) {
    }

    /**
     * The streak rules, with no database involved so they are easy to unit test.
     * Returns true if the streak started or grew today, false if the user was already active today.
     */
    static boolean applyActivity(UserStreak streak, LocalDate today) {
        LocalDate last = streak.getLastActiveDate();

        if (today.equals(last)) {
            return false; // already counted today
        }

        if (last != null && last.plusDays(1).equals(today)) {
            streak.setCurrentStreak(streak.getCurrentStreak() + 1); // active yesterday -> extend
        } else {
            streak.setCurrentStreak(1); // first ever activity, or a day was missed -> start over
        }

        if (streak.getCurrentStreak() > streak.getLongestStreak()) {
            streak.setLongestStreak(streak.getCurrentStreak());
        }
        streak.setLastActiveDate(today);
        return true;
    }

    /** "Today" is decided in UTC for now. */
    @Transactional
    public StreakResult recordActivity(Long userId) {
        return recordActivity(userId, LocalDate.now(ZoneOffset.UTC));
    }

    @Transactional
    public StreakResult recordActivity(Long userId, LocalDate today) {
        UserStreak streak = streakRepository.findById(userId)
                .orElseGet(() -> new UserStreak(userId));

        boolean extended = applyActivity(streak, today);
        if (extended) {
            streakRepository.save(streak);
        }
        return new StreakResult(streak, extended);
    }

    /**
     * For display. If the user missed a whole day, the stored current_streak is out of date
     * (nothing resets it until they come back), so we show 0 in that case.
     */
    @Transactional(readOnly = true)
    public StreakView getStreak(Long userId) {
        LocalDate yesterday = LocalDate.now(ZoneOffset.UTC).minusDays(1);
        return streakRepository.findById(userId)
                .map(s -> {
                    boolean stillAlive = s.getLastActiveDate() != null
                            && !s.getLastActiveDate().isBefore(yesterday);
                    return new StreakView(stillAlive ? s.getCurrentStreak() : 0, s.getLongestStreak());
                })
                .orElse(new StreakView(0, 0));
    }
}