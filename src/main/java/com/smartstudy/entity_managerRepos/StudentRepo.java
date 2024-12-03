package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Student;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class StudentRepo {
    public static Integer currentGroupId=0;

    public static List<Student> getStudents() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Student ", Student.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public static Student getStudentById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Student.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
