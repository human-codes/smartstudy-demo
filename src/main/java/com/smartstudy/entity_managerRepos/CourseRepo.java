package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Course;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class CourseRepo extends BaseRepo<Course>{
    /*public static List<Course> getCourses() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Course", Course.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }*/

    public static Course getCourseById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Course.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Long count() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            String jpql = "SELECT COUNT(c) FROM Course c";
            return (Long) entityManager.createQuery(jpql).getSingleResult();
        }
    }
}
