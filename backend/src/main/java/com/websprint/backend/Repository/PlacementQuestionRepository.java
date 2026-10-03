package com.websprint.backend.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.PlacementQuestion;

public interface PlacementQuestionRepository extends JpaRepository<PlacementQuestion, Long> {

    List<PlacementQuestion> findBySubjectIdOrderByOrderIndex(Long subjectId);

    List<PlacementQuestion> findAllByOrderBySubjectIdAscOrderIndexAsc();
}
