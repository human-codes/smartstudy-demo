package com.smartstudy.entity_managerRepos;

import com.smartstudy.entity.Payment;
import com.smartstudy.entity.Student;
import jakarta.persistence.EntityManager;

import java.util.List;

import static com.smartstudy.MyListener.EMF;

public class PaymentsRepo {
    public static Integer currentStudentId=0;

    public static List<Payment> getPayments() {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery("from Payment ", Payment.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
    public static Payment getPaymentById(Integer id) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.find(Payment.class,id);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}