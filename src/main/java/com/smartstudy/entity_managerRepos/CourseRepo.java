package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Course;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class CourseRepo {
    public static List<Course> getCourses() {
        try(EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Course", Course.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
