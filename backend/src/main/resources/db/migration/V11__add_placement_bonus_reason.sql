ALTER TABLE xp_events DROP CONSTRAINT xp_events_reason_check;

ALTER TABLE xp_events ADD CONSTRAINT xp_events_reason_check
    CHECK (reason IN (
        'LEVEL_COMPLETED',
        'PERFECT_SCORE',
        'STREAK_BONUS',
        'PLACEMENT_BONUS',
        'MANUAL_ADJUSTMENT'
    ));